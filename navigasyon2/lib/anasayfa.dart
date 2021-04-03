import 'package:flutter/material.dart';
//import 'hakkinda.dart';
import 'diller.dart';
import 'dil.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnaSayfaState();
  }
}

class _AnaSayfaState extends State<AnaSayfa> {
  Dil _dil = Dil(ad: 'CSharp', id: 0);

  void _hakkindaSayfaAc({BuildContext context, bool fullScreenDialog = false}) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     fullscreenDialog: //bunu kullanırsan sayfa çıkışında x geliyor ok değil
    //         fullScreenDialog,
    //     builder: (context) => Hakkinda(),
    //   ),
    // );

    //Navigator.pushNamed(context, '/hakkinda');
    Navigator.pushNamed(context, '/servis3');
  }

  void _sayfaAc({BuildContext context, bool fullScreenDialog = false}) async {
    final Dil seciliDil = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullScreenDialog,
        builder: (context) => Diller(dil: _dil),
      ),
    );
    setState(() {
      _dil = seciliDil ?? _dil;
      //seçili dil yoksa seçili dili ata önceden seçilen gösterilsin
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yönlendirme'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () =>
                _hakkindaSayfaAc(context: context, fullScreenDialog: true),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(_dil == null ? '' : 'Seçili Dil: ${_dil.ad}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Hakkında',
        child: Icon(Icons.sentiment_satisfied),
        onPressed: () => _sayfaAc(context: context),
      ),
    );
  }
}
