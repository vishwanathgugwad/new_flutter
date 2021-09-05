import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
}
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/login_image.png",fit: BoxFit.cover,),
              SizedBox(
                height: 20.0,

              ),
              Text("welcome $name" ,
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              ),
                SizedBox(
                  height: 20.0,

                ),
                TextFormField(

                  decoration: InputDecoration(
                    hintText: " enter username",
                    labelText: "Username",

                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value){
                    name= value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: " enter password",
                    labelText: "Password",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length<6){
                      return "Password length should  be atleast 6";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 40.0,

                ),
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(changeButton?20: 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    width: changeButton? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: changeButton? BoxShape.circle:BoxShape.rectangle,


                    ),
                    duration: Duration(seconds: 1),
                    child: changeButton? Icon(Icons.done,color: Colors.white,) :Text(
                        "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                    ),


                  ),
                ),
              )

              ],

            ),
          ),
        ),
      ),

    );
  }
}
