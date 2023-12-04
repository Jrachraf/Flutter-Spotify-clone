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


}