import 'package:flutter/material.dart';
import 'package:moflix_aplli_flutter/themes/color.dart';


class DiscoverShow extends StatefulWidget{
  
  DiscoverShow(this.originalTitleMovie, this.commonTitleMovie, this.dateMovie, this.overviewMovie, this.coverMovie, this.popularityMovie, this.voteAverageMovie, this.voteCountMovie);  
  //List moviesD = [];
  static const routeName = '/discover-show';
  var originalTitleMovie;
  var commonTitleMovie;
  var dateMovie;
  var overviewMovie;
  var coverMovie;
  var popularityMovie;
  var voteAverageMovie;
  var voteCountMovie;
  
  @override
  State<StatefulWidget> createState() {
    return DiscoverShowImpl(
      originalTitleMovie: this.originalTitleMovie,
      commonTitleMovie: this.commonTitleMovie,
      dateMovie: this.dateMovie,
      overviewMovie: this.overviewMovie,
      coverMovie: this.coverMovie,
      popularityMovie: this.popularityMovie,
      voteAverageMovie: this.voteAverageMovie,
      voteCountMovie: this.voteCountMovie,
    );
  }
  
}


class DiscoverShowImpl extends State<DiscoverShow> {

  DiscoverShowImpl({this.originalTitleMovie, this.commonTitleMovie, this.dateMovie, this.overviewMovie, this.coverMovie, this.popularityMovie, this.voteAverageMovie, this.voteCountMovie});  
  static const routeName = '/discover-show';
  var originalTitleMovie;
  var commonTitleMovie;
  var dateMovie;
  var overviewMovie;
  var coverMovie;
  var popularityMovie;
  var voteAverageMovie;
  var voteCountMovie;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(commonTitleMovie.toString()),
        centerTitle: true,
      ),
      body: getBody(),
    );

  }

  Widget getBody(){
    return ListView(
      children: [getCorpus()],
    );
  } 

  Widget getCorpus(){

      return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListTile(
            title: Column(
              children: <Widget>[
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: primary,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: 
                    NetworkImage('https://image.tmdb.org/t/p/w500'+coverMovie.toString())
                  )
                ),
                ),
                SizedBox(height: 40,),
                //SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(originalTitleMovie.toString(), style: TextStyle(fontSize: 30, color: Colors.red, decorationStyle: TextDecorationStyle.wavy,),),
                    SizedBox(height: 10,),
                    Text(commonTitleMovie.toString(), style: TextStyle(fontSize: 18),),
                    SizedBox(height: 10,),
                    Text("Sortie : " + dateMovie.toString(), style: TextStyle(fontSize: 15),),
                    SizedBox(height: 20,),
                    Text(overviewMovie.toString(), style: TextStyle(color: primary),),
                  ]
                )
              ]
            ),

          ),
        ),
        ),
    );

    }

}
