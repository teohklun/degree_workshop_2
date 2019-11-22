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
import keras

import base64

#documentation part
# actual route to be used by apk
# api_emo_face, api_speech, pick

# possible to be do function
# execute spray,


app = flask.Flask(__name__)
app.config["DEBUG"] = True

receiveAudio = "received_sound/received.mp4"
receiveVideo = "received_sound/video.mp4"
# serverReceiveAudio = "received_sound/video_received.mp4"
serverAudioFile = "received_sound/received.wav"

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
    result = predict_emo_face()
    dictResult = {}
    dictResult["processed"] = "api_emo_face"
    dictResult["result"] = result
    
    return json.dumps(dictResult)

def predict_emo_face():
    #the logic to implement
    return "happy"

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
