import 'package:flutter/material.dart';
import 'package:moflix_aplli_flutter/pages/discover.dart';
import 'package:moflix_aplli_flutter/pages/movieShow.dart';
import 'package:moflix_aplli_flutter/pages/trending.dart';
import 'package:moflix_aplli_flutter/themes/color.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primary
    ),
    home : MyHomePage(),
    
  ));
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _seletedItem = 0;
  var _pages = [DiscoverPage(), TrendingPage(),];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('MoFlix', style: TextStyle(fontSize: 25, color: whiteGhost,),),
        centerTitle: true,
        elevation: 0.0
      ),
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _seletedItem = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primary,
        selectedItemColor: yellowGrad,
        unselectedItemColor: whiteGhost,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.saved_search_outlined), label: 'Découverte'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up_outlined), label: 'Tendance'),
      
        ],
        currentIndex: _seletedItem,
        onTap: (index) {
          setState(() {
            _seletedItem = index;
            _pageController.animateToPage(_seletedItem,
                duration: Duration(milliseconds: 100), curve: Curves.linear);
          });
        },
      ),
    );
  }
}

