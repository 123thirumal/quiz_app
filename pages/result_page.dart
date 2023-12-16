import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_data.dart';

class ResultPage extends StatefulWidget {
  ResultPage({super.key, required this.userselectedans,required this.resetscreen});

  final void Function() resetscreen;

  List<String> userselectedans;

  List<Map<String, Object>> finaldata = [];

  List<String> questions = [];
  List<String> correctans = [];

  int totalques = 4;
  int score = 0;

  @override
  State<ResultPage> createState() {
    return _ResultPageState();
  }
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(context) {
    //getting data
    setState(() {
      //for emptying previous data
      widget.finaldata = [];
      widget.questions = [];
      widget.correctans = [];
      widget.score = 0;

      for (int i = 0; i < 4; i++) {
        widget.questions.add(questions[i].ques);
        widget.correctans.add(questions[i].ans[0]);
      }

      //for setting score
      for (int i = 0; i < 4; i++) {
        if (widget.correctans[i] == widget.userselectedans[i]) {
          widget.score++;
        }
      }
    });

    //for creating list of finaldata
    setState(() {
      for (int i = 0; i < 4; i++) {
        widget.finaldata.add({
          'question-no': i + 1,
          'question': widget.questions[i],
          'selectedans': widget.userselectedans[i],
          'correctans': widget.correctans[i]
        });
      }
    });

    return SizedBox.expand(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 50),
          Text(
            'Result',
            style: GoogleFonts.jua(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            'You answered ${widget.score} correct out of ${widget.totalques}',
            style: GoogleFonts.jua(
              color: Colors.white,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3,color: Colors.white),
            ),
            child: SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(children: [
                  ...widget.finaldata.map((item) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.0),
                            color: item['selectedans'] as String ==
                                    item['correctans'] as String
                                ? Colors.green
                                : Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            item["question-no"].toString(),
                            style: GoogleFonts.jua(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          )),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question:${item['question']}',
                                style: GoogleFonts.jua(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Your answer:${item['selectedans']}',
                                style: GoogleFonts.jua(
                                  color: item['selectedans'] as String ==
                                          item['correctans'] as String
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Correct answer:${item['correctans']}',
                                style: GoogleFonts.jua(
                                  color: Colors.green,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    );
                  })
                ]),
              ),
            ),
          ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
        onPressed: widget.resetscreen,
        style: TextButton.styleFrom(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 40,
            ),
            backgroundColor: const Color(0xFF14175E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
        label: const Text("Retry"),
        icon: const Icon(Icons.restart_alt,size: 40),
      ),]
      ),)
    );
  }
}
