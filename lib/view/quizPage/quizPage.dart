

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/quizCounter.dart';
import 'package:wikisanchez/provider/quizLength.dart';
import 'package:wikisanchez/view/quizGamePage/quizGamePage.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizGameState();
}

class _QuizGameState extends ConsumerState<QuizPage> {

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    return Scaffold(
      body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('get swifty', style: TextStyle(fontSize: 6.h,
                fontWeight: FontWeight.w600),),
                Text('Quiz', style: TextStyle(fontSize: 16.w, color: const Color.fromARGB(255, 74, 221, 67), 
                fontWeight: FontWeight.w900),),
                
                SizedBox(height: 5.h,),

                Center(
                  child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: const Color.fromRGBO(74, 221, 67, 1),
              shadowColor: const Color.fromARGB(255, 63, 187, 56),
              elevation: 3,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(90.w, 7.h), 
            ),
            onPressed: () {
              ref.read(quizProvider.notifier).state =0;
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const QuizGamePage()),
  );
            },
            child: Text('Start',style: TextStyle(fontSize: 3.h)),
          ),
                ),

          SizedBox(height: 2.h,),

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromRGBO(74, 221, 67, 1),
                shadowColor: const Color.fromARGB(255, 63, 187, 56),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(90.w, 7.h), 
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Exit', style: TextStyle(fontSize: 3.h),),
            ),
          ),

           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                GestureDetector(
                        onTap: () {
                          ref.read(quizLenghtProvider.notifier).state = ref.watch(quizLenghtProvider) -5;
                        if(ref.watch(quizLenghtProvider) <= 5){
                            ref.read(quizLenghtProvider.notifier).state = 5;
                        } 
           
                       },
                        child: const CircleAvatar(
                          backgroundColor: Color.fromRGBO(74, 221, 67, 1) ,
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                 Text('Count : ${ref.watch(quizLenghtProvider)}'),
                 GestureDetector(
                        onTap: () {
                          ref.read(quizLenghtProvider.notifier).state = ref.watch(quizLenghtProvider) +5;
                        if(ref.watch(quizLenghtProvider) >= 100){
                            ref.read(quizLenghtProvider.notifier).state = 100;
                        } 
           
                       },
                        child: const CircleAvatar(
                          backgroundColor: Color.fromRGBO(74, 221, 67, 1) ,
                          child: Icon(Icons.arrow_forward),
                        ),
                      ),
               ],
             ),
           )
              ],
            ),
      
    );
  }
}