import 'package:flutter/material.dart';
import 'package:website_one/globals/styles.dart';
import 'package:website_one/home.dart';

class GlobalWidgets{
  Widget TitleText(context,String text,{bool selected = false}){
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: selected ? Colors.white : Colors.grey[500],
        fontWeight: FontWeight.w600,
        fontSize: 15
      ),
    );
  }
  Widget IconTitleText(context,String title,IconData iconData,{bool selected = false}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 5),
          Icon(iconData,color: selected ? Colors.white : Colors.grey[500],size: 28),
          SizedBox(width: 15),
          TitleText(context, title,selected: selected),
        ],
      ),
    );
  }
  Widget tap(context,String title){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 13
          ),
        ),
      ),
    );
  }

  Widget MenuHListTitle(context,String Title,String buttonText,bool isHovered, var fun){

    return Row(
      children: [
        Text(Title,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24
        )),
        Spacer(),
        TextButton(

          onPressed: (){},
          onHover: (value) {
            fun(value);
          },
          child: Text(buttonText,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: isHovered ? Colors.grey[300] :Colors.grey[500],
              fontWeight: FontWeight.w700,
              fontSize: 14
          )),
        )
      ],
    );
  }

  Widget MenuHListBody(context,String ImageUrl,String Title,String Desc){
    return Container(
      width: 180,
      height: 270,
      decoration: GlobalStyles().boxStyle(color: Color(0xff181818)),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 160,
              height: 160,
              child: Image.network(
                  "https://png.pngtree.com/background/20210715/original/pngtree-electronic-music-album-picture-image_1301130.jpg",
                  fit: BoxFit.fill
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
                overflow: TextOverflow.fade,
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
    );
  }
}