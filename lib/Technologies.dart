

import 'package:flutter/material.dart';

class Technologies extends StatefulWidget{
  @override
  State<Technologies> createState() => _TechnologiesState();
}

bool checkBoxValue1 = false;
bool checkBoxValue2 = false;
bool checkBoxValue3 = false;
bool checkBoxValue4 = false;
bool checkBoxValue5 = false;
bool checkBoxValue6 = false;

class _TechnologiesState extends State<Technologies> {
  var selectedOption;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
             children: [
         SizedBox(
           height: 180,
           child: Card(
             child: ListTile(
               title: Text('İlgilendiğiniz web teknolojileri'),
               subtitle: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Checkbox(
                         value: checkBoxValue4,
                         onChanged: (bool? value) {
                            setState(() {
                              checkBoxValue4 = value!;
                            });
                         },
                       ),
                       Text('VueJS'),
                     ],
                   ),
                   Row(
                     children: [
                       Checkbox(
                         value: checkBoxValue5,
                         onChanged: (bool? value) {
                           setState(() {
                             checkBoxValue5 = value!;
                           });
                         },
                       ),
                       Text("Angular"),
                     ],
                   ),
                   Row(
                     children: [
                       Checkbox(
                         value: checkBoxValue6,
                         onChanged: (bool? value) {
                           setState(() {
                             checkBoxValue6 = value!;
                           });
                         },
                       ),
                       Text('ReactJS'),
                     ],
                   ),
                 ],
               ),

             ),
           ),

         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 180,
           child: Card(
             child: ListTile(
               title: Text('İlgilendiğiniz mobil teknolojileri'),
               subtitle: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Checkbox(
                         value: checkBoxValue1,
                         onChanged: (bool? value) {
                           setState(() {
                             checkBoxValue1 = value!;
                           });
                         },
                       ),
                       Text('Swift'),
                     ],
                   ),
                   Row(
                     children: [
                       Checkbox(
                         value: checkBoxValue2,

                         onChanged: (bool? value) {
                              setState(() {
                                checkBoxValue2 = value!;
                              });
                         },
                       ),
                       Text("Flutter"),
                     ],
                   ),
                   Row(
                     children: [
                       Checkbox(
                         value: checkBoxValue3,
                         onChanged: (bool? value) {
                              setState(() {
                                checkBoxValue3 = value!;
                              });
                         },
                       ),
                       Text('Kotlin'),
                     ],
                   ),
                 ],
               ),

             ),
           ),

         ),
             SizedBox(
         height: 20,
             ),

         SizedBox(
           height: 180,
           child: Card(
             child: ListTile(
               title: Text("Hangisinde daha iyisiniz?"),
               subtitle: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Radio(
                         value: "swift",
                         onChanged: (  value) {
                           setState(() {
                             selectedOption = value;
                           });
                         }, groupValue:  selectedOption,
                       ),
                       Text('Swift'),
                     ],
                   ),
                   Row(
                     children: [
                       Radio(
                         value: "flutter",
                         onChanged: ( value) {
                           setState(() {
                             selectedOption = value;
                           });
                         }, groupValue: selectedOption,
                       ),
                       Text("Flutter"),
                     ],
                   ),
                   Row(
                     children: [
                       Radio(
                         value: "kotlin",
                         onChanged: ( value) {
                           setState(() {
                             selectedOption = value;
                           });
                         }, groupValue: selectedOption,
                       ),
                       Text('Kotlin'),
                     ],
                   ),
                 ],
               ),

             ),
           ),

         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 200,
           child: TextField(
             textCapitalization: TextCapitalization.sentences,
             undoController: UndoHistoryController(),
             maxLines: 20,
             decoration: InputDecoration(
               hintText: "Profesyonel hayatınızdan bahsedin",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15.0),
                 borderSide: BorderSide(color: Colors.black87)
               )
             ),
           ),
         )
             ],
           ),
      ),
    );
  }
}