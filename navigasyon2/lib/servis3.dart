import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;
import 'kitap.dart';
import 'kitapWidget.dart';

class Servis3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Servis3State();
  }
}

class _Servis3State extends State<Servis3> {
  List<Kitap> kitaplar = [];

  Future<List<Kitap>> servistenVeriCek() async {
    //'https:www.googleapis.com/books/v1/volumes?q=http';
    var url = Uri.https(
      'www.googleapis.com',
      '/books/v1/volumes',
      {'q': '{http}'},
    );

    var cevap = await http.get(url);

    List<Kitap> kitapListe = [];
    if (cevap.statusCode == 200) {
      var veri = convert.jsonDecode(cevap.body);

      for (var i = 0; i < veri['items'].length; i++) {
        kitapListe.add(
          Kitap(
            ad: veri['items'][i]['volumeInfo']['title'],
            thumbnail: veri['items'][i]['volumeInfo']['imageLinks']['thumbnail']
                .toString()
                .replaceAll('http', 'https'),
          ),
        );
        print(kitapListe[i].ad);
      }
    }
    return kitapListe;
  }

  Widget veriListesiOlustur() {
    servistenVeriCek().then((kitapListesi) {
      setState(() {
        this.kitaplar = kitapListesi;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    veriListesiOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servis Örneği'),
      ),
      body: SafeArea(
        child: Padding(
          child: ListView(
            children: kitaplar?.map((kitap) => KitapWidget(kitap))?.toList(),
          ),
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
