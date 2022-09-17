
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wikisanchez/domain/api_model.dart';
import 'package:wikisanchez/provider/apiProvider.dart';
import 'package:wikisanchez/view/CharacterImfoPage/widget/characterPersistenHeader.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/view/EpisodeImfoPage/EpisodeImfoPage.dart';
import 'package:wikisanchez/view/ListEpisode/widget/ListtileEpisode.dart';
import 'package:wikisanchez/view/widget/sliverShimmer.dart';

class CharacterImfoPage extends ConsumerStatefulWidget {
  final image,name,status, species, origin,location,episode,gender;
   CharacterImfoPage({Key? key, required this.image, required this.name,
   required this.episode, required this.location, required this.origin, required this.species,
   required this.status, required this.gender
   }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CharacterImfoPageState();
}

class _CharacterImfoPageState extends ConsumerState<CharacterImfoPage> {

  


 Widget genderIcon (){
if(widget.gender == Gender.MALE){
     return FaIcon(FontAwesomeIcons.male,color: Color.fromARGB(255, 74, 221, 67) );
    }
    if(widget.gender == Gender.FEMALE){
      return FaIcon(FontAwesomeIcons.female , color: Color.fromARGB(255, 74, 221, 67) ,);
    }
    else{
      return FaIcon(FontAwesomeIcons.question,color: Color.fromARGB(255, 74, 221, 67));
    }
    }

    String getListData(){
      String result = '';

      for (var i = 0; i != widget.episode.length; i++) {
        String dt = widget.episode[i];
        dt = dt.substring(40);
        result =result + '${dt},';
      }
  
      return result;
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader( pinned: true,delegate: characterPersistenHeader(photo: widget.image, name: widget.name)),
          SliverToBoxAdapter(
            child: Column(
             
             
              children: [
                
                ListTile(
                    title: Text('Species',
                  style: TextStyle(fontWeight: FontWeight.bold, ),
                  ),
                  trailing: Text(widget.species, style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 74, 221, 67) ),)
      
                  ),
      
                  ListTile(
                    title: Text('Gender',
                  style: TextStyle(fontWeight: FontWeight.bold, ),
                  ),
                  trailing: genderIcon(),
      
                  ),
      
                   ListTile(
                    title: Text('Origin',
                  style: TextStyle(fontWeight: FontWeight.bold, ),
                  ),
                  trailing: Text(widget.origin.name, style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 74, 221, 67) ),)
      
                  ),
                  
                  ListTile(
                    title: Text('Location',
                  style: TextStyle(fontWeight: FontWeight.bold, ),
                  ),
                  trailing: Text(widget.location.name, style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 74, 221, 67) ),)
      
                  ),
      
                  Divider(),
      
                  
                    ListTile(
                      title: Text('Episode',
                  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 2.h ),
                  ),
                    ),
      
                
              ],
            ),
          
          ),
          
          FutureBuilder(
        future: ref.watch(apiProvider).getEpisodeResult('https://rickandmortyapi.com/api/episode/${getListData()}'),
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
                 )
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
      
          }, )
      
         
          ],
        ),
      ),
    );
  }
}


