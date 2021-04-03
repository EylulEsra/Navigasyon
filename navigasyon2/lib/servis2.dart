import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'kitap.dart';

class Servis2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Servis2State();
  }
}

class _Servis2State extends State<Servis2> {
  List<String> kitaplar = [];

  Future<List<String>> servistenVeriCek() async {
    //'https:www.googleapis.com/books/v1/volumes?q=http';
    var url = Uri.https(
      'www.googleapis.com',
      '/books/v1/volumes',
      {'q': '{http}'},
    );

    var cevap = await http.get(url);

    if (cevap.statusCode == 200) {
      var veri = convert.jsonDecode(cevap.body);
      List<String> kitaplar = [];
      for (var i = 0; i < veri['items'].length; i++) {
        kitaplar.add(veri['items'][i]['volumeInfo']['title']);
        print(veri['items'][i]['volumeInfo']['imageLinks']['thumbnail']);
      }
      return kitaplar;
    }
    return null;
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
          child: Column(
            children: kitaplar?.map((isim) => Text(isim))?.toList(),
          ),
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
