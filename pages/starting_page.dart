import 'package:flutter/material.dart';

class StartingPage extends StatelessWidget {
  const StartingPage(this.changescreen,{super.key});

  final void Function() changescreen;

  @override
  Widget build(context) {
    return SizedBox.expand(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 90),
          Image.asset('assets/images/img.png',color: const Color.fromARGB(150, 255, 255, 255),),
          const SizedBox(height: 90),
          const Text(
            'Quiz App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          const SizedBox(height: 90),
          OutlinedButton.icon(
            onPressed: changescreen,
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
            label: const Text("Start quiz"),
            icon: const Icon(Icons.arrow_right_alt,size: 40),
          ),
        ],
      ),
    );
  }
}
