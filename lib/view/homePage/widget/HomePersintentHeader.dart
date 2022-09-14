
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/tabProvider.dart';

class HomeHeader extends SliverPersistentHeaderDelegate{
  
  double maxH = 20.h;
  double minH = 13.5.h;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    double percent = (shrinkOffset / maxH -1).abs();
    double appbarOpacity = pow(percent, 8).toDouble();
    print(percent);
    return Container(
    
    color: Theme.of(context).brightness == Brightness.light
          ? Color.fromARGB(255, 245, 245, 245)
          : Colors.black,
  
    
      child: Stack(
        children: [
          Positioned(
            bottom: 80,
            child: Opacity(
              opacity: appbarOpacity,
              child: Container(
                 width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.wb_sunny_rounded, size: 4.h),
                      Text('WikiSanchez', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      Icon(Icons.search_rounded, size: 4.h,)
                    ],
                  ),
                ),
              ),
            )),
          Positioned(
            bottom: 13,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Consumer(
                builder: (context, ref, child) {
                  return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                GestureDetector(
                  onTap: () {
                    ref.read(tabProvider.notifier).state = 0;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    
                    height: ref.watch(tabProvider) == 0
                    ?8.5.h
                    :7.5.h,
                    width: 27.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:ref.watch(tabProvider) == 0
                      ?Color.fromARGB(255, 74, 221, 67)
                      : Colors.transparent,
                      border: Border.all(color:Color.fromARGB(255, 74, 221, 67) , width: 2.5 )
                    ),
                    child: Center(
                      child: Text('Character', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: ref.watch(tabProvider) == 0
                        ? Colors.white
                        : Color.fromARGB(255, 74, 221, 67),
                      ),),
                    ),
                  ),
                ),

                 GestureDetector(
                  onTap: () {
                    ref.read(tabProvider.notifier).state = 1;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    
                    height: ref.watch(tabProvider) == 1
                    ?8.5.h
                    :7.5.h,
                    width: 27.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:ref.watch(tabProvider) == 1
                      ?Color.fromARGB(255, 74, 221, 67)
                      : Colors.transparent,
                      border: Border.all(color:Color.fromARGB(255, 74, 221, 67) , width: 2.5 )
                    ),
                    child: Center(
                      child: Text('Episode', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: ref.watch(tabProvider) == 1
                        ? Colors.white
                        : Color.fromARGB(255, 74, 221, 67),
                      ),),
                    ),
                  ),
                ),

                 GestureDetector(
                  onTap: () {
                    ref.read(tabProvider.notifier).state = 2;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    
                    height: ref.watch(tabProvider) == 2
                    ?8.5.h
                    :7.5.h,
                    width: 27.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:ref.watch(tabProvider) == 2 
                      ?Color.fromARGB(255, 74, 221, 67)
                      : Colors.transparent,
                      border: Border.all(color:Color.fromARGB(255, 74, 221, 67) , width: 2.5  )
                    
                  

                    ),

                    child: Center(
                      child: Text('Location', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: ref.watch(tabProvider) == 2
                        ? Colors.white
                        : Color.fromARGB(255, 74, 221, 67),
                      ),),
                    ),
                  ),
                ),
               

                
               
                  
                  ],
                );
                },
              ),
            ),
            
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxH;

  @override
  // TODO: implement minExtent
  double get minExtent => minH;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }

}