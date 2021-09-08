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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mOnly(right: 16),
          children: [
            "\$${catalog.price}".text.red800.bold.xl4.make(),
            ElevatedButton(onPressed: (){}, child: "Add to cart".text.make(),style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder())
            ),
            ).wh(120, 50)
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
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(context.accentColor).bold.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),10.heightBox,
                    "When replacing a multi-lined selection of text, the generated dummy text maintains the amount of lines. When replacing a selection of text within a single line, the amount of words is roughly being maintained".text

                        .textStyle(context.captionStyle).make().p16(),

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
