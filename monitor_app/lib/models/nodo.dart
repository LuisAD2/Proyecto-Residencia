//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Nodo{
   String humi;
   String msnm;
   String pa;
   String pm1;
   String pm10;
   String pm2_5;
   String ppmco;
   String ppmo;
   String temp;
   String ts;

  Nodo(this.humi, this.msnm, this.pa, this.pm1, this.pm10, this.pm2_5, this.ppmco, this.ppmo, this.temp, this.ts);


  Nodo.fromSnapshot(DataSnapshot snapshot){
    humi = snapshot.value["humedad"];
    msnm = snapshot.value["altitud"];
      pa = snapshot.value["hpa"];
    pm1  = snapshot.value["pm1"];
    pm10 = snapshot.value["pm10"];
   pm2_5 = snapshot.value["pm2_5"];
   ppmco = snapshot.value["ppmCO"];
    ppmo = snapshot.value["ppmO3"];
    temp = snapshot.value["temperatura"];
    ts   = snapshot.value["ts"];
  }


  toJson(){
    return{
      "humedad": humi,
      "altitud": msnm,
      "hpa": pa,
      "pm1": pm1,
      "pm10": pm10,
      "pm2_5": pm2_5,
      "ppmCO": ppmco,
      "ppmO3": ppmo,
      "temperatura": temp,
      "ts": ts
    };
  }
  
  
}
