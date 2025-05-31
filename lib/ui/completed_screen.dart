import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_new/widgets/costomed_detailed.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: ExpansionTile(
            
            title: Row(
              children: [
                Expanded(flex: 10, child: Text("Title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon:Icon(Icons.check, color: Colors.blue),

                    onPressed: () {},
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon:
                        (Random().nextBool())
                            ? Icon(Icons.favorite_rounded, color: Colors.blue)
                            : Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ),Expanded(flex: 2, child: IconButton(icon: Icon(Icons.edit),onPressed: () {},)),
                Expanded(
                flex: 2,
                child: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CostomedDetailed(),
                          ),
                    );
                  },
                  icon: Icon(Icons.info),
                ),
              ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete_outline_rounded,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            children: [
               Text("This is my content.I did not now how to manage it.But i am trying my Best for to do this.")
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 10,
    );
  }
}
