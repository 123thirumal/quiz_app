import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key,required this.resultscreen,required this.choosenans});

  final void Function() resultscreen;
  final void Function(String ans) choosenans;

  @override
  State<QuestionPage> createState(){
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {

  int currentquestionindex=0;


  void afterselectingans(String ans){
    setState(() {
      if(currentquestionindex==3) {
        widget.choosenans(ans);
        widget.resultscreen();
      }
      else{
        widget.choosenans(ans);
        currentquestionindex++;
      }
    });
  }


  @override
  Widget build(context) {
    final currentquestion = questions[currentquestionindex];

    return SizedBox.expand(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.ques,
              style: GoogleFonts.jua(
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ...currentquestion.shuffledata().map((item) {
              return Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          afterselectingans(item);
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40,vertical: 10),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 30,
                            ),
                            backgroundColor: const Color(0xFF14175E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                        child: Text(item)),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
