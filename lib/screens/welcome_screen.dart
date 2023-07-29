import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 1), vsync: this,);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {

      });
      print(controller.value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 80.0,
                  ),
                ),
        SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.w900,
          color: Colors.black54,
          fontFamily: 'Agne',


      ),
      child: AnimatedTextKit(

        animatedTexts: [
          TypewriterAnimatedText(
              'Flash Chat',
            speed: const Duration(milliseconds: 200),
          ),
         ],

      ),
    ),
    ),

              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(buttonColor:Colors.lightBlueAccent,buttonText: 'Log in',buttonFunction: () {Navigator.pushNamed(context, LoginScreen.id);},),
            RoundedButton(buttonColor:Colors.blueAccent,buttonText: 'Register',buttonFunction: () {Navigator.pushNamed(context, RegistrationScreen.id);},),

          ],
        ),
      ),
    );
  }
}

