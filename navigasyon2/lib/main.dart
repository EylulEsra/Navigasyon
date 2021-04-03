import 'package:flutter/material.dart';
import 'anasayfa.dart';
import 'hakkinda.dart';
import 'diller.dart';
import 'servis.dart';
import 'servis2.dart';
import 'servis3.dart';

final rotalar = <String, WidgetBuilder>{
  '/hakkında': (BuildContext context) => Hakkinda(),
  '/diller': (BuildContext context) => Diller(),
  '/servis': (BuildContext context) => Servis(),
  '/servis2': (BuildContext context) => Servis2(),
  '/servis3': (BuildContext context) => Servis3(),
};

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      title: 'Navigasyon Örnek',
      routes: rotalar,
      home: AnaSayfa(),
    );
  }
}
