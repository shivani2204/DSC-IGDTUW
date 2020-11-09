import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red]),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                    radius: 95, backgroundImage: AssetImage("assets/me.jpg"))),
            SizedBox(
              height: 15,
            ),
            Text("Shivani Yadav",
                style: TextStyle(color: Colors.black, fontSize: 35.0)),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: Divider(
                color: Colors.black,
                height: 5.0,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Row(
                children: [
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.facebook),
                      onPressed: () async {
                        const url =
                            "https://www.facebook.com/shivani.yadav.405098/";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      onPressed: () async {
                        const url = "https://www.instagram.com/shivani4050/";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                      onPressed: () async {
                        const url =
                            "https://www.linkedin.com/in/shivani-yadav-ba4849192";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.github),
                      onPressed: () async {
                        const url = "https://www.github.com/shivani2204";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.kaggle),
                      onPressed: () async {
                        const url = "https://www.kaggle.com/shivani2204";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
