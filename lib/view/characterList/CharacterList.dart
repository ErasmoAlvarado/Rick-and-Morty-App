import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/apiProvider.dart';
import 'package:wikisanchez/provider/urlChracterProvider.dart';
import 'package:wikisanchez/provider/urlLocationProvider.dart';
import 'package:wikisanchez/view/CharacterImfoPage/CharacterImfoPage.dart';
import 'package:wikisanchez/view/ListLocation/widget/listtileLocation.dart';
import 'package:wikisanchez/view/characterList/widget/characterListile.dart';
import 'package:wikisanchez/view/widget/ErrorInternetPage.dart';
import 'package:wikisanchez/view/widget/sliverShimmer.dart';

class ListCharacter extends ConsumerWidget {
  const ListCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(apiProvider).getCharacterList(
      ref.watch(urlCharacterProvider)
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if(snapshot.connectionState == ConnectionState.done){
          return SliverList(
          delegate:SliverChildBuilderDelegate(
            (context, index) {
              return CharacterListile(
                url: snapshot.data[index].image,
               title: snapshot.data[index].name, 
              subtitle: snapshot.data[index].origin.name,
               index: snapshot.data[index].id.toString(),
               page: CharacterImfoPage(image: snapshot.data[index].image,
                  name: snapshot.data[index].name,
                  episode: snapshot.data[index].episode, 
                  location: snapshot.data[index].location,
                  origin: snapshot.data[index].origin, 
                  species: snapshot.data[index].species,
                  status: snapshot.data[index].status,
                  gender: snapshot.data[index].gender
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

        if(snapshot.connectionState == ConnectionState.none){
          return SliverToBoxAdapter(child: ErrorInternetWidget());
        }

        else{
          return SliverToBoxAdapter(
  child: Text('como estast'),
);
   
        }

  

      },
    );
  }
}