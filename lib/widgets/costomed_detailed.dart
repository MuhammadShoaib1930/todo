
import 'package:flutter/material.dart';
import 'package:todo/app_constant/app_settings.dart';
import 'package:todo/models/todo_model.dart';

class CostomedDetailed extends StatefulWidget {
  final TodoModel item;
  const CostomedDetailed({super.key,required this.item});

  @override
  State<CostomedDetailed> createState() => _CostomedDetailedState();
}

class _CostomedDetailedState extends State<CostomedDetailed> {

  final TextStyle styleTitle = TextStyle(fontSize: AppSettings.titleFont,fontWeight: AppSettings.titlesBold);
  final TextStyle styleContent = TextStyle(fontSize: AppSettings.contentFont,fontWeight: AppSettings.contentBold);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 350,
      height: 750,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsetsDirectional.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                    Text("Title: ",style: styleTitle,),
                    Flexible(child: Text(widget.item.title,style:styleContent,)),
                  ],),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Content: ",style: styleTitle,),
                    Flexible(child: Text(widget.item.content,style: styleContent,))
                  ],),
                  
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              
                    Text("Faverate: ",style: styleTitle,),
                    Text((widget.item.favorite)? ' Yes ':' No ',style: styleContent,)
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text("Deleted: ",style: styleTitle,),
                    Text((widget.item.deleted)? ' Yes ':' No ',style: styleContent,)
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text("Completed: ",style: styleTitle,),
                    Text((widget.item.completed)? ' Yes ':' No ',style: styleContent,)
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text("Edited: ",style: styleTitle,),
                    Text(" Changed: ${widget.item.edited}",style: styleContent,)
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text("Time: ",style: styleTitle,),
                    Text(widget.item.time,style: styleContent,)
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text("Date: ",style: styleTitle,),
                    Text(widget.item.date,style: styleContent,)
                  ],),
                ],
              ),
            )
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
      ),
    );
  }
}