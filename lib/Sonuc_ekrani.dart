import 'package:flutter/material.dart';

class Sonuc_ekrani extends StatefulWidget {
  int dogru_sayisi;

  Sonuc_ekrani({required this.dogru_sayisi});

  @override
  State<Sonuc_ekrani> createState() => _Sonuc_ekraniState();
}

class _Sonuc_ekraniState extends State<Sonuc_ekrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("SONUÇ ERKANI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.dogru_sayisi} DOĞRU ${5-widget.dogru_sayisi} YANLIŞ",style: TextStyle(fontSize: 30,color: Colors.black),),
            Text("% ${((widget.dogru_sayisi*100)/5).toDouble()} başarı",style: TextStyle(fontSize: 30,color: Colors.black),),

            SizedBox(
              width: 200,
              height:50 ,
              child: ElevatedButton(
                child: Text("TEKRAR DENE !"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),


          ],
        ),
      ),

    );
  }
}
