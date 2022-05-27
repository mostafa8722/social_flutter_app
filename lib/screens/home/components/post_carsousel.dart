

import 'package:flutter/material.dart';

import '../../../models/post_model.dart';

class PostsCarsousel extends StatelessWidget{
  PageController pageController;
  String title;
  List<Post> posts;

  PostsCarsousel({
    required this.pageController,
    required this.title,
    required this.posts,
});
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 400.0,
      child: PageView.builder(
          controller: pageController,
          itemCount: posts.length,
          itemBuilder: (BuildContext context,int index)=>PageCard(context,index)),
    );
  }
  Widget PageCard(BuildContext context,int index){
    return
      AnimatedBuilder(
        animation:pageController ,

     builder: (BuildContext context,Widget? widget){
          double value = 1.0;
          if(pageController.position.haveDimensions){
            //value = pageController.page  - index ;
            value = (1-(value.abs()*0.25)).clamp(0.0,1.0);

          }
           return Center(
             child: SizedBox(
               height:Curves.easeInOut.transform(value) * 400.0 ,
               child: widget,

             ),
           );
      },


        child:Stack(
          children: [
            Container(
                height: 400.0,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0,2),
                          blurRadius: 6.0
                      )
                    ]

                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(posts[index].imageUrl,fit: BoxFit.cover,),
                )
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child:
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )
                  ),
                  child: Column(children: [
                    Text(posts[index].title),
                    Text(posts[index].location),
                  ],),
                )
            )
          ],
        ) ,);
  }

}

