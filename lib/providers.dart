import 'package:flutter/material.dart';
import 'package:anime_app/models.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
class SettingsProvider with ChangeNotifier{

y()
{
  notifyListeners();}

}

class ControllContent with ChangeNotifier{
String mode="manga";
String start = 'https://api.myanimelist.net/v0/anime?q=all';
int pageNumber=0;
List<AnimeInfo> animes=[];
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

   animes = [];
   for(Map<String,dynamic> anime in content['data'])
   {
animes.add(AnimeInfo.fromJson(anime['node']));
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
  {start='https://api.myanimelist.net/v0/'+mode+'?q=all';}
  else
{String query = "https://api.myanimelist.net/v0/"+mode+'?'+'q='+name;
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