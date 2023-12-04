import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/home.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Home_Screen(),),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('News',textStyle: TextStyle(
                fontSize: 65,fontWeight: FontWeight.w600,color: Color(0xff2D5BD0)
            ),
            ),

          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}
