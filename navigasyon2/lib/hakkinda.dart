import 'package:flutter/material.dart';

class Hakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkında'),
      ),
      body: SafeArea(
        child: Padding(
          child: Text('Hakkında Sayfası'),
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
