import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import '../util/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CreditsScreen extends StatelessWidget {
  final PageController controller;

  const CreditsScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          //Back Button & Heading
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    controller.animateToPage(0,
                        duration: Duration(milliseconds: 150),
                        curve: Curves.easeInOut);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.8,
                          )),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width > 360 ? 80 : 60),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: AutoSizeText(
                    "About",
                    style: TextStyle(
                      fontSize: 21,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxFontSize: 21,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),

          //Column of image, name and button
          Positioned.fill(
            top: 70,
            child: Align(
              alignment: Alignment.center,
              child: LayoutBuilder(
                builder: (ctx, constraint) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: constraint.maxHeight * 0.31,
                      height: constraint.maxHeight * 0.31,
                      image: AssetImage("assets/corona_virus.png"),
                    ),

                    SizedBox(height: 20),

                    //App Name
                    AutoSizeText(
                      "Covid-19 Informer",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxFontSize: 25,
                    ),

                    //Version number
                    AutoSizeText(
                      "Version 1.0.0",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 0.5,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff009a88),
                      ),
                      maxFontSize: 18,
                      maxLines: 1,
                    ),

                    SizedBox(height: 10),

                    //License Button
                  ],
                ),
              ),
            ),
          ),

          //Paragraph
          Positioned(
            top: 375,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: AutoSizeText(
                "Covid-19 Informer is an app made with Flutter framework to provide worldwide information related to Covid-19 pandemic. It shows the affected, recovered, deaths, tests and infection probability for each country.",
                style: kStyle.copyWith(
                  fontSize: 16,
                  letterSpacing: 0.4,
                  height: 1.6,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.normal,
                  color: kGreen,
                ),
                maxFontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          //Author Credits
          Positioned.fill(
            bottom: 25,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () async {
                  const url = 'https://github.com/Coder-Manuel';
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                      forceWebView: false,
                    );
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.4,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 5),
                      AutoSizeText(
                        "Developer: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        maxFontSize: 15,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        "Coder Manuel",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        maxFontSize: 15,
                        maxLines: 1,
                      ),
                      SizedBox(width: 5),
                      Image(
                        height: 18,
                        width: 18,
                        color: Colors.black,
                        image: AssetImage("assets/github.png"),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
