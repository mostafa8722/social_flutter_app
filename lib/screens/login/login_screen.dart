import 'package:flutter/material.dart';
import 'package:social_flutter_app/screens/home/home_screen.dart';

import 'components/custom_clipper.dart';
class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child:
        Container(
          height: size.height,
          child:   Column(
            children: [
              Container(
                height: 200,
                width: size.width ,
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Image.asset("assets/images/mountains.jpg",fit:BoxFit.cover,),
                )
              ),
              SizedBox(height: 10,),
              Text("Login Page",style: TextStyle(fontSize: 25),),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_box_rounded),
                      hintText: "username ..."

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_box_rounded),
                    hintText: "password ...",


                  ),
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                child:  Container(

                  height: 40,
                  width: 150,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurpleAccent,
                  ),
                  child: Center(child: Text("Login",style: TextStyle(color: Colors.white),),),

                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                  child:Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height:50 ,
                      color: Colors.deepPurpleAccent,
                      child:

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",style: TextStyle(color: Colors.white),),
                          InkWell(
                            onTap: (){},
                            child:  Text("Sign up",style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  )
              )

            ],
          ),
        )
      ),
    );
  }
}
