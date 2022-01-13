import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/control/getpoplardata.dart';
import 'package:movie_app/control/gettoprate.dart';
import 'package:movie_app/screen/disscreen/disscreens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 3,
        title: const Text(
          "Netflix",
          style: TextStyle(color: primarycolor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, watch, child) {
              final viewmodeltoprate = watch(getTopRatedata);
              return CarouselSlider.builder(
                  itemCount: viewmodeltoprate.listDataModel.length,
                  itemBuilder: (context, int itemIndex, int pageViewIndex) {
                    return GridTile(
                      child: Image.network(
                        image_url +
                            viewmodeltoprate
                                .listDataModel[itemIndex].poster_path,
                        fit: BoxFit.fill,
                      ),
                      footer: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        color: Colors.red.withOpacity(0.6),
                        child: Text(
                          viewmodeltoprate.listDataModel[itemIndex].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: black),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.5,
                      viewportFraction: 0.7,
                      height: MediaQuery.of(context).size.height / 3,
                      initialPage: 0,
                      reverse: false,
                      autoPlayInterval: Duration(
                        seconds: 3,
                      ),
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(microseconds: 300),
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal));
            },
          ),
          Expanded(child:
          Consumer(builder: ( context,  watch,  child) {
    final viewmodelpoplar = watch(getpoplardata);
    return Padding(
        padding: EdgeInsets.all(5.0),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount:  viewmodelpoplar.listDataModel.length,
          itemBuilder:(BuildContext context,int index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                  return DisScreen(
                    title:viewmodelpoplar.listDataModel[index].title ,overview:viewmodelpoplar.listDataModel[index].overview ,backdrop_path:viewmodelpoplar.listDataModel[index].backdrop_path ,id:viewmodelpoplar.listDataModel[index].id ,vote_average:viewmodelpoplar.listDataModel[index].vote_average ,poster_path:viewmodelpoplar.listDataModel[index].poster_path , original_title: '',
                  );

                                  }));
              },
              child: Card(
                color: primarycolor,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      Image.network(
                        image_url +
                            viewmodelpoplar
                                .listDataModel[index].poster_path,
                        fit: BoxFit.cover,
                      ),
                      Card(

                        child:Container(
                          color: black,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "${viewmodelpoplar.listDataModel[index].title}",

                            style: TextStyle(
                                color: Colors.white,fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ) ,
                      )
                    ],
                  ),
                ),

              ),

            );
          },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.fit(1),

      ),



    );


          },


          ) ,)
        ],
      ),
    );
  }
}
