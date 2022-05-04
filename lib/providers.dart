import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/models.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
class SettingsProvider with ChangeNotifier{

y()
{
  notifyListeners();}

}

class ControllSearchContent with ChangeNotifier{
String mode="manga";
String start = 'https://api.myanimelist.net/v0/anime?q=all&fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,media_type,status,genres,my_list_status,num_episodes,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios';
int pageNumber=0;
List<AnimeInfo> cards=[];
String next;
String prev;
Map<String,dynamic> content;

void begin()
{
  http.get(Uri.parse(start)).then((startContent){parseNewContent(startContent);});
} 


bool parseNewContent(http.Response response)
{
  if(response.statusCode==200)
  {
    content=jsonDecode(response.body);
    print('///////////${content['paging']}');
    //if((content['paging']).containsKey('next'))
    next=content['paging']['next'];
    print('next is ${content['paging']['next']}');
    //if((content['paging']).containsKey('previous'))
    prev=content['paging']['previous'];
    print('prev is ${content['paging']['previous']}');

   cards = [];
   for(Map<String,dynamic> anime in content['data'])
   {
cards.add(AnimeInfo.fromJson(anime['node']));
   }
   print(content);
     notifyListeners();
   return true;
  }
  else
  {
    notifyListeners();
     return false;
     }

}
void searchAbout(String name)
{
  if(name.trim()=='')
  {start='https://api.myanimelist.net/v0/'+mode+'?q=all&fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,media_type,status,genres,my_list_status,num_episodes,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios';}
  else
{String query = "https://api.myanimelist.net/v0/"+mode+'?'+'q='+name+'&fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,media_type,status,genres,my_list_status,num_episodes,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios';
start = query;}

print(start);
begin();
notifyListeners();
}

Future<bool>goNext() async
{
  if(next ==null)
  {print('errrror next');
    return false;}

  http.Response newResponse= await http.get(Uri.parse(next));
  if(newResponse.statusCode==200)
  {parseNewContent(newResponse);
  pageNumber++;

  return true;
  }
  else
  {
return false;
  }
}
Future<bool>goPrev() async
{  if(prev ==null || pageNumber ==0)
  {print('errrror prev');
    return false;}

  http.Response newResponse= await http.get(Uri.parse(prev));
  if(newResponse.statusCode==200)
  {parseNewContent(newResponse);
  pageNumber--;

  return true;
  }
  else
  {
return false;
  }
}
}

class ControllCategoredContent with ChangeNotifier{
ContentType categories= new ContentType();
String start = 'https://api.myanimelist.net/v0/anime/ranking?ranking_type=upcoming&fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,media_type,status,genres,my_list_status,num_episodes,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios';
int pageNumber=0;
List<Info> cards=[];
String next;
String prev;
Map<String,dynamic> content;

void begin()
{
  http.get(Uri.parse(start)).then((startContent){parseNewContent(startContent);});
} 


bool parseNewContent(http.Response response)
{
  if(response.statusCode==200)
  {
    content=jsonDecode(response.body);
    print('///////////${content['paging']}');
    //if((content['paging']).containsKey('next'))
    next=content['paging']['next'];
    print('next is ${content['paging']['next']}');
    //if((content['paging']).containsKey('previous'))
    prev=content['paging']['previous'];
    print('prev is ${content['paging']['previous']}');

   cards = [];
   if(categories.mode=='anime'){
   for(Map<String,dynamic> anime in content['data'])
   {
cards.add(AnimeInfo.fromJson(anime['node']));
   }}
   else
   for(Map<String,dynamic> manga in content['data'])
   {
cards.add(MangaInfo.fromJson(manga['node']));
   }
   print(content);
     notifyListeners();
   return true;
  }
  else
  {
    notifyListeners();
     return false;
     }

}

void getData()
{start = 'https://api.myanimelist.net/v0/'+categories.mode+'/ranking?ranking_type='+categories.getRanking()+'&fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,media_type,status,genres,my_list_status,num_episodes,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios';
begin();
notifyListeners();
}

Future<bool>goNext() async
{
  if(next ==null)
  {print('errrror next');
    return false;}

  http.Response newResponse= await http.get(Uri.parse(next));
  if(newResponse.statusCode==200)
  {
    parseNewContent(newResponse);
  pageNumber++;

  return true;
  }
  else
  {
return false;
  }
}

void setMode(int index)
{ categories.mode= categories.modes[index];
getData();
}

void setCategory(int index)
{ if(categories.mode=='anime')
    {
      categories.animeType=categories.ainmeRanking[index];
    }
    else
    {
      categories.mangaType=categories.mangaRanking[index];
    }
getData();}


List<String> getCategories()
{ if(categories.mode=='anime')
    {
     return categories.ainmeRanking;
    }
    else
    {
      return categories.mangaRanking;
    }
}


Future<bool>goPrev() async
{  if(prev ==null || pageNumber ==0)
  {print('errrror prev');
    return false;}

  http.Response newResponse= await http.get(Uri.parse(prev));
  if(newResponse.statusCode==200)
  {parseNewContent(newResponse);
  pageNumber--;

  return true;
  }
  else
  {
return false;
  }
}
}