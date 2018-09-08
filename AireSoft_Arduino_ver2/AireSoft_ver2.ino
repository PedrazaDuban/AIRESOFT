#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <EEPROM.h>
#include <PubSubClient.h>
#include <DHT.h>
#include <Adafruit_Sensor.h>
#ifndef UNIT_TEST 
#include <Arduino.h> 
#endif 
#include <IRremoteESP8266.h> 
#include <IRsend.h> 


//-------------------VARIABLES GLOBALES--------------------------
//int contconexion = 0;
////vaRIABLES DEL SENSOR DTH11------
int contconexion = D5;
#define DHTPIN 14
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);
/////-----otras necesarias para aire----
IRsend irsend(4); // An IR LED is controlled by GPIO pin 4 (D2)
///------- servidor MQTT-----------
char SERVER[50]   = "54.83.70.20"; //"m11.cloudmqtt.com"
int SERVERPORT   = 11628;
//---------------------------------
char ssid[50];      
char pass[50];
char USERNAME [50];
char PASSWORD[50];
char ip[50];
char gateway[50];
char subnet[50];
String USERNAME1;


unsigned long previousMillis = 0;

char charPulsador [15];
String strPulsador;
String strPulsadorUltimo;

char PLACA[50];
char valueStr[15];
String strtemp = "";
String strhum = "";
char TEMPERATURA[50];
char HUMEDAD[50]; ////-------la declare para leer la humedad
char PULSADOR[50];
char SALIDADIGITAL[50];

//---Parametros del punto de acceso----
const char *ssidConf = "AireSoft";
const char *passConf = "admin123";

String mensajeGuardar = "";
String mensajeEscanear = "";

//-----------CODIGO HTML PAGINA DE CONFIGURACION---------------
String pagina1 = "<!DOCTYPE html>"
"<html>"
"<head>"
"<title>INGRESO DE DATOS PARA WIFI Y DISPOSITIVO</title>"
"<meta charset='UTF-8'>"
"</head>"
"<style>"
"* {box-sizing: border-box;}"
"body{margin:0;  font-family: sans-serif; background:#204862;}"
"h1{color:#fff;text-align: center;}"
".form-register{  width:98%; max-width:500px; margin:auto; background:white; border-radius: 7px;}"
".form_titulo{ background:deepskyblue; color:#fff; padding:20px; text-align: center; font-size:25px; border-top-left-radius:7px; border-top-right-radius:7px; border-bottom:3px solid crimson;}"
".contenedor-inputs{ padding:10px 30px; display: flex; flex-wrap:wrap; justify-content: space-between;}"
"input{ margin-bottom:15px; padding:15px; font-size:13px; border-radius:3px;  border:1px solid darkgrey;}"
".input-48{ width: 48%;}"
".input-100{  width: 100%;}"
".btn-enviar{ background:crimson; color:#fff; padding:5px 30px; font-size:14px;}"
".btn-enviar:active{transform:scale(1.05);}"
".btn-escanear{background:crimson; color:#fff; padding:5px 30px; font-size:14px;}"
".btn-escanear:active{ transform:scale(1.05);}"
"p {display: block; width: 100%; color: #424242; margin-top: 1em; margin-bottom: 1em; margin-left: 0; margin-right: 0;}"
"label{ background:crimson; color:#fff; width: 100%; padding:5px 30px; margin-bottom:5px; border-radius:3px;}"
"</style>"
"<body>"
"<h1>INGRESO DE DATOS PARA AIRESOFT</h1>"
"<form action='guardar_conf' method='post' class='form-register'>"
"<h2 class='form_titulo'>ASOCIAR DISPOSITIVO</h2>"
"<div class='contenedor-inputs'>"
"<input name='ssid' type='text' placeholder='SSID DEL WIFI'class='input-48' required>"
"<input name='pass' type='text' placeholder='CONTRASEÑA' class='input-48' required>"
"<input name='USERNAME' type='text'placeholder='DISPOSITIVO'class='input-48' required>"
"<input name='PASSWORD' type='text' placeholder='CONTRASEÑA' class='input-48' required>"
"<label>CONFIGURACIÓN IP DEL DISPOSITIVO</label>"
"<input name='ip' type='text' placeholder='IP FIJA (192,168,1,2)'class='input-100' required>"
"<input name='gateway' type='text' placeholder='GETEWAY (192,168,1,1)' class='input-100'required >"
"<input name='subnet' type='text' placeholder='SUBNET O MASCARA (255,255,255,0)'class='input-100' required>"
"<input type='submit' value='GUARDAR' class='btn-enviar'/>";

String pagina2 ="</div>"
"</form>"
"<form action='escanear' method='post' class='form-register'>"
"<h2 class='form_titulo'>ESCANEAR REDES WIFI</h2>"
"<div class='contenedor-inputs'>"
"<input type='submit' value='ESCANEAR' class='btn-enviar'/>";
String paginafin ="</div>"
"</form>"
"</body>"
"</html>";

//------------------------SETUP WIFI-----------------------------
void setup_wifi() {
// Conexión WIFI

//  WiFi.mode(WIFI_STA); //para que no inicie el SoftAP en el modo normal
//  WiFi.begin(ssid, pass);
//  while (WiFi.status() != WL_CONNECTED and contconexion <50) { //Cuenta hasta 50 si no se puede conectar lo cancela
//    ++contconexion;
//    delay(250);
//    Serial.print(".");
//    digitalWrite(2, HIGH);
//    delay(250);
//    digitalWrite(2, LOW);
//  }
//  if (contconexion <50) {   
//      Serial.println("");
//      Serial.println("WiFi conectado");
//      Serial.println(WiFi.localIP());
//      digitalWrite(2, HIGH);  
//  }
//  else { 
//      Serial.println("");
//      Serial.println("Error de conexion");
//      digitalWrite(2, LOW);
//  }
}

//--------------------------------------------------------------
WiFiClient espClient;
ESP8266WebServer server(80);/// modo AP
PubSubClient client(espClient); /// modo Client
//--------------------------------------------------------------

//-------------------PAGINA DE CONFIGURACION--------------------
void paginaconf() {
  server.send(200, "text/html", pagina1 + mensajeGuardar + pagina2 + mensajeEscanear + paginafin); 
}

//--------------------MODO_CONFIGURACION------------------------
void modoconf() {
   
  delay(100);
  digitalWrite(16, HIGH);//pin D0 ó 16  para el led indicador del AP
  delay(100);
  digitalWrite(16, LOW);
  delay(100);
  digitalWrite(16, HIGH);
  delay(100);
  digitalWrite(16, LOW);
   delay(100);
  digitalWrite(16, HIGH);
  delay(100);
  digitalWrite(16, LOW);

  WiFi.softAP(ssidConf, passConf);
  IPAddress myIP = WiFi.softAPIP(); 
  Serial.print("IP del acces point: ");
  Serial.println(myIP);
  Serial.println("WebServer iniciado...");
  
  delay(300);
  digitalWrite(16, HIGH);//pin D0 ó 16  para el led indicador del AP
  delay(300);
  digitalWrite(16, LOW);
  delay(300);
  digitalWrite(16, HIGH);
  delay(300);
  digitalWrite(16, LOW);
   delay(300);
  digitalWrite(16, HIGH);
  delay(300);
  digitalWrite(16, LOW);


  server.on("/", paginaconf); //esta es la pagina de configuracion

  server.on("/guardar_conf", guardar_conf); //Graba en la eeprom la configuracion

  server.on("/escanear", escanear); //Escanean las redes wifi disponibles
  
  server.begin();

  while (true) {
      server.handleClient();
  }
 }
 
//---------------------GUARDAR CONFIGURACION-------------------------
void guardar_conf() {
  //--------------WIFI----------
  Serial.println(server.arg("ssid"));//Recibimos los valores que envia por POST el formulario web
  grabar(0,server.arg("ssid"));
  Serial.println(server.arg("pass"));
  grabar(50,server.arg("pass"));
  //-------DISPOSITIVO-------
  Serial.println(server.arg("USERNAME"));
  grabar(100,server.arg("USERNAME"));
  Serial.println(server.arg("PASSWORD"));
  grabar(150,server.arg("PASSWORD"));
  //-------IP PARA DISPOSITIVO-------
  Serial.println(server.arg("ip"));
  grabar(200,server.arg("ip"));
  Serial.println(server.arg("gateway"));
  grabar(250,server.arg("gateway"));
    Serial.println(server.arg("subnet"));
  grabar(300,server.arg("subnet"));
  
  //mensaje = "Configuracion Guardada...";
  mensajeGuardar = "";
  mensajeGuardar = (mensajeGuardar) + "<p>" + "Configuracion Guardada..." + " </p>\r\n";
  paginaconf();
}

//----------------Función para grabar en la EEPROM-------------------
void grabar(int addr, String a) {
  int tamano = a.length(); 
  char inchar[50]; 
  a.toCharArray(inchar, tamano+1);
  for (int i = 0; i < tamano; i++) {
    EEPROM.write(addr+i, inchar[i]);
  }
  for (int i = tamano; i < 50; i++) {
    EEPROM.write(addr+i, 255);
  }
  EEPROM.commit();
}

//-----------------Función para leer la EEPROM------------------------
String leer(int addr) {
   byte lectura;
   String strlectura;
   for (int i = addr; i < addr+50; i++) {
      lectura = EEPROM.read(i);
      if (lectura != 255) {
        strlectura += (char)lectura;
      }
   }
   return strlectura;
}

//---------------------------ESCANEAR----------------------------
void escanear() {  
  int n = WiFi.scanNetworks(); //devuelve el número de redes encontradas
  Serial.println("escaneo terminado");
  if (n == 0) { //si no encuentra ninguna red
    Serial.println("no se encontraron redes");
    mensajeEscanear = "no se encontraron redes";
  }  
  else
  {
    Serial.print(n);
    Serial.println(" redes encontradas");
    mensajeEscanear = "";
    for (int i = 0; i < n; ++i)
    {
      // agrega al STRING "mensaje" la información de las redes encontradas 
      mensajeEscanear = (mensajeEscanear) + "<p>" + String(i + 1) + ": " + WiFi.SSID(i) + " (" + WiFi.RSSI(i) + ") Ch: " + WiFi.channel(i) + " Enc: " + WiFi.encryptionType(i) + " </p>\r\n";
      //WiFi.encryptionType 5:WEP 2:WPA/PSK 4:WPA2/PSK 7:open network 8:WPA/WPA2/PSK
      delay(10);
    }
    Serial.println(mensajeEscanear);
    paginaconf();
  }
}
//------------------------CALLBACK-----------------------------
void callback(char* topic, byte* payload, unsigned int length) {

  char PAYLOAD[5] = "    ";
  
  Serial.print("Mensaje Recibido: [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    PAYLOAD[i] = (char)payload[i];
  }
  Serial.println(PAYLOAD);
////-------Codigos para Control por IR------
uint16_t AC_ON_19[59] = {8394, 4242,  546, 1678,  570, 554,  546, 578,  544, 554,  572, 1678,  
      546, 552,  572, 554,  544, 578,  546, 1678,  546, 1678,  572, 552,  546, 578,  546, 552,  572, 
      552,  546, 580,  544, 552,  572, 552,  546, 580,  544, 554,  570, 554,  544, 580,  544, 1680,  
      544, 578,  544, 1656,  566, 580,  544, 552,  572, 554,  544, 1676,  572};  // LG 88C0051
uint16_t AC_OFF_19[59] = {8394, 4214,  572, 1678,  546, 578,  546, 554,  570, 552,  546, 1678,  572, 552,  544, 580,  546, 552,  570, 552,  546, 578,  546, 552,  
      572, 550,  548, 578,  546, 552,  572, 552,  546, 580,  544, 552,  572, 1678,  546, 554,  572, 552,  546, 578,  548, 1678,  546, 578, 
      544, 552,  572, 1678,  546, 552,  572, 552,  546, 580,  544};  // LG 8800448-19 grados

/////--------------Envio de codigo IR--------------------------- 
 if (String(topic) ==  String(SALIDADIGITAL)) {
    if (payload[1] == 'N'){
       digitalWrite(D2,0);///D2 o Pin 4 para el EMISOR IR
       //irsend.sendRaw(AC_ON_19, 59,38);//Codigo de Aire
       irsend.sendNEC(0x20DF10EF,32);
       delay(1000);///referencia para esperar que encienda
    }
    if (payload[1] == 'F'){
       digitalWrite(D2,0);
       //irsend.sendRaw(AC_OFF_19, 59,38);//Codigo de Aire
       irsend.sendNEC(0x20DF10EF,32);
       delay(1000);///referencia para esperar que encienda
    }
  }

}


//------------------------RECONNECT-----------------------------
void reconnect() {
  uint8_t retries = 3;
  // Loop hasta que estamos conectados
  while (!client.connected()) {
    Serial.print("Intentando conexion MQTT...");
    // Crea un ID de cliente al azar
    String clientId = "ESP8266Client-";
    clientId += String(random(0xffff), HEX);
    // Attempt to connect
    //String(USERNAME);
    //USERNAME.toCharArray(PLACA, 50);
    //if (client.connect("", PLACA, PASSWORD)) {
    if (client.connect("", USERNAME, PASSWORD)) {
      Serial.println("conectado");
      client.subscribe(SALIDADIGITAL);
    } else {
      Serial.print("fallo, rc=");
      Serial.print(client.state());
      Serial.println(" intenta nuevamente en 5 segundos");
      // espera 5 segundos antes de reintentar
      delay(5000);
    }
    retries--;
    if (retries == 0) {
      // esperar a que el WDT lo reinicie
      while (1);
    }
  }
}

//------------------------SETUP-----------------------------
void setup() {

  pinMode(16, OUTPUT); // D0 o 16  para el led de configuracion del AP
  digitalWrite(2, LOW);
  pinMode(2, OUTPUT); // D4 salida digital LED DE LA PLACA
  digitalWrite(2, LOW);
  pinMode(12, INPUT); // D6 o 12 --> PULSADOR
  pinMode(5, INPUT); // D6 o 12 --> PULSADOR AP
  // Inicia Serial
  irsend.begin(); //para IR
  Serial.begin(115200);
  Serial.println("");

  EEPROM.begin(512);

  pinMode(5, INPUT);  //D1 o 5  para el pulsador de configuracion del AP
  if (digitalRead(5) == 0) {
    modoconf();
  }

  leer(0).toCharArray(ssid, 50);
  leer(50).toCharArray(pass, 50);
  leer(100).toCharArray(USERNAME, 50);
  leer(150).toCharArray(PASSWORD, 50);
  leer(200).toCharArray(ip, 50);
  leer(250).toCharArray(gateway, 50);
  leer(300).toCharArray(subnet, 50);
  //setup_wifi();

WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED and contconexion <50) { //Cuenta hasta 50 si no se puede conectar lo cancela
    ++contconexion;
    delay(500);
    Serial.print(".");
       
  }
  if (contconexion <50) {
      //para usar con ip fija superior a 192.168.1.100
     
     /////------IP FIJA------
      int ip1 =(int(ip[0])-48)*100 + 10*(int(ip[1])-48) + (int(ip[2])-48);
      int ip2 =(int(ip[4])-48)*100 + 10*(int(ip[5])-48) + (int(ip[6])-48);
      int ip3 =(int(ip[8])-48);
      int ip4 =(int(ip[10])-48)*100 + 10*(int(ip[11])-48) + (int(ip[12])-48);
      IPAddress ip(ip1,ip2,ip3,ip4);
      //Serial.println(ip);
       /////------gateway FIJA------
      int gateway1 =(int(gateway[0])-48)*100 + 10*(int(gateway[1])-48) + (int(gateway[2])-48);
      int gateway2 =(int(gateway[4])-48)*100 + 10*(int(gateway[5])-48) + (int(gateway[6])-48);
      int gateway3 =(int(gateway[8])-48);
      int gateway4 =(int(gateway[10])-48);
      IPAddress gateway(gateway1,gateway2,gateway3,gateway4);
      //Serial.println(gateway);
       /////------subnet FIJA------
      int subnet1 =(int(subnet[0])-48)*100 + 10*(int(subnet[1])-48) + (int(subnet[2])-48);
      int subnet2 =(int(subnet[4])-48)*100 + 10*(int(subnet[5])-48) + (int(subnet[6])-48);
      int subnet3 =(int(subnet[8])-48)*100 + 10*(int(subnet[9])-48) + (int(subnet[10])-48);
      int subnet4 =(int(subnet[12])-48);
      IPAddress subnet(subnet1,subnet2,subnet3,subnet4);
     // Serial.println(subnet);
      WiFi.config(ip, gateway, subnet); 
           
//      IPAddress ip(192,168,1,253)   
//      IPAddress gateway(192,168,1,1); 
//      IPAddress subnet(255,255,255,0); 
//      WiFi.config(ip, gateway, subnet); 
      
      Serial.println("");
      Serial.println("WiFi conectado");
      Serial.println(WiFi.localIP());
      
  }
  else { 
      Serial.println("");
      Serial.println("Error de conexion");
  }

  String USERNAME1; 
  USERNAME1 = String (USERNAME);
  client.setServer(SERVER, SERVERPORT);
  client.setCallback(callback);
  String temperatura = "/" + USERNAME1 + "/" + "temperatura"; 
  temperatura.toCharArray(TEMPERATURA, 50);
  String humedad = "/" + USERNAME1 + "/" + "humedad"; 
  humedad.toCharArray(HUMEDAD, 50);
  String pulsador = "/" + USERNAME1 + "/" + "pulsador"; 
  pulsador.toCharArray(PULSADOR, 50);
  String salidaDigital = "/" + USERNAME1 + "/" + "salidaDigital"; 
  salidaDigital.toCharArray(SALIDADIGITAL, 50);
  
}


//--------------------------LOOP--------------------------------
void loop() {

  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  unsigned long currentMillis = millis();
    
  if (currentMillis - previousMillis >= 10000) { //envia la temperatura cada 10 segundos
    previousMillis = currentMillis;
    
    float temperature = dht.readTemperature();
    float humidity = dht.readHumidity();
    if (isnan(temperature) || isnan(humidity)) {
    Serial.println("Falla al leer el sensor DHT11!");
    return;
    }
    strtemp = String(temperature, 2); //1 decimal
    strtemp.toCharArray(valueStr, 15);
    Serial.println("Enviando: [" +  String(TEMPERATURA) + "] " + strtemp);
    client.publish(TEMPERATURA, valueStr);
    
    strhum = String(humidity, 2); //1 decimal
    strhum.toCharArray(valueStr, 15);
    Serial.println("Enviando: [" +  String(HUMEDAD) + "] " + strhum);
    client.publish(HUMEDAD, valueStr);
//    Serial.println(USERNAME);
//    Serial.println(PASSWORD);
//    Serial.println(ip);
//    Serial.println(gateway);
//    Serial.println(subnet);
    
  }
  
  if (digitalRead(12) == 0) { //-->gpio 12 o D6
    strPulsador = "presionado";
  } else {
    strPulsador = "NO presionado";
  }

  if (strPulsador != strPulsadorUltimo) { //envia el estado del pulsador solamente cuando cambia.
    strPulsadorUltimo = strPulsador;
    strPulsador.toCharArray(valueStr, 15);
    Serial.println("Enviando: [" +  String(PULSADOR) + "] " + strPulsador);
    client.publish(PULSADOR, valueStr);
  }
}
