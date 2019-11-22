import speech_recognition as sr

audioFile = "no.wav"

# r=sr.Recognizer()
# with sr.Microphone() as source:
r=sr.Recognizer()
print("Reconizing audio source file . . .")
soundSource = sr.AudioFile(audioFile)
with soundSource as source:
    r.adjust_for_ambient_noise(source)
    audio = r.record(source)
print("Reconized process done . . .")
MessageToReturn = ""
try:
    print("Google Speech Recognition thinks you said " + r.recognize_google(audio))
except sr.UnknownValueError:
    print("Google Speech Recognition could not understand audio")
except sr.RequestError as e:
    print("Could not request results from Google Speech Recognition service; {0}".format(e))