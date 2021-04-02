
class AnimeInfo{
  final int id;
  final String mediumImageUrl;
 final  String largeImageUrl;
 final String title;
  int rating;
  
AnimeInfo({this.id,this.largeImageUrl,this.mediumImageUrl,this.rating,this.title});
AnimeInfo.fromJson(Map<String,dynamic> json):
this.id=json['id'],
this.mediumImageUrl=json['main_picture']['medium'],
this.largeImageUrl=json['main_picture']['large'],
this.title=json['title'];
  
}

/*
class AnimeControll{
static String start = 'https://api.myanimelist.net/v0/anime?id=31588&q=all';
int pageNumber=0;
static List<AnimeInfo> animes=[];
String next;
String prev;
Map<String,dynamic> content;

AnimeControll()
{
  http.get(Uri.parse(start)).then((startContent){parseNewContent(startContent);});
} 

static bool parseNewContent(http.Response response)
{
  if(response.statusCode==200)
  {
    content=jsonDecode(response.body);
    next=content['paging']['next'];
    if(pageNumber<0 && content['paging'].containsKey('prev'))
      prev=content['paging']['prev'];
   
   for(Map<String,dynamic> anime in content['data'])
   {
animes.add(AnimeInfo.fromJson(anime['node']));
   }
   return true;
  }
  else
  {
     return false;
     }
}

static Future<bool>goNext() async
{
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
static Future<bool>goPrev() async
{
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

}*/