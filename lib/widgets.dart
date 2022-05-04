import 'dart:ui';
import 'dart:math'as math;
import 'package:anime_app/providers.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:anime_app/models.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:anime_app/styling.dart';



class AnimeCard extends StatelessWidget {
   AnimeCard({this.data});
  //final AnimeInfo data;
  final data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0.w,right: 1.0.w,left: 2.0.w),
      child: Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9.0.w))),elevation: 1.5.w,shadowColor: Colors.lightBlue,
        margin: EdgeInsets.all(1.0.w),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 2.0.w),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0.w)),
            child: Row(children: [
              ClipRRect(borderRadius: BorderRadius.all(Radius.circular(4.0.w)),
                child: CachedNetworkImage(imageUrl: data.mediumImageUrl,width: 25.0.w,
            placeholder:(context, url)=>Image(image:AssetImage('asset/images/Viol.jpg'),width: 25.0.w,),
            errorWidget:(context, url,_)=>Image(image:AssetImage('asset/images/Viol.jpg'),width: 25.0.w,) ,
            ),
              ),

             Padding(
               padding: EdgeInsets.all(1.0.w),
               child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Container(width: 60.0.w,
                   child: Text(data.title,softWrap: true,style:AppTextStyle.descText.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 12.0.sp),)),
               ],),
             )
            ],
              )),
      ),
    );
  
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.0.w,left: 2.0.w,top: 2.0.w,bottom: 1.0.w),
      child: Container(
        height: 6.0.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: Center(
            child: TextFormField(onFieldSubmitted:(searchName){Provider.of<ControllSearchContent>(context,listen:false).searchAbout(searchName);},
              autofocus: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 2.0.h),
                  hintText: 'Enter Anime Name',
                  hintStyle:
                      AppTextStyle.bodyText.copyWith(color: Colors.black45,fontSize: 12.0.sp,letterSpacing: 2.0.sp,wordSpacing: 0.0.sp),
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

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
       super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,  // Photo
          ),
        ),
      ),
    );
  }
}

class ExpandedModeChoices extends StatefulWidget {
  @override
  _ExpandedModeChoicesState createState() => _ExpandedModeChoicesState();
}

class _ExpandedModeChoicesState extends State<ExpandedModeChoices> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.0.w,left: 2.0.w,top: 2.0.w,bottom: 1.0.w),
      child: Container(
        height: 10.0.w,
        width: 30.0.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: Center(
            child: DropdownButton<String>(itemHeight: 20.0.w,
      value: Provider.of<ControllCategoredContent>(context,listen: false).categories.mode,
      //icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
        style:  AppTextStyle.bodyText.copyWith(color: Colors.deepPurple,fontSize:15.0.sp,letterSpacing: 0),
      /*underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),*/
      onChanged: (String newValue) {
        setState(() {
          int index = Provider.of<ControllCategoredContent>(context,listen: false).categories.modes.indexOf(newValue);
          Provider.of<ControllCategoredContent>(context,listen: false).setMode(index);
        });
      },
      items: (Provider.of<ControllCategoredContent>(context,listen: false).categories.modes)
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    )
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
class ExpandedCategoriesChoices extends StatefulWidget {
  @override
  _ExpandedCategoriesChoicesState createState() => _ExpandedCategoriesChoicesState();
}

class _ExpandedCategoriesChoicesState extends State<ExpandedCategoriesChoices> {
  @override
  Widget build(BuildContext context) {
    return 
  Padding(
      padding: EdgeInsets.only(right: 3.0.w,left: 2.0.w,top: 2.0.w,bottom: 1.0.w),
      child: Container(
        height: 10.0.w,
        width: 39.0.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: Center(
            child: DropdownButton<String>(itemHeight: 20.0.w,
      value: Provider.of<ControllCategoredContent>(context,listen: false).categories.getRanking(),
     // icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style:  TextStyle(color: Colors.deepPurple,fontSize:15.0.sp,),
      /*underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),*/
      onChanged: (String newValue) {
        setState(() {
          int index = Provider.of<ControllCategoredContent>(context,listen: false).getCategories().indexOf(newValue);
          Provider.of<ControllCategoredContent>(context,listen: false).setCategory(index);
        });
      },
      items: Provider.of<ControllCategoredContent>(context,listen: false).getCategories()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    )
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