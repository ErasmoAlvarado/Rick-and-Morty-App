import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/apiProvider.dart';
import 'package:wikisanchez/provider/urlLocationProvider.dart';
import 'package:wikisanchez/view/ListLocation/widget/listtileLocation.dart';
import 'package:wikisanchez/view/LocationImfoPage/LocationImfoPage.dart';
import 'package:wikisanchez/view/widget/sliverShimmer.dart';

class ListLocation extends ConsumerWidget {
  const ListLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(apiProvider).getLocationList(
      ref.watch(urlLocationProvider)
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if(snapshot.connectionState == ConnectionState.done){
          return SliverList(
          delegate:SliverChildBuilderDelegate(
            (context, index) {
              return MyListileLocation(
                title: snapshot.data[index].name,
               subtitle: snapshot.data[index].dimension,
               page: LocationImfoPage(
                dimension: snapshot.data[index].dimension,
                name: snapshot.data[index].name,
                 residents: snapshot.data[index].residents,
                  type:snapshot.data[index].type
                  ),
               );
            },
            childCount: snapshot.data.length
          ) 
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverShimmer();
        }

        else{
          return SliverToBoxAdapter(
  child: Text('hola'),
);
   
        }

  

      },
    );
  }
}