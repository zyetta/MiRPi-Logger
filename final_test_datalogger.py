#--------------------Included Packages--------------------
import paho.mqtt.client as mqtt
import os
import ast
import time
import csv
import platform
import subprocess

#Test Name
Test_Name = "Final Test"

#MQTT Broker Informatin
broker_address="localhost"
broker_port = 1883
refresh_rate = 5
time_out = 45
username = "mqtt"
password = "gJGResE%0puwsX8%V$tp*01z2RJz0u88OFdjkDyO7*V0Yjo"

Addresses = [
    "10.42.0.2",
    "10.42.0.3",
    "10.42.0.4",
    "10.42.0.5",
    "10.42.0.6",
    "10.42.0.7",
    "10.42.0.8",
    "10.42.0.9"
            ]

#CSV Data
Fields = ['Time', 'Device', 'Data']

def ping_state():
    State = 0
    for i in Addresses:
        print("Pinging: " + str(i))
        param = '-n' if platform.system().lower()=='windows' else '-c'
        command = ['ping', param, '1', i]
        if(subprocess.call(command) == 0):
            State = 1
        else:
            State = 0
        payload = {
            "Time": time.time(),
            "Device": str(i),
            "Data": int(State)
        }
        writeCSV(Folder + "/State.csv", 0, Fields, payload)

def writeCSV(FILE, STATE, FIELDS, DATA):
    if(STATE == 1):
        with open(FILE, mode='w', newline='') as csv_file:
            # Write Field Names
            writer = csv.DictWriter(csv_file, fieldnames=FIELDS)
            writer.writeheader()
    elif(STATE == 0):
        with open(FILE, mode='a', newline='') as csv_file:
            # Write DATA
            writer = csv.DictWriter(csv_file, fieldnames=FIELDS)
            writer.writerow(DATA)

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("Connected to broker")
        client.subscribe("sensors/#", 0)     
        client.subscribe("hub/#", 0)
        client.subscribe("devices/#", 0)    
    else:
        print("Connection failed")

def on_message(client,userdata, msg):        
    topic = str(msg.topic)
    msg = ast.literal_eval(str(msg.payload.decode("utf-8")))
    try:
        if(topic[0:7] == "sensors"):
            payload = {
                "Time": time.time(),
                "Device": int(msg["ID"]),
                "Data": float(msg["CURR"])
            }
            writeCSV(Folder + "/Sensors.csv", 0, Fields, payload)    
        elif(topic[0:3] == "hub"):
            print("Hubs Recieved")
            payload = {
                "Time": time.time(),
                "Device": int(msg["2"]),
                "Data": int(msg["3"])
            }       
            writeCSV(Folder + "/Hub.csv", 0, Fields, payload)    
        elif(topic[0:7] == "devices"):
            print("Devices Recieved")
            payload = {
                "Time": time.time(),
                "Device": str(msg["IP"]),
                "Data": float(msg["CPU"])
            }       
            writeCSV(Folder + "/Devices.csv", 0, Fields, payload) 
    except Exception as e:
        print(e)

def on_subscribe(mosq, obj, mid, granted_qos):
    print("Subscribed")
    pass


#Create Files
i = 1
Folder = "./" + Test_Name + "_" + str(i)
while(os.path.isdir(Folder)):    
    i += 1
    Folder = "./" + Test_Name + "_" + str(i)
os.mkdir(Folder)

writeCSV(Folder + "/Sensors.csv", 1, Fields, "")  
writeCSV(Folder + "/Devices.csv", 1, Fields, "")
writeCSV(Folder + "/Hub.csv", 1, Fields, "")
writeCSV(Folder + "/State.csv", 1, Fields, "")
   
client_name = mqtt.Client()
client_name.on_connect = on_connect
client_name.on_subscribe = on_subscribe
client_name.on_message = on_message
client_name.username_pw_set(username = username, password=password)

try:
    client_name.connect(broker_address, broker_port, time_out)
    client_name.loop_start()










finally:
    i = 0
    while(1):
        i += 1
        if(i % 10000000 == 0):
            ping_state()
        pass



