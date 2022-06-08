import 'package:firebase_database/firebase_database.dart';

class Nodo1 {
 
  String vv;
  String precip;
  String dv;
  String tempe;
  String hum;
  String mvb;
  String o3p;
  String cop;
  String no2p;
  String so2p;
  String pM1_0;
  String pM2_5;
  String pM10;
  String ts;

  Nodo1.fromSnapshot(DataSnapshot snapshot) {
       cop = snapshot.value["CO"];
        dv = snapshot.value["DV"];
    precip = snapshot.value["Precip"];
       hum = snapshot.value["Hum"];
     tempe = snapshot.value["Temp"];
      no2p = snapshot.value["NO2"];
      o3p  = snapshot.value["O3"];
     pM1_0 = snapshot.value["PM1"];
      pM10 = snapshot.value["PM10"];
     pM2_5 = snapshot.value["PM2_5"];
      so2p = snapshot.value["SO2"];
        vv = snapshot.value["VV"];
       mvb = snapshot.value["mVB"];
        ts = snapshot.value["ts"];
  }

}
