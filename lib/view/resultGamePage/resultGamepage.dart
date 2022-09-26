import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/quizCounter.dart';
import 'package:wikisanchez/provider/quizLength.dart';
import 'package:wikisanchez/view/homePage/homePage.dart';

class resultGamePage extends ConsumerStatefulWidget {
  const resultGamePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _resultGamePageState();
}

class _resultGamePageState extends ConsumerState<resultGamePage> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${ref.read(quizProvider)}/${ref.read(quizLenghtProvider)}', style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.w900),),
            SizedBox(height: 3.h,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: const Color.fromRGBO(74, 221, 67, 1),
              shadowColor: const Color.fromARGB(255, 63, 187, 56),
              elevation: 3,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(10.w, 7.h), 
            ),
              onPressed: (){
              
              ref.read(quizProvider.notifier).state = 0;

              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
            }, child: const Text('go home'),)
          ],
         ),
       ),
    );
  }
}