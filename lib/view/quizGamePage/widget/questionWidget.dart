
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/apiProvider.dart';
import 'dart:math' as math;

import 'package:wikisanchez/provider/quizCounter.dart';
import 'package:wikisanchez/provider/quizLength.dart';
import 'package:wikisanchez/view/resultGamePage/resultGamepage.dart';



class QuestionWidget extends ConsumerStatefulWidget {
  final data;
  final PageController controller;
  const QuestionWidget({Key? key,required this.data, required this.controller}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends ConsumerState<QuestionWidget> {

  String correct(int index){
    if(ref.watch(answersProvider) == index){
      return '✔️';
    }
    else{
      return '';
    }
    
  }

 
  

  int answers = math.Random().nextInt(4);

  final answersProvider = StateProvider<int>((ref) {
    return -1;
  });

  final isPressProvider = StateProvider<bool>((ref) {
    return false;
  });

  
  Widget buttomGame(){
    if(widget.controller.page != ref.watch(quizLenghtProvider)-1){
return  GestureDetector(
              onTap: () {
                ref.watch(isPressProvider) == true
                ? widget.controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut)
                : null;
              },
              child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35 , vertical: 20),
                    child: Text('next',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.h,
                    color: ref.watch(isPressProvider) == true
                ? const Color.fromRGBO(74, 221, 67, 1)
                : Colors.grey[300],)))));
    }
    else{
      return  GestureDetector(
              onTap: () {
                ref.watch(isPressProvider) == true
                ? Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const resultGamePage()),
  )
                : null;
              },
              child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                    child: Text('end',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.h,
                    color: ref.watch(isPressProvider) == true
                ? const Color.fromRGBO(74, 221, 67, 1)
                : Colors.grey[300],
                    ),))));
    }
  }


  
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.watch(apiProvider).getCharacterResult(
        'https://rickandmortyapi.com/api/character/${widget.data.toString()}'
        ),


      builder: (BuildContext context, AsyncSnapshot snapshot) {

        
    
        
        if(snapshot.hasData){
          return SizedBox(
            height: 90.h,
            child: Padding(
              
            padding: const EdgeInsets.only(top: 40, left: 20 ,right: 20),
         
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                                      
                  CircleAvatar(
                    maxRadius: 20.h,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(snapshot.data[answers].image),
                  ),
                 
                    
                 Text('Who is this character', style:  TextStyle(fontSize: 4.h,
                      fontWeight: FontWeight.w400),),
                 
                  GestureDetector(
                    onTap: () {
                     if (ref.watch(isPressProvider) == false) {
                       ref.read(answersProvider.notifier).state = answers;
                       ref.read(isPressProvider.notifier).state = true;
                       if (ref.watch(answersProvider) == 0) {
                         ref.read(quizProvider.notifier).state = ref.watch(quizProvider) + 1;
                     
                       }
                     }
                    },
                     child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: 90.w,
                      height: 6.5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ref.watch(answersProvider) != 0  
                        ?const Color.fromRGBO(74, 221, 67, 1)
                        :const Color.fromARGB(255, 50, 146, 45)
                      ),
                      child: Center(child: Text(snapshot.data[0].name + correct(0), textAlign: TextAlign.center ,
                      style: TextStyle(fontSize: 2.5.h, fontWeight: FontWeight.w600),)),
                      ),
                   ),
            
                   GestureDetector(
                    onTap: () {
                     if (ref.watch(isPressProvider) == false) {
                       ref.read(answersProvider.notifier).state = answers;
                       ref.read(isPressProvider.notifier).state = true;
                       if (ref.watch(answersProvider) == 1) {
                         ref.read(quizProvider.notifier).state = ref.watch(quizProvider) + 1;
                     
                       }
                     }
                    },
                     child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: 90.w,
                      height: 6.5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ref.watch(answersProvider) != 1
                        ?const Color.fromRGBO(74, 221, 67, 1)
                        :const Color.fromARGB(255, 50, 146, 45)
                      ),
                      child: Center(child: Text(snapshot.data[1].name + correct(1),textAlign: TextAlign.center ,
                       style: TextStyle(fontSize: 2.5.h, fontWeight: FontWeight.w600),)),
                      ),
                   ),
                   
                 GestureDetector(
                    onTap: () {
                     if (ref.watch(isPressProvider) == false) {
                       ref.read(answersProvider.notifier).state = answers;
                       ref.read(isPressProvider.notifier).state = true;
                       if (ref.watch(answersProvider) == 2) {
                         ref.read(quizProvider.notifier).state = ref.watch(quizProvider) + 1;
                     
                       }
                     }
                    },
                     child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: 90.w,
                      height: 6.5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ref.watch(answersProvider) != 2  
                        ?const Color.fromRGBO(74, 221, 67, 1)
                        :const Color.fromARGB(255, 50, 146, 45)
                      ),
                      child: Center(child: Text(snapshot.data[2].name + correct(2),textAlign: TextAlign.center ,
                       style: TextStyle(fontSize: 2.5.h, fontWeight: FontWeight.w600),)),
                      ),
                   ),
            
                   GestureDetector(
                    onTap: () {
                     if (ref.watch(isPressProvider) == false) {
                       ref.read(answersProvider.notifier).state = answers;
                       ref.read(isPressProvider.notifier).state = true;
                       if (ref.watch(answersProvider) == 3) {
                         ref.read(quizProvider.notifier).state = ref.watch(quizProvider) + 1;
                     
                       }
                     }
                    },
                     child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: 90.w,
                      height: 6.5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ref.watch(answersProvider) !=3  
                        ?const Color.fromRGBO(74, 221, 67, 1)
                        :const Color.fromARGB(255, 50, 146, 45)
                      ),
                      child: Center(child: Text(snapshot.data[3].name + correct(3),textAlign: TextAlign.center , 
                      style: TextStyle(fontSize: 2.5.h, fontWeight: FontWeight.w600),)),
                      ),
                   ),
            
             
                 
                buttomGame(),
    
                          
                ],
                
                
                
              ),
            
        ),
          );
        }
        else{
          return SizedBox(
            height: 90.h,
            child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20 ,right: 20),
                   
                 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    
                  CircleAvatar(
                    maxRadius: 20.h,
                    backgroundColor: Colors.grey[300],
                  ),
                  
                  Container(
                    height: 6.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                   
                    Container(
                    height: 6.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                   
                    Container(
                    height: 6.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                   
                    Container(
                    height: 6.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                   
            
             
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                    child: Text('next',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.h,
                    color: Colors.grey))))
               
              
               
            
              
                          
                ],
                
                
                
              ),
                  
                  ),
          );
        }
      },
    );
  }
}