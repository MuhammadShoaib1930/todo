
import 'package:flutter/material.dart';

class CostomedDetailed extends StatefulWidget {
  const CostomedDetailed({super.key});

  @override
  State<CostomedDetailed> createState() => _CostomedDetailedState();
}

class _CostomedDetailedState extends State<CostomedDetailed> {
  final TextStyle styleTitle = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Text("Titile:",style:styleTitle ),
              Text("Content:",style: styleTitle,),
              Text("Faverate:",style: styleTitle,),
              Text("deleted:",style:styleTitle),
              Text("completed:",style:styleTitle),
              Text("Edited:",style:styleTitle),
              Text("Time:",style:styleTitle),
              Text("Date:",style:styleTitle),
              ],),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Text("Titile:",style:styleTitle ),
              Text("Content:",style: styleTitle,),
              Text("Faverate:",style: styleTitle,),
              Text("deleted:",style:styleTitle),
              Text("completed:",style:styleTitle),
              Text("Edited:",style:styleTitle),
              Text("Time:",style:styleTitle),
              Text("Date:",style:styleTitle),
              ],),
              
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child:
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          
        ),
      ],
    );
  }
}