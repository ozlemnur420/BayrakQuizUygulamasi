import 'package:bayrak_quiz_uygulamasi/Quiz_ekrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Anasayfa(title: '',),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key, required this.title});

  final String title;

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ANASAYFA"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("QUİZE HOŞGELDİNİZ",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color: Colors.indigo),),
            SizedBox(
              width: 200,
              height:50 ,
              child: ElevatedButton(
                child: Text("BAŞLA !"),
                onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz_ekrani()));

                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}
