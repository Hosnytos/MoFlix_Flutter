import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart'  as http;
import 'package:flutter/material.dart';
import 'package:moflix_aplli_flutter/pages/movieShow.dart';
import 'package:moflix_aplli_flutter/themes/color.dart';

class DiscoverPage extends StatefulWidget {

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

    return Scaffold(
      appBar: AppBar(
        title: Text("Films à découvrir", style: TextStyle(fontSize: 25, color: Colors.yellowAccent[700],),),
        centerTitle: true,
        backgroundColor: DarkSlateGray
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    if(moviesD.contains(null) || moviesD.length < 0 || isLoading ){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(DarkSlateGray),));
    }
    return ListView.builder(
      itemCount: moviesD.length,
      itemBuilder: (context, index){

        return getCard(moviesD[index]);
    });
  }
  Widget getCard(index){
    var originalTitleMovie = index['original_title'];
    var commonTitleMovie = index['title'];
    var dateMovie = index['release_date'];
    var overviewMovie = index['overview'];
    var coverMovie = index['backdrop_path'];
    var posterMovie = index['poster_path'];
    var popularityMovie = index['popularity'];
    var voteAverageMovie = index['vote_average'];
    var voteCountMovie = index['vote_count'];
    
    return Container(
      decoration: BoxDecoration( color: DarkSlateGray.withOpacity(0.99),
        ),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: DarkSlateGray,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListTile(
              title: Row(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 300,
                    width: 190,
                    decoration: BoxDecoration(
                      color: DarkSlateGray,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: 
                      NetworkImage('https://image.tmdb.org/t/p/w500'+posterMovie.toString())
                    )
                  ),
                  ),
                  SizedBox(height: 20, width: 25,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(width: MediaQuery.of(context).size.width*0.3,child: Text(originalTitleMovie.toString(), style: TextStyle(fontSize: 17, color: whiteGhost, decorationStyle: TextDecorationStyle.wavy,),)),
                      SizedBox(height: 10,),
                      Container(width: MediaQuery.of(context).size.width*0.3,child: Text(commonTitleMovie.toString(), style: TextStyle(fontSize: 12, color: whiteGhost,),)),                      SizedBox(height: 10,),
                      Text("Sortie : " + dateMovie.toString(), style: TextStyle(fontSize: 10, color: whiteGhost,),),
                    ]
                  )
                ]
              ),



            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
              MovieShow(originalTitleMovie, commonTitleMovie, dateMovie, overviewMovie, coverMovie, posterMovie , popularityMovie, voteAverageMovie, voteCountMovie)));
            },
            ),
          ),
          ),
    );
  }

}