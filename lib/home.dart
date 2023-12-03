import 'package:flutter/material.dart';
import 'package:website_one/globals/styles.dart';
import 'package:website_one/globals/widgets.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}


class _homePageState extends State<homePage> {
   final _style = GlobalStyles();
   final _widgets = GlobalWidgets();
   int? focusedIndex;
   bool isHovered = false;
   void refresh(bool ifff){
     print("ifff is ${ifff.toString()}");
     setState(() {
       isHovered = ifff;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  //Page Content
                  SizedBox(width: 9),
                  leftSlid(),
                  SizedBox(width: 9),

                  body(),
                  SizedBox(width: 10),
                  rightSlid(),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Container(height: 80),
          ],
        ),
      ),
    );
  }
  Widget leftSlid(){
     return Expanded(
       child: Column(
         children: [
           Container(
             width: double.infinity,
             decoration: _style.boxStyle(),
             padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
             child: Column(
               children: [
                 _widgets.IconTitleText(context, "Home", Icons.home_filled,selected: true),
                 _widgets.IconTitleText(context, "Search", Icons.search),
               ],
             ),
           ),
           SizedBox(height: 10),
           Expanded(
             child: Container(
               decoration: _style.boxStyle(),
               padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
               child: Column(
                 children: [
                   Row(
                     children: [
                       _widgets.IconTitleText(context, "Your Library", Icons.library_music),
                       Spacer(),
                       IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.grey[500],)),
                       IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.grey[500],)),
                     ],
                   ),
                   SizedBox(height: 10),
                   Row(
                     children: [
                       _widgets.tap(context, "Playlist"),
                       _widgets.tap(context, "Podcasts & Shows"),
                     ],
                   ),
                   SizedBox(height: 15),
                   //
                   ListView(
                     shrinkWrap: true,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.search,color: Colors.grey[500],),
                           Spacer(),
                           Text("Recents",style: TextStyle(color: Colors.grey[500],fontSize: 14,fontWeight: FontWeight.w500),),
                           SizedBox(width: 5),
                           Icon(Icons.list,color: Colors.grey[500])
                         ],
                       ),
                       Material(
                         type: MaterialType.transparency,
                         child: ListTile(
                           hoverColor: Colors.grey[800],
                           focusColor: Colors.red,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(4),

                           ),
                           onTap: () {
                             print("tapped");
                           },
                           contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                           leading: ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network("https://i.scdn.co/image/ab67616d0000b273a426bc05c4c7531da2ea0ee5")),
                           title: Text("Liked Songs",),
                           subtitle: Text("Playlist Achraf"),
                         ),
                       )
                     ],
                   )
                 ],
               ),
             ),
           ),
         ],
       ),
     );
  }

  Widget body(){
     return Container(
       width: MediaQuery.of(context).size.width * 0.55,
       decoration: _style.boxStyle(),
       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
       child: ListView(
         children: [
           //Head
           Row(
             children: [
               Text("Good Morning",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                   color: Colors.white,
                   fontWeight: FontWeight.w700,
                   fontSize: 26
               )),
             ],
           ),
           SizedBox(height: 20),

           GridView.builder(

             shrinkWrap: true,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: 7,
                 crossAxisSpacing: 10,
                 mainAxisSpacing: 10
             ),
             itemCount: 3,
             itemBuilder: (context, index) {
               return InkWell(
                 onHover: (value) {
                   setState(() {
                     if(!value) {
                       focusedIndex = null;
                       print("cleared index");
                     } else
                       focusedIndex = index;
                   });
                 },
                 // hoverColor: Colors.red[800],
                 // focusColor: Colors.red,
                 onTap: () {
                   setState(() {
                     focusedIndex = index;
                     print("Updated State");
                   });
                 },
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(4),
                   child: AnimatedContainer(
                     duration: Duration(milliseconds: 350),
                     // height: 10,
                     // constraints: BoxConstraints.tight(Size(50, 20)),
                     decoration: BoxDecoration(
                         color: !(focusedIndex == index) ? Color(0xff535353) : Color(0xffb3b3b3),
                         borderRadius:BorderRadius.circular(4)
                     ),
                     child: Row(
                       children: [
                         Image.network('https://images.unsplash.com/photo-1495615080073-6b89c9839ce0?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3F1YXJlfGVufDB8fDB8fHww'),
                         SizedBox(width: 10),
                         Text(
                           "Liked Songs",
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 14,
                               fontWeight: FontWeight.w700
                           ),
                         ),
                         Spacer(),
                         if(focusedIndex == index)
                           Container(
                             width: 35,
                             height: 35,
                             decoration: BoxDecoration(
                                 color: Color(0xff1db954),
                                 borderRadius: BorderRadius.circular(100),
                                 boxShadow: [
                                   BoxShadow(
                                       color: Colors.black.withOpacity(0.2),
                                       spreadRadius: 0.8,
                                       blurRadius: 5,
                                       offset: Offset(3, 2)
                                   )
                                 ]
                             ),
                             child: Icon(Icons.play_arrow,color: Colors.black),
                           ),
                         SizedBox(width: 15),
                       ],
                     ),
                   ),
                 ),
               );
             },
           ),
           SizedBox(height: 20),
           //Sliding elements

           ///Horizontal list
           //Title
           _widgets.MenuHListTitle(context,"Made for User","Show all",isHovered,refresh),
           SizedBox(height: 20),

           //Content List
           Container(
             height: 280,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemCount: 5,
               separatorBuilder: (context, index) {
                 return SizedBox(width: 20);
               },
               itemBuilder: (context, index) {
                 return _widgets.MenuHListBody(context,"URL","Title","Image Description");
               },
             ),
           ),

         ],
       ),
     );
  }

  Widget rightSlid(){
     return Expanded(
       child: Column(
         children: [
           Expanded(
             child: Container(
                 decoration: _style.boxStyle()
             ),
           )
         ],
       ),
     );
  }
}
