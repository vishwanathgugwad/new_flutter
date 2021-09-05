import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'dart:convert';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int days = 10;
  @override
  void initState(){
    super.initState();
    loadData();
  }

  void loadData()async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) =>Item.fromMap(item)).toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    /*final dunmmyList = List.generate(20, (index)=>CatalogModel.items[0]);*/

    return Scaffold(

      appBar: AppBar(
        title: Text("catalog app")

      ),
      drawer: MyDrawer(),
      body: (CatalogModel!=null && CatalogModel.items.isNotEmpty)? ListView.builder(
          itemCount:  CatalogModel.items.length,
        itemBuilder:  (context,index){
          return ItemWidget (item:   CatalogModel.items[index],);
        },


      ):Center(
        child: CircularProgressIndicator(),
      ),

    );
  }


}
