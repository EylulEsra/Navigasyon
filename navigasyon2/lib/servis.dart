import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Servis extends StatelessWidget {
  servistenVeriCek() async {
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
        print(veri['items'][i]['volumeInfo']['title']);
      }
      return kitaplar;
    }
    return null;
  }

  Widget veriListesiOlustur() {
    var kitaplar = servistenVeriCek();
    print(kitaplar);
    return Column(
      children: [
        Text('Satır 1'),
        Text('Satır 2'),
        Text('Satır 3'),
        Text('Satır 4'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servis Örneği'),
      ),
      body: SafeArea(
        child: Padding(
          child: veriListesiOlustur(),
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
