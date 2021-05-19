import 'package:flutter/material.dart';
import 'package:moflix_aplli_flutter/pages/discover.dart';
import 'package:moflix_aplli_flutter/themes/color.dart';

void main() {
  runApp(MaterialApp(
   // routes: {_DiscoverPageState.routeName: (context) => _DiscoverPageState(),},
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primary
    ),
    home : DiscoverPage(),
  ));
}

