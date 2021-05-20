import 'package:flutter/material.dart';
import 'package:moflix_aplli_flutter/pages/discover.dart';
import 'package:moflix_aplli_flutter/pages/discoverShow.dart';
import 'package:moflix_aplli_flutter/themes/color.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primary
    ),
    home : DiscoverPage(),
    
  ));
}

