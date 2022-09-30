import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  final text;
  final imagen;
  Pages({required this.text, required this.imagen});
  @override
  Widget build(BuildContext context) {
   return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text(text,textAlign: TextAlign.center,style: TextStyle(
            fontSize: 30,fontWeight:FontWeight.bold),),
          Image.network(imagen)   
        ]
      ),
    );
  }
}