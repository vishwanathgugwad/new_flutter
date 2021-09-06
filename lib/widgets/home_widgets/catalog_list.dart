import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context,index){

        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog)));
          },
            child: CatalogItem(catalog:catalog));
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
        Hero(
            tag: Key(catalog.id.toString()),

            child:
            CatalogImage(image: catalog.image
            ),
        ),
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

