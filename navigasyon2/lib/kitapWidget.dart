import 'package:flutter/material.dart';
import 'kitap.dart';

class KitapWidget extends StatelessWidget {
  final Kitap kitap;

  KitapWidget(this.kitap);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(kitap?.thumbnail),
        Text(kitap.ad),
      ],
    );
  }
}
