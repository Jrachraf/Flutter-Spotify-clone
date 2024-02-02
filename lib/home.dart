import 'package:flutter/material.dart';
import 'package:website_one/globals/styles.dart';
import 'package:website_one/globals/widgets.dart';
import 'package:website_one/names_&_urls.dart';

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

   void update(){
     setState(() {
       print("updated");
     });
   }
   String? size;
   String playedTitle = "Liked Songs";
   void updateTitle(String newTitle){
     setState(() {
       playedTitle = newTitle;
     });
   }
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

                   //Search + Sort
                   Row(
                     children: [
                       Icon(Icons.search,color: Colors.grey[400],),
                       Spacer(),
                       Text("Recents",style: TextStyle(color: Colors.grey[400],fontSize: 14.5,fontWeight: FontWeight.w400),),
                       SizedBox(width: 5),
                       Icon(Icons.list,color: Colors.grey[400])
                     ],
                   ),
                   SizedBox(height: 15),

                   //All PLaylists
                   ListView(
                     shrinkWrap: true,
                     children: [

                       leftTile("Liked Songs",["Playlist","500 songs"],true),
                       leftTile("Your Episodes",["Saved & downloaded epidoes"],true),
                       leftTile("Release Radar",["Playlist","Sporify"],false),
                       leftTile("Your Top Songs 2022",["Playlist","Spotify"],false),
                       leftTile("Goth",["Playlist" ,"Achraf"],false),
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
       decoration: _style.boxStyle(
         listColor: [
           Colors.grey[800]!,
           Colors.grey[900]!,
           Colors.grey[900]!,
           Colors.grey[900]!,
         ]
       ),
       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
       child: Column(
         children: [
           //User head
           Row(
             children: [

               GlobalWidgets().roundedIconButton(Icons.arrow_back_ios_new,(){},right: 4,iconColor: Colors.white),
               SizedBox(width: 8),
               GlobalWidgets().roundedIconButton(Icons.arrow_forward_ios_rounded,(){},left: 3),
               Spacer(),
               GlobalWidgets().roundedIconButton(Icons.notifications_none_rounded,(){},),
               SizedBox(width: 8),
               GlobalWidgets().roundedIconButton(Icons.groups_2_outlined,(){},),
               SizedBox(width: 8),
               GlobalWidgets().roundedIconButton(Icons.person_outline,(){},),
             ],

           ),
           SizedBox(height: 15),

           Expanded(
             child: ListView(
               shrinkWrap: true,
               children: [

                 //Recent playlists
                 Row(
                   children: [
                     Text("Good Morning",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                         color: Colors.white,
                         fontWeight: FontWeight.w700,
                         fontSize: 30
                     )),
                   ],
                 ),
                 SizedBox(height: 10),

                 GridView.builder(
                   shrinkWrap: true,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 4,
                       // childAspectRatio: MediaQuery.of(context).size.width < 1150 ? 5 : 7,
                       childAspectRatio: 5,
                       crossAxisSpacing: 10,
                       mainAxisSpacing: 10
                   ),
                   itemCount: 8,
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
                 categoryRow("Made for user"),

                 SizedBox(height: 20),

                 categoryRow("Jump back in"),

                 SizedBox(height: 20),

                 categoryRow("Recently played"),

                 SizedBox(height: 20),

                 categoryRow("Your top mix"),


               ],
             ),
           ),
         ],
       ),
     );
  }
  Widget categoryRow(String title){
     return Column(
       children: [
         //Title
         _widgets.MenuHListTitle(context,title,"Show all"),
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
               bool focused = false;
               return StatefulBuilder(
                 builder: (context, setState) {
                   return InkWell(
                       onTap: (){},
                       onHover: (value){
                         setState(() {
                           focused = value;
                         });
                       },
                       child: MenuHListBody(context,"URL","Title","Image Description",focused)
                   );
                 },
               );
             },
           ),
         ),
       ],
     );
  }

  Widget rightSlid(){
     return Expanded(
       child: Column(
         children: [
           Expanded(
             child: Container(
                 decoration: _style.boxStyle(
                   listColor: [
                     Color(0xff282828),
                     Color(0xff1c1c1c),
                     Color(0xff0e0e0e),
                   ]
                 ),
               padding: EdgeInsets.fromLTRB(20,0,20,0),
               child: ListView(

                 children: [
                   SizedBox(height: 20),
                   //title
                   Row(
                     children: [

                       Text("Liked Songs",style: TextStyle(
                         color: Colors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.w600
                       ),),
                       Spacer(),
                       GlobalWidgets().SIconButton(Icons.close,(){})
                     ],
                   ),
                   SizedBox(height: 15),

                   //Album Cover
                   ClipRRect(
                     borderRadius: BorderRadius.circular(8),
                     child: Image.network(
                       "https://i.redd.it/svk8zd3km9o71.jpg",
                       width: double.infinity,
                       fit: BoxFit.fitWidth,
                     ),
                   ),
                   SizedBox(height: 10),

                   //Track info
                   GlobalWidgets().trackInfo(),

                   SizedBox(height: 25),
                   GlobalWidgets().aboutArtist()

                 ],
               ),
             ),
           )
         ],
       ),
     );
  }

  Widget leftTile(String title,List<String> Subtitle,bool saved){
     bool played = title == playedTitle;
    String subString = "";
    Subtitle.forEach((element) {
      if(subString.isNotEmpty)
        subString += " • ";
        subString += element;
    });

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
          updateTitle(title);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
        leading: ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network("https://i.scdn.co/image/ab67616d0000b273a426bc05c4c7531da2ea0ee5")),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: played ? SColors().green :  Colors.white
          ),
        ),
        subtitle: Row(
          children: [
            if(saved)
            Transform.rotate(
              angle: 0.55,
                child: Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Icon(Icons.push_pin,color: SColors().green,size: 16,),
                )
            ),
            Text(
              subString,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey[500],
              ),
            ),
          ],
        ),
        trailing: played ? Icon(Icons.volume_up,color: SColors().green,size: 20) : null,
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
         padding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 11),
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
             Text("Jack whoever is on top Of the top 100 in the world",
                 overflow: TextOverflow.ellipsis,
                 maxLines: 2,
                 style: TextStyle(
                     color: Colors.grey[500],
                     fontWeight: FontWeight.w500,
                     overflow: TextOverflow.fade,
                     letterSpacing: 0.5,
                     height:1.2,
                     fontSize: 14
                 )),
           ],
         ),
       ),
     );
   }

}
