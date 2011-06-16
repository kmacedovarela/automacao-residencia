int PINO_15_OFF = 15;
int PINO_15_ON = 159;

int PINO_14_OFF = 14;
int PINO_14_ON = 149;

int PINO_13_OFF = 13;
int PINO_13_ON = 139;

int PINO_12_OFF = 12;
int PINO_12_ON = 129;

int PINO_11_OFF = 11;
int PINO_11_ON = 119;

int PINO_10_OFF = 10;
int PINO_10_ON = 109;

int PINO_9_OFF = 9;
int PINO_9_ON = 99;

int PINO_8_OFF = 8;
int PINO_8_ON = 89;

int PINO_7_OFF = 7;
int PINO_7_ON = 79;

int PINO_6_OFF = 6;
int PINO_6_ON = 69;

int PINO_5_OFF = 5;
int PINO_5_ON = 59;

int PINO_4_OFF = 4;
int PINO_4_ON = 49;

int PINO_3_OFF = 3;
int PINO_3_ON = 39;

int PINO_2_OFF = 2;
int PINO_2_ON = 29;

int PINO_1_OFF = 1;
int PINO_1_ON = 19;

void setup() {                
  Serial.begin(9600);

  pinMode(15, OUTPUT);
  pinMode(14, OUTPUT);
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(4, OUTPUT);  
  pinMode(3, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(1, OUTPUT);
  
}

void loop() {
  if(Serial.available()) {
    int estado = Serial.read();
    Serial.println(estado);
    
    if(estado == PINO_15_OFF) {
      digitalWrite(15, LOW);  
    } else if(estado == PINO_15_ON) {
      digitalWrite(15, HIGH); 
    }
    
    if(estado == PINO_14_OFF) {
      digitalWrite(14, LOW);  
    } else if(estado == PINO_14_ON) {
      digitalWrite(14, HIGH); 
    }
    
    if(estado == PINO_13_OFF) {
      digitalWrite(13, LOW);  
    } else if(estado == PINO_13_ON) {
      digitalWrite(13, HIGH); 
    }
    
    if(estado == PINO_12_OFF) {
      digitalWrite(12, LOW);  
    } else if(estado == PINO_12_ON) {
      digitalWrite(12, HIGH); 
    }
    
    if(estado == PINO_11_OFF) {
      digitalWrite(11, LOW);  
    } else if(estado == PINO_11_ON) {
      digitalWrite(11, HIGH); 
    }
    
    if(estado == PINO_10_OFF) {
      digitalWrite(10, LOW);  
    } else if(estado == PINO_10_ON) {
      digitalWrite(10, HIGH); 
    }
    
    if(estado == PINO_9_OFF) {
      digitalWrite(9, LOW);  
    } else if(estado == PINO_9_ON) {
      digitalWrite(9, HIGH); 
    }
    
    if(estado == PINO_8_OFF) {
      digitalWrite(8, LOW);  
    } else if(estado == PINO_8_ON) {
      digitalWrite(8, HIGH); 
    }
    
   if(estado == PINO_7_OFF) {
      digitalWrite(7, LOW);  
    } else if(estado == PINO_7_ON) {
      digitalWrite(7, HIGH); 
    }
    
   if(estado == PINO_6_OFF) {
      digitalWrite(6, LOW);  
    } else if(estado == PINO_6_ON) {
      digitalWrite(6, HIGH); 
    }
    
    if(estado == PINO_5_OFF) {
      digitalWrite(5, LOW);  
    } else if(estado == PINO_5_ON) {
      digitalWrite(5, HIGH); 
    }
    
    if(estado == PINO_4_OFF) {
      digitalWrite(4, LOW);  
    } else if(estado == PINO_4_ON) {
      digitalWrite(4, HIGH); 
    }
    
    if(estado == PINO_3_OFF) {
      digitalWrite(3, LOW);  
    } else if(estado == PINO_3_ON) {
      digitalWrite(3, HIGH); 
    }
    
    if(estado == PINO_2_OFF) {
      digitalWrite(2, LOW);  
    } else if(estado == PINO_5_ON) {
      digitalWrite(5, HIGH); 
    }
    
    if(estado == PINO_1_OFF) {
      digitalWrite(1, LOW);  
    } else if(estado == PINO_1_ON) {
      digitalWrite(1, HIGH); 
    }
  }

}
