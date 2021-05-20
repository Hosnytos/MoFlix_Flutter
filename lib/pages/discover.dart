import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart'  as http;
import 'package:flutter/material.dart';
import 'package:moflix_aplli_flutter/pages/discoverShow.dart';
import 'package:moflix_aplli_flutter/themes/color.dart';
import 'package:intl/intl.dart';
import 'package:devicelocale/devicelocale.dart';

class DiscoverPage extends StatefulWidget {

  static const routeName = '/discover';
  //var originalTitleMovie;

  //DiscoverPage(this.originalTitleMovie);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  
  final List<Locale> systemLocales = WidgetsBinding.instance!.window.locales;
  
  List moviesD = [];
  bool isLoading = false;
  final apiKey = '061e411e417766bfc7b370d08d2fbd49';
  final apiUrl = 'https://api.themoviedb.org/3';
  var discover = '/discover/movie';
  var langue;
  var completeUrl;

  @override
  void initState() {
    super.initState();
    this.fetchMovie();
  }

  fetchMovie() async {

    setState(() {
      isLoading = true;
    });
    langue = systemLocales.first.languageCode;
    print(langue);
    completeUrl = apiUrl + discover + '?api_key=' + apiKey + "&language=" + langue;
    var response = await http.get(Uri.parse(completeUrl));
    if(response.statusCode == 200){
      var items = json.decode(response.body)['results'];
      //var ok = response.statusCode;
      //print(items);
      setState(() {
        moviesD = items;
        isLoading = false;
      });
    }
    else{
      setState(() {
        moviesD = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as DiscoverPage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Films à découvrir"),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    if(moviesD.contains(null) || moviesD.length < 0 || isLoading ){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(primary),));
    }
    return ListView.builder(
      itemCount: moviesD.length,
      itemBuilder: (context, index){
        // ignore: unused_label
        key: ValueKey(moviesD[index]);
        return getCard(moviesD[index]);
    });
  }
  Widget getCard(index){
    var originalTitleMovie = index['original_title'];
    var commonTitleMovie = index['title'];
    var dateMovie = index['release_date'];
    var overviewMovie = index['overview'];
    var coverMovie = index['poster_path'];
    var popularityMovie = index['popularity'];
    var voteAverageMovie = index['vote_average'];
    var voteCountMovie = index['vote_count'];
    //DateTime dateTime = new DateFormat("dd/MM/yyyy HH:mm:ss").parse(dateMovie.toString());
    
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Column(
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(60/2),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: 
                    NetworkImage('https://image.tmdb.org/t/p/w500'+coverMovie.toString())
                  )
                ),
                ),
                SizedBox(height: 20,),
                //SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(originalTitleMovie.toString(), style: TextStyle(fontSize: 20, color: Colors.red, decorationStyle: TextDecorationStyle.wavy,),),
                    SizedBox(height: 10,),
                    Text(commonTitleMovie.toString(), style: TextStyle(fontSize: 15),),
                    SizedBox(height: 10,),
                    Text("Sortie : " + dateMovie.toString(), style: TextStyle(fontSize: 15),),
                  ]
                )
              ]
            ),



          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
            DiscoverShow(originalTitleMovie, commonTitleMovie, dateMovie, overviewMovie, coverMovie, popularityMovie, voteAverageMovie, voteCountMovie)));
          },
          ),
        ),
        ),
    );
  }

}