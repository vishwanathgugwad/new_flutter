import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dunmmyList = List.generate(20, (index)=>CatalogModel.items[0]);
    int days = 10;
    return Scaffold(

      appBar: AppBar(
        title: Text("catalog app")

      ),
      drawer: MyDrawer(),
      body: ListView.builder(
          itemCount: dunmmyList.length,
        itemBuilder:  (context,index){
          return ItemWidget(item:  dunmmyList[index],);
        },


      ),

    );
  }
}
