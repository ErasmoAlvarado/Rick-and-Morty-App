import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:sizer/sizer.dart';

class ErrorInternetWidget extends StatefulWidget {
  const ErrorInternetWidget({super.key});

  @override
  State<ErrorInternetWidget> createState() => _ErrorInternetWidgetState();
}

class _ErrorInternetWidgetState extends State<ErrorInternetWidget> {
  

   List resultList = [
    ['assets/bigHead.png','Show me what you got'],
    ['assets/portal.png','No portal found...'],
    ['assets/wirdSun.png','ahhhhhhhhhhh'],
    ['assets/moonMen.png', 'Goodbye Moonmen'],
  ];

  late int index;

  @override
  void initState() {
    index = math.Random().nextInt(4);
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 6.h,),
        SizedBox(
          height: 50.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Image.asset(resultList[index][0], height: 45.h)),
            Positioned(
              bottom: 10,
                child: Column(
                 
                  children: [
                     Text(resultList[index][1], style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.4, fontSize: 20.sp),),
                      Opacity(
                        opacity: 0.7,
                        child: Text('no interntet connection',style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.4, fontSize: 12.sp)))
                  ],
                ),
              )
            ],
          ),
        ),
       
       
      ],
    );
  }
}