
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/apiProvider.dart';

import 'package:wikisanchez/provider/searchOptionProvider.dart';
import 'package:wikisanchez/provider/urlSearchProvider.dart';
import 'package:wikisanchez/view/CharacterImfoPage/CharacterImfoPage.dart';
import 'package:wikisanchez/view/EpisodeImfoPage/EpisodeImfoPage.dart';
import 'package:wikisanchez/view/ListEpisode/widget/ListtileEpisode.dart';
import 'package:wikisanchez/view/ListLocation/widget/listtileLocation.dart';
import 'package:wikisanchez/view/LocationImfoPage/LocationImfoPage.dart';
import 'package:wikisanchez/view/characterList/widget/characterListile.dart';
import 'package:wikisanchez/view/widget/ErrorInternetPage.dart';

class searchBar extends SearchDelegate{

   Future switchOption(WidgetRef ref){
    if(ref.watch(SearchOptionProvider) == 'character'){
      return ref.watch(apiProvider).getCharacterList(
      ref.watch(urlSearchProvider(query))
    );
    }

    if(ref.watch(SearchOptionProvider) == 'location'){
      return ref.watch(apiProvider).getLocationList(
      ref.watch(urlSearchProvider(query))
    );
    }

  else{
      return ref.watch(apiProvider).getEpisodeList(
      ref.watch(urlSearchProvider(query))
    );
    }
   }

   Icon switchIcon(WidgetRef ref){
    if(ref.watch(SearchOptionProvider) == 'character'){
      return Icon(Icons.person_rounded, color: Color.fromARGB(255, 74, 221, 67));
    }
     if(ref.watch(SearchOptionProvider) == 'location'){
      return Icon(Icons.location_city_rounded, color: Color.fromARGB(255, 74, 221, 67));
    }
    else{
      return Icon(Icons.tv_rounded, color: Color.fromARGB(255, 74, 221, 67));
    }
    
   }

  
  @override
  
  List<Widget>? buildActions(BuildContext context) {
    List<IconData> iconOption = [
     Icons.person_rounded,
     Icons.location_city_rounded,
     Icons.tv_rounded,
    ];

   
   
   
    return [
      
      SizedBox(width: 2.h,),
     Consumer(
      builder: (context, ref, child) {
        return Consumer(
          builder: (context, ref, child) {
           
  

            return FutureBuilder(
              future: ref.watch(apiProvider).getInfo(
                ref.watch(urlSearchProvider(query)),
              ),
              builder: (context, snapshot) {
                return Row(
                  children: [
                   
                   IconButton(onPressed: () {
                   ref.watch(urlSearchProvider(query).notifier).state = snapshot.data['prev'];
                   }, icon: Icon(FontAwesomeIcons.arrowLeft)),
            
                   IconButton(onPressed: () {
                      
                      ref.watch(urlSearchProvider(query).notifier).state = snapshot.data['next'];
                      
                    
                   }, icon: Icon(FontAwesomeIcons.arrowRight)),
            
            
                    IconButton(onPressed: () {
                   showModalBottomSheet(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )),
                    context: context,
                    builder:(context) {
                     return Column(
            
                      mainAxisSize: MainAxisSize.min,
                      children: [
                    SizedBox(height: 2.h,),
                    ListTile(
                       shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onTap: () {
                   ref.read(SearchOptionProvider.notifier).state = 'character' ;
                   print(ref.watch(urlSearchProvider(query)));
                  },
                      title: Text('Characters'),
                      leading: Icon(iconOption[0], color:  Color.fromARGB(255, 74, 221, 67),),
                    ),
            
                     ListTile(
                      onTap: () {
                        ref.read(SearchOptionProvider.notifier).state = 'location' ;
                         print(ref.watch(urlSearchProvider(query)));
                      },
                       shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                      title: Text('Locations'),
                      leading: Icon(iconOption[1], color:  Color.fromARGB(255, 74, 221, 67),),
                    ),
            
                     ListTile(
                       shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                   onTap: () {
                   ref.read(SearchOptionProvider.notifier).state = 'episode' ;
                   print(ref.watch(urlSearchProvider(query)));
                    },
                      title: Text('Episodes'),
                      leading: Icon(iconOption[2], color:  Color.fromARGB(255, 74, 221, 67),),
                    ),
                    
                    SizedBox(height: 2.h,)
                      ],
                     );
                    },
                   );
                 }, icon: switchIcon(ref) ),
                  ],
                );
              }
            );
          },
        );
      },
     ),
            
   
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
  return IconButton(onPressed: (){
    Navigator.of(context).pop();
  }, icon: Icon(Icons.arrow_back));
  }
  
  @override
  Widget buildResults(BuildContext context) {
   
    

    return Consumer(
      builder: (context, ref, child) {
        return FutureBuilder(
         future: switchOption(ref),
         

         builder: (context, snapshot) {
          //connection snaps===
           if(snapshot.connectionState == ConnectionState.done){
             if(snapshot.data ==  null){
              return Container(
          height: 70.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
        
              Positioned(top: 110, child: Image.asset('assets/pizzaMorty.png', height: 45.h,)),
              Positioned(bottom: 55, child: Text('Empty List', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.4, fontSize: 4.h),)),
              
            ],
          ),
        );
             }

           else{
             return ListView.builder(
              itemCount: snapshot.data.length,
           itemBuilder: (context, index) {

             if(ref.watch(SearchOptionProvider) == 'character'){
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
             }
             if(ref.watch(SearchOptionProvider) == 'location'){
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
             }
            
            else{
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
            }

           },);
           }
           
        
           
           }
        

           if(snapshot.connectionState == ConnectionState.waiting){
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
              return ListTile(
                        
                       

                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[350],
                        ),
                        title: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[350],
                          ),
                        ),
                        subtitle: Container(
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[350],
                          ),
                        ),
                        
                      );
            },);
           }

           else{
            return ErrorInternetWidget();
           }


      }
    );
      },
    );
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Consumer(
      builder: (context, ref, child) {
        return FutureBuilder(
         future: switchOption(ref),
         

         builder: (context, snapshot) {
          //connection snaps===
           if(snapshot.connectionState == ConnectionState.done){
             if(snapshot.data ==  null){
              return Container(
          height: 70.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
        
              Positioned(top: 110, child: Image.asset('assets/pizzaMorty.png', height: 45.h,)),
              Positioned(bottom: 55, child: Text('Empty List', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.4, fontSize: 4.h),)),
              
            ],
          ),
        );
             }

           else{
             return ListView.builder(
              itemCount: snapshot.data.length,
           itemBuilder: (context, index) {

             if(ref.watch(SearchOptionProvider) == 'character'){
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
             }
             if(ref.watch(SearchOptionProvider) == 'location'){
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
             }
            
            else{
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
            }

           },);
           }
           
        
           
           }
        

           if(snapshot.connectionState == ConnectionState.waiting){
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
              return ListTile(
                        
                       

                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[350],
                        ),
                        title: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[350],
                          ),
                        ),
                        subtitle: Container(
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[350],
                          ),
                        ),
                        
                      );
            },);
           }

           else{
            return ErrorInternetWidget();
           }


      }
    );
      },
    );
  }

 
      
          


    }