import 'package:flutter/material.dart';

class DataList extends StatelessWidget {
  
  DataList({super.key});

  //data yang akan ditampilkan dalam widget
  final List<String> data = ["Item 1", "Item 2", "Item 3","Item 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        title: const Text("Data Display Example"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]),
            onTap: (){
              //tindakan yang akan diambil saat item di klik
              debugPrint("Item ${index+1} clicked");
            },
          );
        }
      ),
    );
  }
}