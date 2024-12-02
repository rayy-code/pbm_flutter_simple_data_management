import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataApi extends StatefulWidget{
  const DataApi({super.key});


  @override
  //ignore: library_private_types_in_public_api
  _DataApiState createState()=> _DataApiState();
}

class _DataApiState extends State<DataApi>
{
  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    //lakukan permintaan GET ke API
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    //cek jika respons berhasil (status code 200)
    if (response.statusCode == 200) {
      //mengubah respons menjadi JSON (Dekode data JSON)
      final jsonData = jsonDecode(response.body);

      setState(() {
        //mengubah data list dengan data dari API
        dataList = jsonData;
      });

    }else{
      //jika respons gagal (status code 400) tampilkan pesan kesalahan
      debugPrint("Failed to load data: ${response.body}");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('API Data Example'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataList[index]['title']), //menampilkan judul dari setiap item
            subtitle: Text(dataList[index]['body']), //menampilkan isi dari setiap item
          );
        },
      ),
    );
  }
}