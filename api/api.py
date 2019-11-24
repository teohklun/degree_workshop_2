import flask
import werkzeug
import json
import sys
from flask import request
import ast
import os
import cv2

from ffmpy3 import FFmpeg
from urllib.parse import unquote
import wave
import struct
import numpy as np

import speech_recognition as sr

import sys
import importlib
sys.path.insert(0, os.path.dirname(__file__) + './speech_emotion')

import speech_emotion
from speech_emotion import deep_emotion_recognition
# from tensorflow import keras

import keras

import base64


from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model
from collections import deque
import numpy as np
import argparse
import imutils
import pickle
import cv2

#documentation part
# actual route to be used by apk
# api_emo_face, api_speech, pick

# possible to be do function
# execute spray,


app = flask.Flask(__name__)
app.config["DEBUG"] = True

receiveAudio = "received/sound/sound.mp4"
receiveVideo = "received/video/video.mp4"
# serverReceiveAudio = "received_sound/video_received.mp4"
serverAudioFile = "received/sound/sound.wav"

byteToSplit = b"--aaWEdFXvDF--\r\n"
def function_1():
    return '111'

@app.route('/', methods=['GET'])
def home():
    return "<h1>Distant Reading Archive</h1><p>This site is a prototype API for distant reading of science fiction novels.</p>"

@app.route('/test', methods=['GET'])
def test():
    return function_1()

def convertAudioFormat():
    # c6md = "ffmpeg/bin/ffmpeg -i received_sound/received.mp4 -vn -ar 44100 -ac 2 -ab 192k -f mp3 new.wav"
    # os.system(cmd)
    ff = FFmpeg(
            inputs={"received_sound/received.mp4" : None},
            outputs={"received_sound/" + "received.wav": '-vn -ar 16000 -ac 1 -ab 192k -f wav'}
            # outputs={"received_sound/" + "received.wav": '-vn -ar 44100 -ac 2 -ab 192k -f wav'}
            )
    ff.cmd
    ff.run()

@app.route('/api_speech', methods = ['POST'])
def api_speech():
    data = get_array_request_data()[1]
    array = request.data.split(byteToSplit)
    test = array[1:]
    data = b""

    for member in test:
        data += member
    createAudioFromDataReceived(receiveAudio, data)
    convertAudioFormat()

    dictResponse = {}
    dictResponse["processed"] = "api_speech"
    dictResponse["result"] = recognize_speech()
    dictResponse["actionType"] = get_param_action()
    # dictResponse["speech_emotion_result"] = emotion_speech_test()
    jsonDictRespoonse = json.dumps(dictResponse)
    print("String to Return : " + jsonDictRespoonse) 
    return jsonDictRespoonse

def get_param_action(): 
    array = get_array_request_data()
    # print(array)
    stringArray = array[0].decode().split("=")
    # print(stringArray)
    action = stringArray[1]
    
    return action


def get_array_request_data():
    array = request.data.split(byteToSplit)
    return array


@app.route("/api_emo_face", methods = ['POST'])
def api_emo_face(): 

    data = get_array_request_data()[1]
    array = request.data.split(byteToSplit)
    test = array[1:]
    data = b""

    for member in test:
        data += member
    createAudioFromDataReceived(receiveVideo, data)
    dictResult = {}
    dictResult["processed"] = "api_emo_face"
    dictResult["result"] = predict_emo_face()
    
    return json.dumps(dictResult)

def createAudioFromDataReceived(fileName, data):
    with open(fileName, 'wb') as wfile:
        wfile.write(data)

@app.route('/google_speech_to_text', methods = ['POST'])
def recognize_speech():
    
    r=sr.Recognizer()
    print("Reconizing audio source file . . .")
    soundSource = sr.AudioFile(serverAudioFile)
    with soundSource as source:
        r.adjust_for_ambient_noise(source)
        audio = r.record(source)
    print("Reconized process done . . .")
    MessageToReturn = ""

    os.remove(receiveAudio)
    print("Receive File Removed!")

    os.remove(serverAudioFile)
    print("Server File Removed!")
    try:
        MessageToReturn = "Google Speech Recognition thinks you said " + r.recognize_google(audio)
    except sr.UnknownValueError:
        MessageToReturn = "Google Speech Recognition could not understand audio"
    except sr.RequestError as e:
        MessageToReturn = "Could not request results from Google Speech Recognition service; {0}".format(e)
        return 0
    print("Message going to send . . .!")
    print("The message extract from speech is : " + MessageToReturn)
    dictResult = {}
    dictResult["processed"] = "api_speech"
    dictResult["result"] = decide_action_from_message(MessageToReturn)
    dictResult["action"] = get_param_action
    # return json.dumps(dictResult)
    return decide_action_from_message(MessageToReturn)

def decide_action_from_message(Message):
    import re

    if re.search(r'\b' + "yes" + r'\b', Message):
        return "1"
    elif re.search(r'\b' + "no" + r'\b', Message):
        return "2"
    else:
        return "3"
    # if "yes" in Message : 
    #     # return '{ "result":1}'
    #     return "1"
    # elif "no" in Message :
    #     # return '{ "result":2}'
    #     return "2"
    # else:
    #     # return '{ "result":3}'
    #     return "3"

# testing code
@app.route('/api', methods=['post'])
def api():
    x =  '{ "name":"John"}'
    
    return x


#return string
@app.route('/emotion_speech_test')
def emotion_speech_test():
    with keras.backend.get_session().graph.as_default():
        fileToTestPath = serverAudioFile
        deeprec = deep_emotion_recognition.DeepEmotionRecognizer(emotions=['sad', 'neutral', 'happy'], n_rnn_layers=2, n_dense_layers=2, rnn_units=128, dense_units=128)
        # train the model
        deeprec.train()
        prediction = deeprec.predict(fileToTestPath)
        print(f"Prediction: {prediction}")
        print(f"Prediction: {deeprec.predict_proba(fileToTestPath)}")
        os.remove(receiveAudio)
        print("Receive File Removed!")

        os.remove(serverAudioFile)
        print("Server File Removed!")
        return prediction

@app.route('/emo_face', methods=['post', 'get'])
def predict_emo_face():
    detection_model_path = 'emo_face/haarcascade_files/haarcascade_frontalface_default.xml'
    # emotion_model_path = 'models/_mini_XCEPTION.106-0.65.hdf5'
    emotion_model_path = 'emo_face/models/_mini_XCEPTION.42-0.78.hdf5'
    size =128

    # load the trained model and label binarizer from disk
    print("[INFO] loading...")
    face_detection = cv2.CascadeClassifier(detection_model_path)
    emotion_classifier = load_model(emotion_model_path, compile=False)
    # EMOTIONS = ["angry" ,"disgust","scared", "happy", "sad", "surprised",
    #   "neutral"]
    EMOTIONS = ["happy", "sad", "neutral"]

    # initialize the image mean for mean subtraction along with the
    # predictions queue
    mean = np.array([123.68, 116.779, 103.939][::1], dtype="float32")
    Q = deque(maxlen=128)

    # initialize the video stream, pointer to output video file, and
    # frame dimensions
    camera = cv2.VideoCapture(0)
    '''emo_list = []
    prob_list = []
    take_this = 0'''
    # loop over frames from the video file stream

    # cap = cv2.VideoCapture('../degree_workshop_2/api/received_sound/happy.mp4')
    cap = cv2.VideoCapture('received_sound/video.mp4')
    count = {}
    count['happy'] = 0
    count['sad'] = 0
    count['neutral'] = 0

    while(cap.isOpened()):
        ret, frame = cap.read()
    # while True:

        if(ret):
            # _, frame = camera.read()
            # reading the frame
            #frame = imutils.resize(frame,width=400)
            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            faces = face_detection.detectMultiScale(gray,scaleFactor=1.1,minNeighbors=5,minSize=(30,30),flags=cv2.CASCADE_SCALE_IMAGE)
            # print("test0")
            
            
            canvas = np.zeros((250, 300, 3), dtype="uint8")
            frameClone = frame.copy()
            if len(faces) > 0:
                faces = sorted(faces, reverse=True,
                key=lambda x: (x[2] - x[0]) * (x[3] - x[1]))[0]
                (fX, fY, fW, fH) = faces
                # Extract the ROI of the face from the grayscale image, resize it to a fixed 48x48 pixels, and then prepare
                # the ROI for classification via the CNN
                roi = gray[fY:fY + fH, fX:fX + fW]
                roi = cv2.resize(roi, (48, 48))
                roi = roi.astype("float") / 255.0
                roi = img_to_array(roi)
                roi = np.expand_dims(roi, axis=0)
                # print("test1")
                
                preds = emotion_classifier.predict(roi)[0]
                emotion_probability = np.max(preds)
                label = EMOTIONS[preds.argmax()]
                # print("test2")
                

                highest_prob = 0

                for (i, (emotion, prob)) in enumerate(zip(EMOTIONS,preds)):
                        # construct the label text
                        text = "{}: {:.2f}%".format(emotion, prob * 100)
                        w = int(prob * 300)
                        cv2.rectangle(canvas, (7, (i * 35) + 5),
                        (w, (i * 35) + 35), (0, 255, 0), -1)
                        cv2.putText(canvas, text, (10, (i * 35) + 23),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.45,
                        (255, 255, 255), 2)
                        cv2.putText(frameClone, label, (fX, fY - 10),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.45, (0, 255, 0), 2)
                        cv2.rectangle(frameClone, (fX, fY), (fX + fW, fY + fH),
                                    (255, 0, 0), 2)
                        # print(emotion)
                        # print(prob)

                        if(prob > highest_prob):
                            highest_prob = prob
                            predict_emo = emotion
                            count[emotion] +=1

                # print(predict_emo)

                output = frame.copy()
                frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                frame = cv2.resize(frame, (224, 224)).astype("float32")
                frame -= mean
                
                # cv2.imshow('your_face', frameClone)
                # cv2.imshow("Probabilities", canvas)
                
                '''sort_prob = prob_list
                sort_prob.sort()
                print(len(sort_prob))
                for i in range(len(sort_prob)):
                    print(i)
                    if sort_prob[0] == prob_list[i]:
                        take_this = i
                        print(take_this)
                        print(len(emo_list))
                        break
                        
                    else:
                        i += 1
            
                print(emo_list[take_this])
                #emo_list.clear()
                del emo_list[:]'''

                #cv2.imshow('your_face', frameClone)
                #cv2.imshow("Probabilities", canvas)
                
            # if cv2.waitKey(0) & 0xFF == ord('q'):
            #     break
        else:
            break
            
    print("[INFO] cleaning up...")
    cap.release()

    if(count['happy'] > count['sad'] and count['happy'] > count['neutral']):
        estimate_video_emotion = 'happy'
    elif(count['sad'] > count['happy'] and count['sad'] > count['neutral']):
        estimate_video_emotion = 'sad'
    else:
        estimate_video_emotion = 'neutral'
    print("predicted as : " + estimate_video_emotion)

    return estimate_video_emotion

@app.route('/pick')
def pick():
    print("request" + request.args.get('action'))
    action = request.args.get('action') #this will either get happy or no happy
    print("process Pick ...")
    print("process Pick ended.")

    actionType = action

    result = True #to be declare in the picking function

    dictResult = {}
    dictResult["processed"] = "pick"
    dictResult["actionType"] = actionType
    dictResult["abcDEF"] = "something"
    dictResult["result"] = result
    result = json.dumps(dictResult)
    # emotion_speech_test() #test emotion_speech_test from android
    return result

ipv4Addr = '192.168.137.1'
ipv4Addr = '192.168.43.172'
# ipv4Addr = '10.200.51.29';
# app.run(host='192.168.137.1')
app.run(host=ipv4Addr)

# app.run(host='192.168.0.128')

# app.run()
