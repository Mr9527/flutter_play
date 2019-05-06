import 'package:flutter/material.dart';



class SingleChildScrollViewImpl extends StatelessWidget{
   
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: str.split("").map((c)=>Text(c,textScaleFactor: 2.0,)).toList(),
          ),
        ),
      ),
    );
  }

}