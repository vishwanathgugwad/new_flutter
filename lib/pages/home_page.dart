import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 10;
    return Scaffold(

      appBar: AppBar(
        title: Text("catalog app")

      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text("Welcome to my $days th app "),
        ),
      ),

    );
  }
}
