import 'package:flutter/material.dart';
import 'package:moflix_aplli_flutter/themes/color.dart';


class MovieShow extends StatefulWidget{
  
  MovieShow(this.originalTitleMovie, this.commonTitleMovie, this.dateMovie, this.overviewMovie, this.coverMovie, this.posterMovie ,this.popularityMovie, this.voteAverageMovie, this.voteCountMovie);  
  
  static const routeName = '/discover-show';
  var originalTitleMovie;
  var commonTitleMovie;
  var dateMovie;
  var overviewMovie;
  var coverMovie;
  var posterMovie;
  var popularityMovie;
  var voteAverageMovie;
  var voteCountMovie;
  
  @override
  State<StatefulWidget> createState() {
    return MovieShowImpl(
      originalTitleMovie: this.originalTitleMovie,
      commonTitleMovie: this.commonTitleMovie,
      dateMovie: this.dateMovie,
      overviewMovie: this.overviewMovie,
      coverMovie: this.coverMovie,
      posterMovie: this.posterMovie,
      popularityMovie: this.popularityMovie,
      voteAverageMovie: this.voteAverageMovie,
      voteCountMovie: this.voteCountMovie,
    );
  }
  
}


class MovieShowImpl extends State<MovieShow> {

  MovieShowImpl({this.originalTitleMovie, this.commonTitleMovie, this.dateMovie, this.overviewMovie, this.coverMovie, this.posterMovie , this.popularityMovie, this.voteAverageMovie, this.voteCountMovie});  
  static const routeName = '/discover-show';
  var originalTitleMovie;
  var commonTitleMovie;
  var dateMovie;
  var overviewMovie;
  var coverMovie;
  var posterMovie;
  var popularityMovie;
  var voteAverageMovie;
  var voteCountMovie;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(commonTitleMovie.toString(), style: TextStyle(fontSize: 18, color: Colors.yellowAccent[700],),),
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

      return Container(
        decoration: BoxDecoration(image: DecorationImage(
          image: NetworkImage('https://image.tmdb.org/t/p/w500'+coverMovie.toString()),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
           ),
        ),
        child: Center(
        child: Card(
          color: Colors.black.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListTile(
              title: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60/2),
                      color: primary,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: 
                      NetworkImage('https://image.tmdb.org/t/p/w500'+posterMovie.toString())
                    )
                  ),
                  ),
                  SizedBox(height: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(originalTitleMovie.toString(), style: TextStyle(fontSize: 30, color: whiteGhost, decorationStyle: TextDecorationStyle.wavy,),),
                      SizedBox(height: 10,),
                      Text(commonTitleMovie.toString(), style: TextStyle(color: whiteGhost, fontSize: 18),),
                      SizedBox(height: 10,),
                      Text("Sortie : " + dateMovie.toString(), style: TextStyle(color: whiteGhost, fontSize: 15),),
                      SizedBox(height: 30,),
                      Center(child: 
                        Text( "★★★" + "    " + voteAverageMovie.toString() + "   " + "★★★" , textAlign: TextAlign.center ,style: TextStyle(color: Colors.yellow, fontSize: 20),
                          ),
                        ),
                      SizedBox(height: 30,),
                      Text("Synopsis : ", style: TextStyle(color: whiteGhost, fontSize: 22)),
                      SizedBox(height: 20,),
                      Text(overviewMovie.toString(), style: TextStyle(color: whiteGhost, ),),
                      SizedBox(height: 30,),
                    ]
                  )
                ]
              ),

            ),
          ),
          ),
    ),
      );

    }

}
