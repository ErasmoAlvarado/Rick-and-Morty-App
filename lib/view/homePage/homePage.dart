import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wikisanchez/provider/apiProvider.dart';
import 'package:wikisanchez/provider/tabProvider.dart';
import 'package:wikisanchez/provider/urlChracterProvider.dart';
import 'package:wikisanchez/provider/urlEpisodeProvider.dart';
import 'package:wikisanchez/provider/urlLocationProvider.dart';
import 'package:wikisanchez/view/ListEpisode/ListEpisode.dart';
import 'package:wikisanchez/view/ListLocation/ListLocation.dart';
import 'package:wikisanchez/view/characterList/CharacterList.dart';
import 'package:wikisanchez/view/homePage/widget/HomePersintentHeader.dart';
import 'package:wikisanchez/view/widget/ErrorInternetPage.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Future switcImfo(){

      if(ref.watch(tabProvider) == 0){
       return ref.watch(apiProvider).getInfo(
           ref.watch(urlCharacterProvider)
          );
      }
      
      if(ref.watch(tabProvider) == 1){
       return ref.watch(apiProvider).getInfo(
          ref.watch(urlEpisodeProvider)
          );
      }
      
      else{
        return ref.watch(apiProvider).getInfo(
           ref.watch(urlLocationProvider)
          );
      }

    }

 

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
            slivers: [
              //appbar
              SliverPersistentHeader(pinned: true ,delegate: HomeHeader() ),
             
         
              StreamBuilder(
                stream: Connectivity().onConnectivityChanged,
                builder: (BuildContext context, AsyncSnapshot snapshotStream) {
                  
                  if (snapshotStream.data == ConnectivityResult.wifi ||
                      snapshotStream.data == ConnectivityResult.mobile) {
                   
                    if (ref.watch(tabProvider) == 0) {
                      return  ListCharacter();
                      
                    }
      
                     if (ref.watch(tabProvider) == 1) {
                      return ListEpisode();
                      
                    }
      
                     if (ref.watch(tabProvider) == 2) {
                      return ListLocation();
                    }
      
                    else{
                      throw 'fatal error';
                    }
                        
      
                  
                  } else {
                    return SliverToBoxAdapter(
                        child: ErrorInternetWidget() 
                        );
                  }
                },
              ),
      
              
            ],
          
          ),
      ),
        floatingActionButton: FutureBuilder(
          future: switcImfo(),
          builder: (context, snapshot) {
             return SpeedDial(
                backgroundColor: Color.fromARGB(255, 74, 221, 67),
                animatedIcon: AnimatedIcons.menu_close,
                children: [
                  SpeedDialChild(
                      backgroundColor: Colors.red,
                      child: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                      ),
                      onTap: () {
                       print(snapshot.data['prev']);
                      }),
                  SpeedDialChild(
                      backgroundColor: Colors.blue,
                      child: const FaIcon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.black,
                      ),
                      onTap: () {
                   if (ref.watch(tabProvider) == 0) {
                     ref.read(urlCharacterProvider.notifier).state = snapshot.data['next'];                  
                  }

                   if (ref.watch(tabProvider) == 1) {
                     ref.watch(urlEpisodeProvider.notifier).state = snapshot.data['next']; 
                     print(snapshot.data['next']); 
                    
                  }

                   if (ref.watch(tabProvider) == 2) {
                     ref.read(urlLocationProvider.notifier).state = snapshot.data['next']; 
                  }
                        
                        
                      }),
                ],
              );
          },
        ),
    );
  }
}