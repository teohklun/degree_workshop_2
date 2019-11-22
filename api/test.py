from deep_emotion_recognition import DeepEmotionRecognizer
# initialize instance
# inherited from emotion_recognition.EmotionRecognizer
# default parameters (LSTM: 128x2, Dense:128x2)
deeprec = DeepEmotionRecognizer(emotions=['sad', 'neutral', 'happy'], n_rnn_layers=2, n_dense_layers=2, rnn_units=128, dense_units=128)
# train the model
deeprec.train()
# get the accuracy
# predict angry audio sample
prediction = deeprec.predict('try.wav')
print(f"Prediction: {prediction}")
print(f"Prediction: {deeprec.predict_proba('try.wav')}")