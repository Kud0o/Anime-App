import 'dart:ui';

import 'package:anime_app/providers.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:anime_app/models.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:anime_app/styling.dart';



class AnimeCard extends StatelessWidget {
   AnimeCard({this.data});
  final AnimeInfo data;

  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.all(1.0.w),
      child: Container(padding: EdgeInsets.all(3.0.w),
          child: Row(children: [
            CachedNetworkImage(imageUrl: data.mediumImageUrl,width: 50.0.w,
          placeholder:(context, url)=>Image(image:AssetImage('asset/images/Viol.jpg'),width: 50.0.w,),
          errorWidget:(context, url,_)=>Image(image:AssetImage('asset/images/Viol.jpg'),width: 50.0.w,) ,
          ),

           Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Container(width: 40.0.w,
               child: Text(data.title,softWrap: true,style:AppTextStyle.titleText.copyWith(color: Colors.black,fontWeight: FontWeight.w700),)),
           ],)
          ],
            )),
    );
  
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.0.w),
      child: Container(
        height: 6.0.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: Center(
            child: TextFormField(onChanged:(searchName){Provider.of<ControllContent>(context,listen:false).searchAbout(searchName);},
              autofocus: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 2.0.h),
                  hintText: 'Enter Anime Name',
                  hintStyle:
                      AppTextStyle.bodyText.copyWith(color: Colors.black45),
                  suffixIcon: Image.asset('asset/icons/search.png'),
                  ),
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFE5D9EB),
                offset: Offset(5.0, 20.0),
                blurRadius: 50.0,
                //spreadRadius: 1.0
              ),
            ]),
      ),
    );
  }
}

      