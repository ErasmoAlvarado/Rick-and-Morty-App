import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wikisanchez/provider/tabProvider.dart';
import 'package:wikisanchez/view/homePage/widget/HomePersintentHeader.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            //appbar
            SliverPersistentHeader(pinned: true ,delegate: HomeHeader() ),
           
           SliverToBoxAdapter(
            child: Text(ref.watch(tabProvider).toString()),
           ),

            StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (BuildContext context, AsyncSnapshot snapshotStream) {
                
                if (snapshotStream.data == ConnectivityResult.wifi ||
                    snapshotStream.data == ConnectivityResult.mobile) {
                 
                  return  SliverList( delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Text('hola');
                    },
                    childCount: 100
                  ));
                      

                
                } else {
                  return SliverToBoxAdapter(
                      child: Text('chao'));
                }
              },
            ),

            
          ],
        )
    );
  }
}