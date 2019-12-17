#!/usr/bin/env pybricks-micropython

from pybricks import ev3brick as brick
from pybricks.ev3devices import (Motor, TouchSensor, ColorSensor,
                                 InfraredSensor, UltrasonicSensor, GyroSensor)
from pybricks.parameters import (Port, Stop, Direction, Button, Color,
                                 SoundFile, ImageFile, Align)
from pybricks.tools import print, wait, StopWatch
from pybricks.robotics import DriveBase
from time import sleep
from ev3dev2.motor import SpeedDPS, SpeedRPM, SpeedRPS, SpeedDPM

# Write your program here
###################################### no change to any other code except for pick item #################################################
brick.sound.beep(5)
rotator_motor = Motor(Port.B) #,Direction.CLOCKWISE, [12, 36]
arm_motor = Motor(Port.D)
claw_motor = Motor(Port.A)
aromatherapy_motor = Motor(Port.C)

def happy():
    brick.sound.beep()
    rotator_motor.run_time(-900,1000) #ke arah aromatherapy
    claw_motor.run_time(1000,1500) #buka
    claw_motor.run_time(-1000,1500) #cengkam
    rotator_motor.run_time(900,1000) #tengah
    claw_motor.run_time(1000,1500) #buka
    claw_motor.run_time(-1000,1500) #cengkam
    rotator_motor.run_time(900,1000) #ke arah lawan aromatherapy
    claw_motor.run_time(1000,1500) #buka
    claw_motor.run_time(-1000,1500) #cengkam
    rotator_motor.run_time(-900,1000) #tengah
    claw_motor.run_time(1000,1500) #buka
    claw_motor.run_time(-1000,1500) #cengkam
    arm_motor.run_time(-500,700,Stop.HOLD) #gerak ke atas
    claw_motor.run_time(1000,1500) #buka
    arm_motor.run_time(900,1500) #gerak ke bawh
    claw_motor.run_time(-1000,1500) #cengkam
    arm_motor.run_time(-500,700,Stop.HOLD) #gerak ke atas

#replace pick_item() code with this one
def pick_item_stack():
    i = 1000
    j= 700
    claw_motor.run_time(1000,1500) #buka

    rotator_motor.run_time(700,900) #ke arah lawan aromatherapy

    arm_motor.run_time(200,i,Stop.HOLD) #gerak ke bawh

    sleep(1)
    claw_motor.run_time(-1000,3000) #cengkam

    arm_motor.run_time(-500,j,Stop.HOLD) #gerak ke atas
    rotator_motor.run_time(-700,900) #ke TGH
    arm_motor.run_time(200,i,Stop.HOLD) #gerak ke bawh
    claw_motor.run_time(1000,1500) #buka
    arm_motor.run_time(-500,j,Stop.HOLD) #gerak ke atas
    claw_motor.run_time(-1000,3000) #cengkam

    
    i = i+200
    j = j+200
    return j
    return i
    
def arom_butt():
    aromatherapy_motor.run_time(-500,3000)#tekan
    aromatherapy_motor.run_time(500,3000)#lepas

def sad():
    arom_butt()
    pick_item_stack()

sad()

# while True:
# #   arom_butt()
#    #claw_motor.run_time(-1000,3000) #cengkam
#    pick_item_stack()
#    #pick_item_stack()
#     #original_pos_give()
# #    rotator_motor.on_for_seconds(150,300) #ke arah lawan aromatherapy
#    happy()
#    #happy()
# #   sleep(1)
# #   pick_item()
# #   claw()
# #   sleep(1)
# #   arm()
#   # sleep(1)
# #   rotate()
#    break

