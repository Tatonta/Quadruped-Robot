  #include <Dynamixel_Serial.h>
  
  // software serial pins
  #define TX_L1 8
  #define TX_R1 9
  #define TX_L2 10
  #define TX_R2 11
  #define ID_SPALLA 1
  #define ID_GOMITO 2
  #define speed 0xFFF//////////////////////////
  #define START_POSITION 0xFFF /////////////////////
  int N_Legs=4;
  // Definizione delle seriali software (RX,TX)
  int mySerial[4] ={TX_L1, TX_L2, TX_R1, TX_R2};
  // Definizione delle interfacce Dynamixel
  DynamixelClass L1;
  DynamixelClass R1;
  DynamixelClass L2;
  DynamixelClass R2;
  
  DynamixelClass Legs[4] = {L1,R1,L2,R2};

  int motor_baudrate=1000000;
  
void setup() {


  // Setup delle seriali
  for(int i=0;i<N_Legs;i++){
  Legs[i].begin(motor_baudrate,mySerial[i]);
  }
  for(int i=0; i<4;i++){
  // Turn mode to SERVO, must be WHEEL if using wheel mode
  Legs[i].setMode(ID_SPALLA,SERVO,0x000,speed); 
  Legs[i].setMode(ID_GOMITO,SERVO,0x000,speed); 
 }
 
 // SETUP DELLA ZAMPA, MESSA IN POSIZIONE
 for(int i=0; i<4;i++){
  Legs[i].setMaxTorque(ID_SPALLA, 0x2FF);
  Legs[i].servo(ID_SPALLA,START_POSITION,0x100);
  Legs[i].setMaxTorque(ID_GOMITO, 0x2FF);
  Legs[i].servo(ID_GOMITO,START_POSITION,0x100);
  // Set Dynamixel to new serial speed 
  Legs[i].setBaudRate(ID_SPALLA,motor_baudrate);
  Legs[i].setBaudRate(ID_GOMITO,motor_baudrate); 
 }


}

void loop() {
  // put your main code here, to run repeatedly:

}
