import 'package:flutter/material.dart';
import 'dil.dart';

class Diller extends StatefulWidget {
  final Dil dil;

  Diller({Key key, this.dil}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DillerState();
}

class _DillerState extends State<Diller> {
  List<String> _dilList = [];
  Dil _dil;
  int _secim;

  void _secimDegisti(indis) {
    setState(() {
      _secim = indis;
      _dil = Dil(ad: _dilList[indis], id: indis);
    });

    //print('Seçilen radio buton değeri: $_secim');
  }

//bir widgeta aşağıdaki gibi değer gönderebilirix
  @override
  void initState() {
    super.initState();

    _dilList..add('CSharp')..add('Javascript')..add('Dart');
    _secim = widget.dil.id;

    // for (var i = 0; i < _dilList.length; i++) {
    //   if (_dilList[i] == widget.dil) {
    //     _secim = i;
    //     break;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diller'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _dil),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Radio(
                value: 0,
                groupValue: _secim,
                onChanged: (indis) => _secimDegisti(indis)),
            Text('CSharp'),
            Radio(
                value: 1,
                groupValue: _secim,
                onChanged: (indis) => _secimDegisti(indis)),
            Text('Javascript'),
            Radio(
                value: 2,
                groupValue: _secim,
                onChanged: (indis) => _secimDegisti(indis)),
            Text('Dart'),
          ]),
        ),
      ),
    );
  }
}
