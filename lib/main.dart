import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peckes_play/SecondScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:peckes_play/GameSec1.dart';
import 'package:peckes_play/memory/MemoMain.dart';
import 'package:peckes_play/profileScreen.dart';
import 'package:peckes_play/tetris/Maintetris.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.leanBack,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        'one': (context) => FirstScreen(),
        'two': (context) => SecondScreen(),
        'games':(context)=> GameSec1(),
        'maintetris': (context) => Maintetris(),
        'success': (context)=>ProfileScreen(),
        'memoMain':(context)=> MemoMain()
      },
      initialRoute: 'one',
      home: FirstScreen()
    );
  }
}


class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            Container(
              child: Lottie.asset('assets/img/bg.json'),
            ),
            Row( key: key,
                children:<Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 340,
                          height: 100,

                          //margin: const EdgeInsets.only(left: 190.0),
                          child:
                          Container(

                            child: Image.asset('assets/img/logo.png', width: 100, height: 100,) ,
                          )

                      )
                    ],
                  ),


                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 360,
                          height: 360,
                          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: const Text(

                                  '¡¡Vamos a divertinos!!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Fredoka One",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(3.0, 3.0),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      Shadow(
                                        offset: Offset(10.0, 10.0),
                                        blurRadius: 8.0,
                                        color: Color.fromARGB(125, 0, 0, 255),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                  width: 140,
                                  height: 50,
                                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  child:
                                  ElevatedButton( key: key,
                                    onPressed: ( ) {Navigator.pushNamed(context, 'two');},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.amber,
                                        shadowColor: Colors.black54,

                                        elevation: 10
                                    ),
                                    child: const Text('Start'),

                                  )),
                            ],
                          ),
                        )
                      ]
                  )

                ]
            ),
          ],
          )


        )// This trailing comma makes auto-formatting nicer for build methods.
    ;
  }
}
