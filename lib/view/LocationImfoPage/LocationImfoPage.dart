import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/provider/apiProvider.dart';
import 'package:wikisanchez/view/CharacterImfoPage/CharacterImfoPage.dart';
import 'package:wikisanchez/view/characterList/widget/characterListile.dart';
import 'package:wikisanchez/view/widget/sliverShimmer.dart';

class LocationImfoPage extends ConsumerStatefulWidget {
  final name, type, dimension, residents;
  const LocationImfoPage({Key? key,
  required this.dimension,
  required this.name,
  required this.residents,
  required this.type
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationImfoPageState();
}

class _LocationImfoPageState extends ConsumerState<LocationImfoPage> {

  String getListData(){
      String result = '';

      for (var i = 0; i != widget.residents.length; i++) {
        String dt = widget.residents[i];
        dt = dt.substring(42);
        result ='$result$dt,';
      }
  
      return result;
    }

  @override
  Widget build(BuildContext context) {
    print(widget.residents.toString());
    return Scaffold(
      body: CustomScrollView(
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
                  title: const Text('Type',
                style: TextStyle(fontWeight: FontWeight.bold, ),
                ),
                trailing: Text(widget.type,
                 style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 74, 221, 67) ,),)
                ),

                ListTile(
                  title: const Text('Dimension',
                style: TextStyle(fontWeight: FontWeight.bold, ),
                ),
                trailing: Text(widget.dimension,
                 style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 74, 221, 67) ,),)
                ),
                  const Divider(),

                
                  ListTile(
                    title: Text('Character',
                style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20.sp ),
                ),
                  ),

                  

            
            ],
          ),
         ),
      widget.residents.toString() != '[]'
      ?FutureBuilder(
      future: ref.watch(apiProvider).getCharacterResult('https://rickandmortyapi.com/api/character/${getListData()}'),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
         
            int length = snapshot.data!.length;
            return SliverList(
          delegate:SliverChildBuilderDelegate(
              

            (context, index) {
             
                                

          print(length);
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
                  status: snapshot.data[index].status  ,
                  gender: snapshot.data[index].gender ,
               ),
               );
              
            },
            childCount: length
            
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
      :SliverToBoxAdapter(
        child: SizedBox(
          height: 53.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
        
              Positioned(top: 20, child: Image.asset('assets/pizzaMorty.png', height: 43.h,)),
              Positioned(bottom: 35, child: Text('Empty List', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.4, fontSize: 4.h),)),
              
            ],
          ),
        ),
      )
        ],
        
      ),
    );
  }
}