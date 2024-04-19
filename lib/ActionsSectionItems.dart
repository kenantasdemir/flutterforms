import "package:flutter/material.dart";
import "package:flutterforms/AboutMe.dart";


class ActionsSectionItems extends StatefulWidget {
  const ActionsSectionItems({super.key});

  @override
  State<ActionsSectionItems> createState() => _ActionsSectionItemsState();
}

class _ActionsSectionItemsState extends State<ActionsSectionItems> {
  late String secilenPopup;
  List<String> actionItems = ["Hakkımda"] ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<String>(
        itemBuilder: (BuildContext context)
    {
      return actionItems.map((String item) {
        return PopupMenuItem<String>(
          value: item.toLowerCase(),
          child: Text(item),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutMe()));
          },

        );
      }).toList();
    }));}
  }

