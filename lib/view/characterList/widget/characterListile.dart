import 'package:flutter/material.dart';

class CharacterListile extends StatefulWidget {
  final title, subtitle,url,index,page;
  const CharacterListile(
      {Key? key,
      required this.url,
      required this.page,
      required this.index,
      required this.title,
      required this.subtitle,})
      : super(key: key);

  @override
  State<CharacterListile> createState() => _CharacterListileState();
}

class _CharacterListileState extends State<CharacterListile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      onTap: (){
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget.page),
  );
      },
      

      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        backgroundImage: NetworkImage(widget.url),
      ),
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.3),
      ),
      trailing: Text(widget.index),
      subtitle: Opacity(
        opacity: 0.7,
        child: Opacity(
          opacity: 0.7,
          child: Text(widget.subtitle, style: const TextStyle()),
        ),
      ),
    );
  }
}
