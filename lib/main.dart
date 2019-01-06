
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  Animation<double> animation;
  Animation<double> animation2;
  Animation<double> animation3;
  Animation<double> animation4;
  AnimationController animationController;
  AnimationController animationController2;
  AnimationController animationController3;
  AnimationController animationController4;

  int sec = 1000;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    animationController3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    animationController4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    animation = Tween(begin: 30.0, end: 0.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animation2 = Tween(begin: 30.0, end: 0.0).animate(animationController2)
      ..addListener(() {
        setState(() {});
      });

    animation3 = Tween(begin: 30.0, end: 0.0).animate(animationController3)
      ..addListener(() {
        setState(() {});
      });

    animation4 = Tween(begin: 30.0, end: 0.0).animate(animationController4)
      ..addListener(() {
        setState(() {});
      });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController2.forward();
      }
    });

    animation2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController3.forward();
      } else if (status == AnimationStatus.dismissed) {
        animationController.reverse();
      }
    });

    animation3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController4.forward();
      } else if (status == AnimationStatus.dismissed) {
        animationController2.reverse();
      }
    });

    animation4.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController4.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController3.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Come On"),
        ),
        body: Center(
          child: Container(
            width: (MediaQuery.of(context).size.width - 100),
            height: 300,
            child: Card(
              elevation: animation4.value,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Card(
                  elevation: animation3.value,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Card(
                      elevation: animation2.value,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 40, bottom: 40),
                        child: Card(
                          elevation: animation.value,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              onPressed: () {
                                animationController.forward();
                              },
                              elevation: animation.value,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
