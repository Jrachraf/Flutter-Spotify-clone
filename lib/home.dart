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
   int? focuseddBox;
   bool isHovered = false;
   void refresh(bool ifff){
     print("ifff is ${ifff.toString()}");
     setState(() {
       isHovered = ifff;
     });
   }
   String? size;
  @override
  Widget build(BuildContext context) {
     print(MediaQuery.of(context).size.width);
     double width = MediaQuery.of(context).size.width;

     if(width > 1010)
       size = "big";
     else
       size = "small";
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
                  if(width > 1010)
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
                       leftTile(),
                       leftTile(),
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
                 childAspectRatio: MediaQuery.of(context).size.width < 1150 ? 5 : 7,
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
                 return InkWell(
                   onTap: (){},
                   onHover: (value){
                     print(value);
                     setState(() {
                       if(value)
                        focuseddBox = index;
                       else
                         focuseddBox = null;
                     });
                   },
                     child: MenuHListBody(context,"URL","Title","Image Description",focuseddBox == index)
                 );
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
                 decoration: _style.boxStyle(),
               padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
               child: ListView(
                 children: [
                   //title

                   Row(
                     children: [
                       Text("Liked Songs",style: TextStyle(
                         color: Colors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.w500
                       ),),
                       Spacer(),
                       IconButton(
                         selectedIcon: Icon(Icons.close,color: Colors.grey[300],),
                           tooltip: "Close",
                           onPressed: (){

                           },
                           icon: Icon(Icons.close,color: Colors.grey[500],),

                          color: Colors.transparent,
                       )
                     ],
                   ),
                   SizedBox(height: 20),

                   //Album Cover
                   ClipRRect(
                     borderRadius: BorderRadius.circular(8),
                     child: Image.network(
                       "https://i.redd.it/svk8zd3km9o71.jpg",
                       width: double.infinity,
                       fit: BoxFit.fitWidth,
                     ),
                   ),
                   SizedBox(height: 15),

                   //Track info
                   Row(
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "Blinding Lights",
                             style: TextStyle(
                               fontSize: 24,
                               color: Colors.white,
                               fontWeight: FontWeight.w600
                             ),
                           ),
                           SizedBox(height: 2),
                           Text(
                             "The Weeknd",
                             style: TextStyle(
                                 fontSize: 16,
                                 color: Colors.grey[400],
                                 fontWeight: FontWeight.w300
                             ),
                           ),
                         ],
                       )
                     ],
                   )
                 ],
               ),
             ),
           )
         ],
       ),
     );
  }

  Widget leftTile(){
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        hoverColor: Colors.grey[800],
        textColor: Colors.white,

        focusColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),

        ),
        onTap: () {
          print("tapped");
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
        leading: ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network("https://i.scdn.co/image/ab67616d0000b273a426bc05c4c7531da2ea0ee5")),
        title: Text("Liked Songs",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 15),),
        subtitle: Text("Playlist Achraf",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 13,color: Colors.grey[300]),),
      ),
    );
  }

   Widget MenuHListBody(context,String ImageUrl,String Title,String Desc,bool hover){
     double size  = 0;
     return Material(
       type: MaterialType.transparency,
       child: Container(
         width: 180,
         height: 270,
         decoration: GlobalStyles().boxStyle(color: hover ? Color(0xff535353)  : Color(0xff181818)),
         padding: EdgeInsets.all(16),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(8),
               child: AnimatedContainer(
                 duration: Duration(milliseconds: 150),
                 width: 160,
                 height: 160 ,
                 child: Stack(
                   children: [

                     Image.network(
                       "https://png.pngtree.com/background/20210715/original/pngtree-electronic-music-album-picture-image_1301130.jpg",
                       fit: BoxFit.fill,
                       width: 150,
                       height: double.infinity,
                     ),
                     // if(hover)
                     AnimatedOpacity(
                       duration: Duration(milliseconds: 150),
                       opacity: hover ? 1 : 0,
                       child: AnimatedAlign(
                         duration: Duration(milliseconds: 150),
                         curve: Curves.easeInOut,
                         alignment: Alignment(0.8, hover ? 0.85 : 1),
                         child: Material(
                           type: MaterialType.transparency,
                           child: InkWell(
                               onTap: (){
                                 setState(() {
                                   size = 5;
                                 });
                               },
                               onHover: (value) {
                                 setState(() {
                                   if(value)
                                     size = 10;
                                   else
                                     size = 0;
                                 });
                               },
                             child: Material(
                               type: MaterialType.transparency,
                               child: AnimatedContainer(
                                 duration: Duration(milliseconds: 150),
                                 width: 45 + size,
                                 height: 45 + size,
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
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
             SizedBox(height: 16),
             Text("Today's picks",style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.w700,
                 letterSpacing: 1,
                 fontSize: 14
             )),
             SizedBox(height: 5),
             Expanded(
               child: Text("Jack whoever is on top Of the top 100 in the world",
                   overflow: hover ? TextOverflow.visible : TextOverflow.fade,
                   style: TextStyle(
                       color: Colors.grey[500],
                       fontWeight: FontWeight.w500,
                       letterSpacing: 0.5,
                       height:1.2,
                       fontSize: 14
                   )),
             ),
           ],
         ),
       ),
     );
   }

}
