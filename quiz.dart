import 'package:flutter/material.dart';
import 'package:quiz_app/pages/question_page.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/pages/starting_page.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});




  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}


class _QuizState extends State<Quiz>{

  Widget? activescreen;

  List<String> userselectedans=[];

  @override
  void initState(){
    setState(() {
      userselectedans=[];
      activescreen=StartingPage(changescreen);
    });

    super.initState();
  }

  void changescreen(){
    setState(() {
      activescreen=QuestionPage(resultscreen: resultscreen,choosenans: choosenans);
    });
  }

  void resultscreen(){
    AssetsAudioPlayer aud= AssetsAudioPlayer();
    aud.open(Audio('assets/music/joyous-chime-notification.ogg'));
    setState(() {
      activescreen=ResultPage(userselectedans: userselectedans,resetscreen: resetscreen,);
    });
  }

  void resetscreen(){
    initState();
  }

  void choosenans(String ans){
    setState(() {
      userselectedans.add(ans);
    });
  }
  @override

  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0075FF), Color(0xFF3714C2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activescreen,
        ),
      ),
    );
  }
}