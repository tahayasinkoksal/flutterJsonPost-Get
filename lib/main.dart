import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:jsonveridenemesi/models/PaylasimModel.dart';
//--@tahayasinkoksal
//--tahayasinkoksal.com.tr

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Post İşlemleri'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  //url den verileri alıp json verisine çevirip
  //model dosyasına gönderip geri dönüş olarak model listesi getiriyor

  //--------Paylasim Cekme Main---------//
  ///////RESIMLER
  Future<List<PaylasimModel>> tumPaylasimlarCek() async {
    var url = Uri.parse("https://tahayasinkoksal.com/paylasimCek.php"); //url
    var gonderilecekPostVerisi = {"api_key":"12333333333", "paylasim_id":"1"}; //post edilecekler

    var cevap = await http.post(url, body: gonderilecekPostVerisi); //istek islemi
    //print("CIKTI:******* ${cevap.body}");
    var a = PaylasimModelCevap.fromJson(json.decode(cevap.body)).paylasimListesi;
    return a; //istegi modele cevrilip geri dondurme
  }

  Future<void> paylasimlarGoster() async{
    var liste = await tumPaylasimlarCek();

    for(var k in liste){
      print("*********");
      print("${k.id}");
      print("${k.baslik}");
      print("${k.paylasimid}");
      print("${k.resimler[0]}");
    }
  }


  @override
  void initState() {
    super.initState();

    paylasimlarGoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}
