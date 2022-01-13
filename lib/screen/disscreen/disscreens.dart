import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import '../../constant.dart';
import '../homescreen/in_app_browser_example.screen.dart';

class DisScreen extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();

  String backdrop_path;
  int id;
  String original_title;
  String overview;
  String poster_path;
  String title;
  num vote_average;

  @override
  _DisScreenState createState() => _DisScreenState();

  DisScreen({
    required this.backdrop_path,
    required this.id,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.title,
    required this.vote_average,
  });
}

class _DisScreenState extends State<DisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Transform(
            transform: Matrix4.rotationY(math.pi),
            alignment: Alignment.center,
            child: Image.network(
              image_url + widget.poster_path,
              fit: BoxFit.fill,
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.red.withOpacity(0.2),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                        label: Text(
                          "Back",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  FlipCard(
                      fill: Fill.fillBack,
                      front: Container(
                        height: MediaQuery.of(context).size.height / 1.6,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    image_url + widget.poster_path),
                                fit: BoxFit.fill)),
                      ),
                      back: Container(
                        height: MediaQuery.of(context).size.height / 1.6,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  image_url + widget.backdrop_path,
                                ),
                                fit: BoxFit.fill)),
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 70,
                        child: Text(
                          "${widget.title}",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 30,
                        child: Text(
                          "${widget.vote_average} /10",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.overview}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await widget.browser.openUrlRequest(
                urlRequest: URLRequest(
                    url: Uri.parse(
                        "https://iegybest.co:2096/find/?q=${widget.title}")),
                options: InAppBrowserClassOptions(
                    inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                  useOnLoadResource: true,
                ))));
          },
          elevation: 10,
          backgroundColor: primarycolor,
          autofocus: true,
          label: Text(
            "Watch on EgyBest",
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
