import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}
String result = '';
class _CalculatorState extends State<Calculator> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation rotateAnim;
  Animation<Color> colorAnim;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 5), vsync: this);
    rotateAnim = Tween<double>(begin: 0.0,end: 2 * math.pi,).animate(_controller);
    colorAnim = ColorTween(begin: Colors.pink, end: Colors.purple)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade200,
        body: Column(
          children: [
            SizedBox(
              height: kToolbarHeight / 2,
            ),
            AnimatedBuilder(
              animation: rotateAnim,
              child: widget,
              builder: (context, widget) {
                return Transform(
                  transform: Matrix4.rotationY(rotateAnim.value),
                  child: Center(
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade300,
                          borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: Text('Greatness Only!!',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),

                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                );
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Text(result,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              color: Colors.pink.shade300,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                child: NumberCard(
                                  text: '7',
                                  onTap: (){
                                    setState(() {
                                      result +='7';
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: NumberCard(
                                text: '8',
                                onTap: (){
                                  setState(() {
                                    result +='8';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: NumberCard(
                                text: '9',
                                onTap: (){
                                  setState(() {
                                    result +='9';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: NumberCard(
                                text: '4',
                                onTap: (){
                                  setState(() {
                                    result +='4';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: NumberCard(
                                text: '5',
                                onTap: (){
                                  setState(() {
                                    result +='5';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: NumberCard(
                                text: '6',
                                onTap: (){
                                  setState(() {
                                    result +='6';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: NumberCard(
                                text: '1',
                                onTap: (){
                                  setState(() {
                                    result +='1';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: NumberCard(
                                text: '2',
                                onTap: (){
                                  setState(() {
                                    result +='2';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: NumberCard(
                                text: '3',
                                onTap: (){
                                  setState(() {
                                    result +='3';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: NumberCard(
                                text: '0',
                                onTap: (){
                                  setState(() {
                                    result +='0';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: NumberCard(
                                text: '.',
                                onTap: (){
                                  setState(() {
                                    result +='.';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: NumberCard(
                                text: '=',
                                onTap: (){

                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.backspace_outlined,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        FaIcon(FontAwesomeIcons.divide,
                        size: 45.0,
                        color: Colors.white,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NumberCard extends StatefulWidget {
  final String text;

  final GestureTapCallback onTap;

  NumberCard({this.text,@required this.onTap});
  @override
  _NumberCardState createState() => _NumberCardState(text: text,onTap: onTap);
}

class _NumberCardState extends State<NumberCard> with TickerProviderStateMixin {
   AnimationController controller;
   Animation rotateAnim;
   String text;
   GestureTapCallback onTap;

   _NumberCardState({this.text, this.onTap,});

   @override
  void initState() {
  super.initState();
  controller = AnimationController(duration: const Duration(milliseconds: 500),vsync: this);
  rotateAnim = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    )
  );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        return Transform(
          transform: Matrix4.rotationY(rotateAnim.value),
          child: InkWell(
            onTap: () async {
              this.onTap();
              for (int i = 0; i < 2; i++) {
                await controller.forward();
                await controller.reverse();
              }
            },
            child: Container(
              // color: Colors.pink,
              margin: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          alignment: Alignment.center,
        );
      },
    );

  }
}
