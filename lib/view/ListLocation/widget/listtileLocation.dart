import 'package:flutter/material.dart';

class MyListileLocation extends StatefulWidget {
  final title, subtitle,page;
  const MyListileLocation(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.page
      })
      : super(key: key);

  @override
  State<MyListileLocation> createState() => _MyListileLocationState();
}

class _MyListileLocationState extends State<MyListileLocation> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
     
     onTap: () {
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget.page),
  );
     },

      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        backgroundImage: const AssetImage('assets/wallpaper.jpeg'),
      ),
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.3),
      ),
      subtitle: Opacity(
        opacity: 0.7,
        child: Text(widget.subtitle, style: const TextStyle()),
      ),
    );
  }
}
