import 'package:flutter/material.dart';
import 'package:social_flutter_app/screens/login/components/custom_clipper.dart';
import 'package:social_flutter_app/screens/profile/profile_custom_clipper.dart';

import '../../data/data.dart';
import '../home/components/post_carsousel.dart';

class ProfileScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>ProfileState();
}

class ProfileState extends State<ProfileScreen>{

  late PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController  = PageController(initialPage: 0, viewportFraction: 0.7);
  }
  @override
  Widget build(BuildContext context) {
Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              child:Stack(
                children: [
                  Container(
                    child:

                    ClipPath(
                      clipper: ProfileCustomClipper(),
                      child: Image.asset(currentUser.backgroundImageUrl,fit: BoxFit.cover,width: size.width,),
                    )
                  ),
                  Positioned(
                      top: 30,
                      left: 30,
                      child:IconButton(icon: Icon(Icons.menu,color: Colors.white,),onPressed: (){},)
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child:
                      ClipOval(
                        child:Image.asset(currentUser.profileImageUrl,height:70,width: 70,fit: BoxFit.cover,),
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Text("Following",style: TextStyle(color: Colors.black38,fontSize: 17),),
                  Text(currentUser.following.toString(),style: TextStyle(color: Colors.black54,fontSize: 15),),
                ],),

                Column(children: [
                  Text("Followers",style: TextStyle(color: Colors.black38,fontSize: 17),),
                  Text(currentUser.followers.toString(),style: TextStyle(color: Colors.black54,fontSize: 15),),
                ],),
              ],
            ),
            PostsCarsousel(
              title: "Posts",
              posts: posts,
              pageController: _pageController,
            )
          ],
        ),
      ),
    );
  }
}