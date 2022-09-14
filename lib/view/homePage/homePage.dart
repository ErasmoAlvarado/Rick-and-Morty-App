import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: CustomScrollView(
          slivers: [
            //appbar
            SliverAppBar(
              title: const Text(
                'WikiSanchez',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.all(0),
                child: IconButton(
                    splashRadius: 25,
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.list)),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                      splashRadius: 25,
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.search)),
                )
              ],
            ),

            
          ],
        ),
    );
  }
}