
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/tabProvider.dart';
import 'package:wikisanchez/view/homePage/widget/SearchBarDelagate.dart';

class HomeHeader extends SliverPersistentHeaderDelegate{
  
  double maxH = 16.h;
  double minH = 8.h;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    double percent = (shrinkOffset / maxH -1).abs();
    double appbarOpacity = pow(percent, 12).toDouble();
    print(percent);
    return Material(
      elevation: percent >= 0.2 ?0 :3,
      child: Container(
      
      color: Theme.of(context).brightness == Brightness.light
            ? Color.fromARGB(255, 245, 245, 245)
            : Colors.black,
      
      
        child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Opacity(
                  opacity: appbarOpacity,
                  child: Container(
                     width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () {
                            print('something is good');
                          }, icon: Icon(Icons.videogame_asset_rounded, size: 4.h)),
                          Text('WikiSanchez', style: TextStyle(fontSize: 3.5.h, fontWeight: FontWeight.bold)),
                           IconButton(onPressed: () {
                             showSearch(context: context, delegate: searchBar());
                           }, icon: Icon(Icons.search_rounded, size: 4.h,))
                        ],
                      ),
                    ),
                  ),
                )),
              Positioned(
                bottom: 7,
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
                        ?6.5.h
                        :5.5.h,
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
                            fontSize: 2.h,
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
                        ?6.5.h
                        :5.5.h,
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
                            fontSize: 2.h,
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
                        ?6.5.h
                        :5.5.h,
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
                            fontSize: 2.h,
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