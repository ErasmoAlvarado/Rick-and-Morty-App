import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/apiProvider.dart';
import 'package:wikisanchez/view/CharacterImfoPage/CharacterImfoPage.dart';
import 'package:wikisanchez/view/characterList/widget/characterListile.dart';
import 'package:wikisanchez/view/widget/sliverShimmer.dart';

class EpisodeImfoPage extends ConsumerStatefulWidget {
  final name , airDate, episode , characters;
  const EpisodeImfoPage({
    Key? key,required this.airDate, required this.characters, required this.episode, required this.name
    }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EpisodeImfoPageState();
}

class _EpisodeImfoPageState extends ConsumerState<EpisodeImfoPage> {

  String getListData(){
      String result = '';

      for (var i = 0; i != widget.episode.length; i++) {
        String dt = widget.characters[i];
        dt = dt.substring(42);
        result ='$result$dt,';
      }
  
      return result;
    }

  @override
  Widget build(BuildContext context) {
   
    

    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            
             backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey[200]
          : Colors.black,
            centerTitle: true,
            title: Text(widget.name, style: TextStyle(fontSize: 3.5.h, fontWeight:FontWeight.bold,
            color:  Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white,
             ),),
            pinned: true,
          ),
          

          SliverToBoxAdapter(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Name',
                style: TextStyle(fontWeight: FontWeight.bold, ),
                ),
                trailing: Text(widget.name,
                 style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 74, 221, 67) ,),)
                ),
                ListTile(
                  title: const Text('Air Date',
                style: TextStyle(fontWeight: FontWeight.bold, ),
                ),
                trailing: Text(widget.airDate,
                 style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 74, 221, 67) ),)
                ),
                ListTile(
                  title: const Text('Episode',
                style: TextStyle(fontWeight: FontWeight.bold, ),
                ),
                trailing: Text(widget.episode,
                 style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 74, 221, 67) ),)
                ),
                 const Divider(),

                
                  ListTile(
                    title: Text('Character',
                style: TextStyle(fontWeight: FontWeight.bold , fontSize: 2.h ),
                ),
                  ),
              ],
            ),
          ),
FutureBuilder(
      future: ref.watch(apiProvider).getCharacterResult('https://rickandmortyapi.com/api/character/${getListData()}'),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
          return SliverList(
          delegate:SliverChildBuilderDelegate(
            (context, index) {
              return CharacterListile(
              url: snapshot.data[index].image, 
              index: snapshot.data[index].id.toString(), 
              title: snapshot.data[index].name,
               subtitle: snapshot.data[index].origin.name,
               page: CharacterImfoPage(
                image: snapshot.data[index].image,
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
            childCount: snapshot.data!.length
          ) 
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverShimmer();
        }

        else{
          return const SliverToBoxAdapter(
  child: Text('hola'),
);
   
        }

    }, )
         
        ],
      ),
    );
  }
}