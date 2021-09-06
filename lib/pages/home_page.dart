import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';



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
      backgroundColor: MyTheme.creamColor,

      // appBar: AppBar(
      //   title: Text("catalog app")
      //
      // ),
      // drawer: MyDrawer(),


       body:SafeArea(
         child: Container(
           padding: Vx.m32,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              CatalogHeader(),
               if(CatalogModel.items!= null && CatalogModel.items.isNotEmpty)
                 CatalogList().expand()
               else
                 Center(child: CircularProgressIndicator())

             ],

           ),
         ),
       )

    );
  }
}



class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context,index){

      final catalog = CatalogModel.items[index];
      return CatalogItem(catalog:catalog);
    },
    itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : assert(catalog!=null) ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(child: Row(

      children: [
       CatalogImage(image: catalog.image),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 16),
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(onPressed: (){}, child: "Buy".text.make(),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())
                ),)
              ],
            ).pOnly(right: 8.0)

          ],
        ))

      ],
    )).white.roundedLg.square(150).make().py(16);
  }
}


class CatalogImage extends StatelessWidget {
    final String image;

  const CatalogImage({Key? key, required this.image}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Image.network(image).box.rounded.p8.color(MyTheme.creamColor).make( ).p(16).w40(context);
  }
}


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        "Catalog app".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
    "Trending Products".text.make(),

    ],
    );
  }
}




      // (CatalogModel!=null && CatalogModel.items.isNotEmpty)?
      // GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      //     mainAxisSpacing: 16,
      //     crossAxisSpacing: 16),
      //     itemBuilder: (context,index){
      //       final item = CatalogModel.items[index];
      //       return Card(
      //         clipBehavior: Clip.antiAlias,
      //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //
      //           child: GridTile(
      //             header: Container(
      //               padding: EdgeInsets.all(12),
      //                 decoration: BoxDecoration(
      //                   color: Colors.deepPurple
      //                 ),
      //                 child: Text(item.name,style: TextStyle(
      //                   color: Colors.white
      //                 ),)),
      //               footer: Container(
      //                   padding: EdgeInsets.all(12),
      //                   decoration: BoxDecoration(
      //                       color: Colors.black
      //                   ),
      //                   child: Text(item.price.toString(),style: TextStyle(
      //                       color: Colors.white
      //                   ),)),
      //               child: Image.network(item.image,))
      //
      //       );
      //     },
      //     itemCount: CatalogModel.items.length
      // )
      //     :Center(
      //   child: CircularProgressIndicator(),
      // ),


