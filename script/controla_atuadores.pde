void setup() {                
  Serial.begin(9600);

  //LED Indicador
  pinMode(13, OUTPUT);
  
  //Tomad@
  pinMode(12, OUTPUT);
}

void loop() {
  if(Serial.available()) {
    byte estado = Serial.read();
    Serial.println(estado);
    
    if(estado == 0) {
      digitalWrite(13, LOW);  
      digitalWrite(12, LOW); 
    } else if(estado == 1) {
      digitalWrite(13, HIGH);
      digitalWrite(12, HIGH);
    } else if (estado == 15){
      Serial.println("UHUHU");     }
      
  }
}
