import 'package:flutter/material.dart';

class DataManipulation extends StatefulWidget{
  const DataManipulation({super.key});

  @override
  //ignore: library_private_types_in_public_api
  _DataManipulationState createState() => _DataManipulationState();
}

class _DataManipulationState extends State<DataManipulation>
{
  List<String> dataList = ["Item 1", "Item 2", "Item 3","Item 4"];

  //method untuk menambahkan item baru ke dalam daftar
  void addItem() {
    setState(() {
      dataList.add("New Item");
    });
  }

  //method untuk memperbarui item di dalam daftar
  void updateItem(int index) {
    setState(() {
      dataList[index] = "Updated Item";
    });
  }

  //method untuk menghapus item dari daftar
  void deleteItem(int index) {
    setState(() {
      dataList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contoh Data Manipulation"),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataList[index]),
            onTap: (){
              //memperbarui item yang di klik
              updateItem(index);
            },
            onLongPress: (){
              //menghapus item yang di tekan lama
              deleteItem(index);
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //menambahkan item baru
          addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}