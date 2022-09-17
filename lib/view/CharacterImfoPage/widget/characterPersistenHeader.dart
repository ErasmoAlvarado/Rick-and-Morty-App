
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class characterPersistenHeader extends SliverPersistentHeaderDelegate{
  final String photo,name;
  characterPersistenHeader({Key? key, required this.photo, required this.name}) ;
 
  
  double maxH = 30.h;
  double minH = 7.5.h;



  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double percent = (shrinkOffset / maxH - 1).abs();
    double opacityAvatar = pow(percent, 5).toDouble();
    print(percent);
    return Material(
      elevation: percent >= 0.2 ?0 :3,
      child: Container(
     color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[200]
            : Colors.black,
    child:    Stack(
      alignment: Alignment.center,
      children: [
    
      Positioned(
        top: 5,
        left: 0,
        child: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back),
        iconSize: 4.h,
        )),
        
       Positioned(
       top: 0,
        child: Opacity(
          opacity: opacityAvatar,
          child: CircleAvatar(
            radius: 12.h,
            backgroundImage: NetworkImage(photo),
          ),
        )),
      
        Positioned(
          bottom: 12,
          child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize:  3.h ),))
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
    throw false;
  }

}