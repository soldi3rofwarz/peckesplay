import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:lottie/lottie.dart';

class GameSec1 extends StatelessWidget {
  const GameSec1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height,
            child:  const RiveAnimation.asset('assets/img/bg_gameSec.riv', fit: BoxFit.cover,)
          ),
          Container(
            width:600,
            margin: const EdgeInsets.only(left: 60.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 220,
                      height: 300,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  child: Lottie.asset('assets/img/bg_tetris.json'),
                                ),

                                Container(
                                  width: 120,
                                  height: 120,
                                  child: ElevatedButton(
                                    onPressed:( ) {Navigator.pushNamed(context, 'maintetris');},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,

                                    ),
                                    child: null, ),
                                )
                              ],
                            ),
                            const Text("Tetris", style: TextStyle(
                              fontSize: 20,
                              fontFamily: "bonita",
                              color: Colors.white,
                            ),)
                          ],
                        )
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.black,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                child: Lottie.asset('assets/img/brain.json'),
                              ),

                              Container(
                                width: 120,
                                height: 120,
                                child: ElevatedButton(
                                  onPressed:( ) {Navigator.pushNamed(context, 'memoMain');},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,

                                  ),
                                  child: null, ),
                              )
                            ],
                          ),
                          const Text("Memoriza", style: TextStyle(
                            fontSize: 17,
                            fontFamily: "bonita",
                            color: Colors.white,
                          ),)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
