
class Info{

}

class AnimeInfo with Info {
  final int id;
  final String mediumImageUrl;
 final  String largeImageUrl;
 final String title;
 final  rate;
 final String forCategory;
 final String startDate;
 final String endDate;
 final String description;
 final List<String> genres;
 final int episodeNumber; 
 final String source;
 final double averageEpisodeDuration;
 final List<String> studios;
 final String mediaType;
 final int votedUsers;
 final int members;
 final int popularity;
 final List<String> alternativeTitles;
 final int order;
  
//AnimeInfo({this.id,this.largeImageUrl,this.mediumImageUrl,this.rating,this.title});
 AnimeInfo.fromJson(Map<String,dynamic> json):
this.id=json['id'],
this.mediumImageUrl=json['main_picture']['medium'],
this.largeImageUrl=json['main_picture']['large'],
this.title=json['title'],
this.rate = json['mean'],
this.forCategory = json['rating'],
this.startDate=json['start_date'],
this.endDate=json['end_date'],
this.description =json['synopsis'],
this.genres = List<String>.from((json['genres']).map((i)=>('${i['name']}')).toList()),
this.episodeNumber =json['num_episodes'],
this.source=json['source'],
this.averageEpisodeDuration=json['average_episode_duration']/60,
this.studios=List<String>.from((json['studios'].map((i)=>i['name'])).toList()),
this.mediaType = json['media_type'],
this.votedUsers = json['num_scoring_users'],
this.members = json['num_list_users'],
this.popularity = json['popularity'],
this.alternativeTitles = List<String>.from((json['alternative_titles']['synonyms'].map((i)=>i)).toList()),
this.order = json['rank'];
 // this.=json[''], 
}

class MangaInfo with Info{
  final int id;
  final String mediumImageUrl;
 final  String largeImageUrl;
 final String title;
 final double rate;
 final String forCategory;
 final String startDate;
 final String endDate;
 final String description;
 final List<String> genres;
 final int episodeNumber; 
 final String source;
 final String mediaType;
 final int votedUsers;
 final int members;
 final int popularity;
 final List<String> alternativeTitles;
 final int order;
  
//AnimeInfo({this.id,this.largeImageUrl,this.mediumImageUrl,this.rating,this.title});
 MangaInfo.fromJson(Map<String,dynamic> json):
this.id=json['id'],
this.mediumImageUrl=json['main_picture']['medium'],
this.largeImageUrl=json['main_picture']['large'],
this.title=json['title'],
this.rate = json['mean'],
this.forCategory = json['rating'],
this.startDate=json['start_date'],
this.endDate=json['end_date'],
this.description =json['synopsis'],
this.genres = List<String>.from((json['genres']).map((i)=>('${i['name']}')).toList()),
this.episodeNumber =json['num_episodes'],
this.source=json['source'],
this.mediaType = json['media_type'],
this.votedUsers = json['num_scoring_users'],
this.members = json['num_list_users'],
this.popularity = json['popularity'],
this.alternativeTitles = List<String>.from((json['alternative_titles']['synonyms'].map((i)=>i)).toList()),
this.order = json['rank'];
 // this.=json[''],
  
}

class ContentType{
  List<String> modes= ['anime','manga'];
String mode = 'anime';
String mangaType= 'all';
final List<String> mangaRanking= ['all','manga','oneshots'/*,'doujin'*/,'lightnovels','novels',
                                  'manhwa','manhua','bypopularity','favorite'];

String animeType= 'all';
final List<String> ainmeRanking= ['all','airing','upcoming','tv','ova','movie',
                                  'special','bypopularity','favorite'];
String getRanking()
=>(mode=='anime')? animeType: mangaType;


}