import 'package:flutter/material.dart';
import 'package:social_flutter_app/screens/profile/profile_screen.dart';

import '../../data/data.dart';
import 'components/post_carsousel.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_HomeState();
}

class _HomeState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late TabController _controller;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _controller  = TabController(length: 2, vsync: this);
    _pageController  = PageController(initialPage: 0, viewportFraction: 0.7);
  }
  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(),
      body: customBody(),
      drawer: customDrawer(size),




    );
  }
  AppBar customAppBar(){
    return AppBar(
      iconTheme: IconThemeData(color: Colors.green),
      backgroundColor: Colors.white,
      title: Text("Social Media",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.deepPurple,fontFamily: "Signatra",letterSpacing: 10),),
      centerTitle: true,
      elevation: 0.0,
      bottom: TabBar(
        controller: _controller,
        labelColor: Colors.deepPurple,
        labelStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 18.0
        ),
        tabs: [
         Tab(text: "Trending",),
         Tab(text: "Latest",),

        ],
      ) ,
    );
  }
  Widget customBody(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Text("Following",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context,int index) =>CardUser(context,index),
            ),
          ),
          PostsCarsousel(
    title: "Posts",
    posts: posts,
    pageController: _pageController,
    )
        ],
      ),
    );
  }
  Widget CardUser(BuildContext context,int index){
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.only(left:10),
       decoration: BoxDecoration(

       ),
      child: CircleAvatar(
        radius: 16.0,
        child: ClipRRect(
          child: Image.asset(users[index].profileImageUrl,fit: BoxFit.cover,height: 70,width: 70,),

          borderRadius: BorderRadius.circular(50.0),
        ),
      )



    );
  }
  Widget customDrawer(Size size){
    return
     Drawer(

       child:  Container(

         child: Column(
           children: [
             Container(
               height: 200,

               child: Stack(
                 children: [
                   Image.asset(currentUser.backgroundImageUrl,height: 200,width: size.width,fit: BoxFit.cover,),
                   Positioned(
                       bottom: 20,
                       left: 20,
                       child:
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           ClipOval(
                               child:   Image.asset(currentUser.profileImageUrl,height: 80,width: 80,
                                 fit: BoxFit.cover,
                               )),
                           Align(
                             alignment: Alignment.bottomCenter,
                             child:Text(currentUser.name,style:
                             TextStyle(color: Colors.white,
                                 letterSpacing: 2,
                                 fontSize: 15,fontWeight: FontWeight.w600),)
                             ,
                           )
                         ],)
                   ),
                 ],
               ),
             ),
             SizedBox(height: 10,),
             _buildMenu(Icon(Icons.home), "Home",(){print("ok");}),
             SizedBox(height: 1,),
             _buildMenu(Icon(Icons.post_add), "Posts",(){print("ok");}),
             SizedBox(height: 1,),
             _buildMenu(Icon(Icons.settings), "Settings",(){print("ok");}),
             SizedBox(height: 1,),

             _buildMenu(Icon(Icons.contact_mail), "Contact",(){print("ok");}),
             SizedBox(height: 1,),
             _buildMenu(Icon(Icons.info), "About",(){print("ok");}),
             SizedBox(height: 1,),
             _buildMenu(Icon(Icons.face), "Faqs",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
             }),
             SizedBox(height: 1,),



           ],
         ),
       ),
     );
  }
  Widget _buildMenu(Icon icon,String title,onTap){
    return ListTile(
      title: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
      leading: icon,
      onTap: onTap,

    );
  }

}