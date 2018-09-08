#!/usr/bin/env python 1
# -*- coding: utf-8 -*-

import paho.mqtt.client as mqtt
import sys
import MySQLdb
import smtplib
import mimetypes
import time

#time.sleep(240)
global supero
supero = False
global supero2
supero2 = False

# Abrir conexión con bases de datos
try:
    db = MySQLdb.connect("localhost","root","","aire_db")
except:
    print("No se pudo conectar con la base de datos")
    print("Cerrando...")
    sys.exit()

# Preparando cursor
cursor = db.cursor()

# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Conectado - Codigo de resultado: "+str(rc))

    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("/#")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    print(msg.topic+" "+str(msg.payload))
    lista = msg.topic.split("/")

# Realiza la insercion de los mensajes en la base de Datos.   
    sql = """INSERT INTO `aire_db`.`mqtt_db` (`Id`, `Usuario`, `Topic`, `Mensaje`, `Fecha`) VALUES (NULL, '""" + lista[1]+ """', '""" + lista[2] + """', '""" + str(msg.payload) + """', CURRENT_TIMESTAMP);"""

    try:
        # Ejecutar un comando SQL
        cursor.execute(sql)
        db.commit()
        print("Guardando en base de datos...OK")
    except:
        db.rollback()
        print("Guardando en base de datos...Falló")

# Realiza el envio de notificaciones a los correos        
    global supero
    global supero2
    global emisor
    global password 
    global receptor

    if str(lista[2]) == "temperatura" and float(msg.payload) <= 26:
       supero = False

    if supero == False and str(lista[2]) == "temperatura" and float(msg.payload) > 26:
        supero = True

        from email.MIMEText import MIMEText
        from smtplib import SMTP
        
        emisor = "notificacion.aires@gmail.com"
        password = "Admin_Aires"
        receptor = "duban.pedraza@outlook.com"
        
        print("Enviando Email...")
     
        # Configuracion del mensaje
        mensaje = MIMEText("La temperatura de la " + lista[1] + " es de: " + str(msg.payload) + " C")
        mensaje['From']=emisor
        mensaje['To']=receptor
        mensaje['Subject']= "--Advertencia--La temperatura de la " + lista[1] + " supero los 26C"
        
        try:
            # Nos conectamos al servidor SMTP de Gmail
            serverSMTP = smtplib.SMTP('smtp.gmail.com',587)
            serverSMTP.ehlo()
            serverSMTP.starttls()
            serverSMTP.ehlo()
            serverSMTP.login(emisor,password)
            print("Conectado con exito al servidor SMTP...")
        except:
            print("Error al intentar conectarse al servidor SMTP...")
     
        try:
            # Enviamos el mensaje
            serverSMTP.sendmail(emisor,receptor,mensaje.as_string())
            # Cerramos la conexion
            serverSMTP.close()
            print("Email enviado con exito Con Mensaje de Advertencia del " + lista[1])
        except:
            print("Error al intentar enviar el email...")
            
    if str(lista[2]) == "temperatura" and float(msg.payload) <= 30:
       supero2 = False
       
    if supero2 == False and str(lista[2]) == "temperatura" and float(msg.payload) > 30:
        supero2 = True

        from email.MIMEText import MIMEText
        from smtplib import SMTP
        
        #emisor = "notificacion.aires@gmail.com"
        #password = "Admin_Aires"
        #receptor = "duban.pedraza@outlook.com"
        
        print("Enviando Email...")
     
        # Configuracion del mensaje
        mensaje = MIMEText("La temperatura de la " + lista[1] + " es de: " + str(msg.payload) + " C")
        mensaje['From']=emisor
        mensaje['To']=receptor
        mensaje['Subject']= "!ALERTA! La temperatura de la " + lista[1] + " supero los 30 C"
        
        try:
            # Nos conectamos al servidor SMTP de Gmail
            serverSMTP = smtplib.SMTP('smtp.gmail.com',587)
            serverSMTP.ehlo()
            serverSMTP.starttls()
            serverSMTP.ehlo()
            serverSMTP.login(emisor,password)
            print("Conectado con exito al servidor SMTP...")
        except:
            print("Error al intentar conectarse al servidor SMTP...")
     
        try:
            # Enviamos el mensaje
            serverSMTP.sendmail(emisor,receptor,mensaje.as_string())
            # Cerramos la conexion
            serverSMTP.close()
            print("Email enviado con exito Con Mensaje de ALERTA del " + lista[1])
        except:
            print("Error al intentar enviar el email...")

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

try:
    client.connect("m11.cloudmqtt.com", 11628, 60)
except:
    print("No se pudo conectar con el MQTT Broker...")
    print("Cerrando...")
    db.close()
    sys.exit()   
    
client.username_pw_set("cumwoxhb", "L06ml3PKNufg")

try:
    client.loop_forever()
except KeyboardInterrupt:  #precionar Crtl + C para salir
    print("Cerrando...")
    db.close()
