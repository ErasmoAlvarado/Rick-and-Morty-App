import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/apiProvider.dart';
import 'package:wikisanchez/provider/urlEpisodeProvider.dart';
import 'package:wikisanchez/view/EpisodeImfoPage/EpisodeImfoPage.dart';
import 'package:wikisanchez/view/ListEpisode/widget/ListtileEpisode.dart';
import 'package:wikisanchez/view/widget/sliverShimmer.dart';

class ListEpisode extends ConsumerWidget {
  const ListEpisode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(apiProvider).getEpisodeList(
        ref.watch(urlEpisodeProvider)
      ),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
          return SliverList(
          delegate:SliverChildBuilderDelegate(
            (context, index) {
              return MyListileEpisode(title: snapshot.data[index].name,
               subtitle:snapshot.data[index].airDate,
                id: snapshot.data[index].id.toString(),
                page: EpisodeImfoPage(
                  airDate: snapshot.data[index].airDate,
                 characters: snapshot.data[index].characters,
                  episode: snapshot.data[index].episode,
                   name: snapshot.data[index].name
                   ),
                );
            },
            childCount: snapshot.data!.length
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

    }, );
  }
}