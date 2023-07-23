pragma circom 2.0.0;

template ZkCircuit () {  

   // signal inputs  
   signal input a;  
   signal input b; 

   //gates
   signal X;  
   signal Y;  
 
  //signal output
   signal output Q;  

  //components
  component andGate = AND();
  component orGate = OR();
  component notGate = NOT();

  andGate.A <== a;
  andGate.B <== b;
  X <== andGate.out; 

  notGate.A <== b;
  Y <== notGate.out;

  orGate.A <==X;
  orGate.B <==Y;
  Q <== orGate.out;
     
}

template AND() {
  signal input A;
  signal input B;
  signal output out;

  out <== A * B;
}

template NOT() {
  signal input A;
  signal output out;

  out <== 1 + A - 2 * A;
}

template OR() {
  signal input A;
  signal input B;
  signal output out;

  out <== A + B - A * B;
}
component main = ZkCircuit();
