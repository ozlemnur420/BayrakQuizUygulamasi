import 'dart:collection';

import 'package:bayrak_quiz_uygulamasi/Bayraklar.dart';
import 'package:bayrak_quiz_uygulamasi/Bayraklardao.dart';
import 'package:bayrak_quiz_uygulamasi/Sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class Quiz_ekrani extends StatefulWidget {
  const Quiz_ekrani({super.key});

  @override
  State<Quiz_ekrani> createState() => _Quiz_ekraniState();
}

class _Quiz_ekraniState extends State<Quiz_ekrani> {

  var sorular=<Bayraklar>[];
  var yanlis_secenekler=<Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler=HashSet<Bayraklar>();

 late int soru_sayac=0;
 late int dogru_sayac=0;
 late int yanlis_sayac=0;

  String bayrak_resim_ad="placeholder.png";
  String buttonA_yazi="";
  String buttonB_yazi="";
  String buttonC_yazi="";
  String buttonD_yazi="";

  @override
  void initState() {
    super.initState();
    sorulari_al();

  }

  Future<void>sorulari_al() async{
  sorular= await Bayraklardao().rastgele5getir();
  sorulari_yukle();
  }

  Future<void>sorulari_yukle() async{

    dogruSoru=sorular[soru_sayac];
    bayrak_resim_ad=dogruSoru.bayrak_resim;
    yanlis_secenekler=await Bayraklardao().rastgele3YanlisGetir(dogruSoru.bayrak_id);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlis_secenekler[0]);
    tumSecenekler.add(yanlis_secenekler[1]);
    tumSecenekler.add(yanlis_secenekler[2]);

    buttonA_yazi=tumSecenekler.elementAt(0).bayrak_ad;
    buttonB_yazi=tumSecenekler.elementAt(1).bayrak_ad;
    buttonC_yazi=tumSecenekler.elementAt(2).bayrak_ad;
    buttonD_yazi=tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {

    });

  }

  void soru_sayac_kontrol(){

    soru_sayac=soru_sayac+1;

    if(soru_sayac!=5){
      sorulari_yukle();
    }

    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Sonuc_ekrani(dogru_sayisi: dogru_sayac)));
    }

  }

  void dogru_kontrol(String buttonYazi){

    if(dogruSoru.bayrak_ad==buttonYazi){
     dogru_sayac=dogru_sayac+1;
    }
    else{
      yanlis_sayac=yanlis_sayac+1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("QUIZ EKRANI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("DOĞRU: $dogru_sayac",style: TextStyle(fontSize: 18,color: Colors.black),),
                Text("YANLIŞ $yanlis_sayac",style: TextStyle(fontSize: 18,color: Colors.black),),
              ],
            ),
            soru_sayac!= 5 ?  Text("${soru_sayac+1}. Soru",style: TextStyle(fontSize: 30,color: Colors.black),):
            Text("5. Soru",style: TextStyle(fontSize: 30,color: Colors.black),),
            Image.asset("resimler/$bayrak_resim_ad"),
            SizedBox(
              width: 200,
              height:50 ,
              child: ElevatedButton(
                child: Text(buttonA_yazi),
                onPressed: (){
                 dogru_kontrol(buttonA_yazi);
                 soru_sayac_kontrol();
                },
              ),
            ),

            SizedBox(
              width: 200,
              height:50 ,
              child: ElevatedButton(
                child: Text(buttonB_yazi),
                onPressed: (){
                  dogru_kontrol(buttonB_yazi);
                  soru_sayac_kontrol();

                },
              ),
            ),
            SizedBox(
              width: 200,
              height:50 ,
              child: ElevatedButton(
                child: Text(buttonC_yazi),
                onPressed: (){
                  dogru_kontrol(buttonC_yazi);
                  soru_sayac_kontrol();

                },
              ),
            ),

            SizedBox(
              width: 200,
              height:50 ,
              child: ElevatedButton(
                child: Text(buttonD_yazi),
                onPressed: (){
                  dogru_kontrol(buttonD_yazi);
                  soru_sayac_kontrol();
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
