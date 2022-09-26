import 'package:flutter/material.dart';

class MyListileEpisode extends StatefulWidget {
  final title, subtitle, id, page;
  const MyListileEpisode(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.id,
      required this.page
      })
      : super(key: key);

  @override
  State<MyListileEpisode> createState() => _MyListileEpisodeState();
}

class _MyListileEpisodeState extends State<MyListileEpisode> {
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
        backgroundColor: const Color.fromRGBO(67, 197, 60, 1),
        child: Text(widget.id, style: const TextStyle(color: Colors.white),),
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