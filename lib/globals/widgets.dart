import 'package:flutter/material.dart';
import 'package:website_one/globals/styles.dart';
import 'package:website_one/home.dart';
import 'package:website_one/names_&_urls.dart';

class GlobalWidgets {
  Widget TitleText(context, String text, {bool selected = false}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: selected ? Colors.white : Colors.grey[500],
          fontWeight: FontWeight.w600,
          fontSize: 17),
    );
  }

  Widget IconTitleText(context, String title, IconData iconData,
      {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 5),
          Icon(iconData,
              color: selected ? Colors.white : Colors.grey[500], size: 28),
          SizedBox(width: 15),
          TitleText(context, title, selected: selected),
        ],
      ),
    );
  }

  Widget tap(context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ),
    );
  }

  Widget MenuHListTitle(
      context, String Title, String buttonText) {
    bool isHovered = false;
    return Row(
      children: [
        Text(Title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24)),
        Spacer(),
        StatefulBuilder(
          builder: (context, setState) {
            return TextButton(
              onPressed: () {},
              onHover: (value) {
                setState((){
                  isHovered = value;
                });
              },
              child: Text(buttonText,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: isHovered ? Colors.grey[300] : Colors.grey[500],
                      fontWeight: FontWeight.w700,
                      fontSize: 14)),
            );
          },
        )
      ],
    );
  }

  Widget aboutArtist(){
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: Colors.grey[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 220,
                child: Stack(
                  children: [
                    Image.network(
                      weekdneArtistImage,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                    ),
                    Align(
                      alignment: Alignment(-0.85,-0.80),
                      child: Text(
                        "About the artist",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                )
            ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "The Weeknd",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),
                  ),



                  Container(
                    height: 55,
                    child: Row(
                      children: [
                        Text(
                          "100 monthly listeners",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w400,
                              fontSize: 16
                          ),
                        ),
                        Spacer(),
                        followButton(null),
                      ],
                    ),
                  ),

                  Text(
                    shortDesc,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[500]
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget followButton(var fun){
    bool focused = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return InkWell(
          borderRadius: BorderRadius.circular(8),
          onHover: (value) {
            focused = value;
            setState(() {},);
          },
          onTap: (){

          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 50),
            padding: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color: focused ? Colors.white :Colors.grey[700]!,
                    width: focused ? 1.3 :1
                )
            ),
            child: Text(
              "Follow",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ),
        );
      },
    );
  }

  Widget trackInfo(){
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Blinding Lights",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 2),
            Text(
              "The Weeknd",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
        Spacer(),
        GlobalWidgets().SIconButton(Icons.add_circle_outline_rounded,(){}),
        SizedBox(width: 0),
        GlobalWidgets().SIconButton(Icons.more_horiz,(){})
      ],
    );
  }

  Widget roundedIconButton(IconData icon, var Fun,{double left = 0,double right = 0,Color? iconColor}){
    return ClipOval(
      child: Material(
        color: Colors.black.withOpacity(0.8),
        child: InkWell(
          splashColor: Colors.black.withOpacity(0.8), // Splash color
          onTap: Fun,
          child: SizedBox(width: 33, height: 33, child: Padding(
            padding: EdgeInsets.only(right: right,left: left),
            child: Icon(icon,color: iconColor ?? Colors.grey[500],size: 18,weight: 0.4,semanticLabel: "Go back",),
          )),
        ),
      ),
    );
  }


  Widget SIconButton(IconData icon,var fun,{String? label}){
    return SizedBox(
      child: IconButton(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),

        selectedIcon: Icon(icon,color: Colors.grey[300],),
        tooltip: label,
        onPressed: fun,
        icon: Icon(icon,color: Colors.grey[500],size: 21,),
        color: Colors.transparent,
      ),
    );
  }
}
