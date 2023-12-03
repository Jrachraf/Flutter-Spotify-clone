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
                  SizedBox(width: 9),
                  Expanded(
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
                                Row(
                                  children: [
                                    Icon(Icons.search,color: Colors.grey[500],),
                                    Spacer(),
                                    Text("Recents",style: TextStyle(color: Colors.grey[500],fontSize: 14,fontWeight: FontWeight.w500),),
                                    SizedBox(width: 5),
                                    Icon(Icons.list,color: Colors.grey[500])
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 9),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: _style.boxStyle(),
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    child: Column(
                      children: [
                        //Head (Gonna skip it for now)

                        //Sliding elements

                        ///Horizontal list
                        //Title
                        _widgets.MenuHListTitle(context,"Made for User","Show all",isHovered,refresh),
                        SizedBox(height: 20),
                        Container(
                          height: 280,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _widgets.MenuHListBody(context,"URL","Title","Image Description"),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: _style.boxStyle()
                          ),
                        )
                      ],
                    ),
                  ),
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
}
