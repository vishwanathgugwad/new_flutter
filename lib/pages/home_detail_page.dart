import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) :assert(catalog!= null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mOnly(right: 16),
          children: [
            "\$${catalog.price}".text.red800.bold.xl4.make(),
            ElevatedButton(onPressed: (){}, child: "Buy".text.make(),style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder())
            ),
            ).wh(100, 50)
          ],
        ).p(32),
      ),
      body: SafeArea(
        child: Column(
          
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),

            ).h32(context),
            Expanded(child: VxArc(
             height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  ],
                ).py(64),
              ),
            ) ,)




          ],
        ),
        bottom: false,
      ),


    );
  }
}
