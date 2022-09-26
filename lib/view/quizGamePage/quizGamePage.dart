import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikisanchez/provider/quizLength.dart';
import 'dart:math' as math;

import 'package:wikisanchez/view/quizGamePage/widget/questionWidget.dart';

 List<List<int>> charactherQuestion(WidgetRef ref){
      List<List<int>> result = [];
      for (var i = 0; i < ref.watch(quizLenghtProvider); i++) {
      List<int> listResult = [];
        for (var i = 0; i < 4; i++) {
          int n = math.Random().nextInt(825);
          listResult.add(n);
        }
        result.add(listResult);
      }
      return result;
    }


class QuizGamePage extends ConsumerStatefulWidget {
  const QuizGamePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizGamePageState();
}

class _QuizGamePageState extends ConsumerState<QuizGamePage> {




     final controller = PageController(
      keepPage: true
    );


   
 
 
  @override
  Widget build(BuildContext context) { 
   final  dataList = charactherQuestion(ref);
    print(dataList);
    return Scaffold(
      
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: dataList.length,
        itemBuilder: (context, index) {
        return 
            QuestionWidget(data:dataList[index], controller: controller,);
           
         
        
      },
      ),
    );
  }
}

 