import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_clone/model/video.dart';
import 'package:youtube_clone/secrets.dart';

const CHANNEL_ID = "UCuAzzwvW_qAz8pp1AUMJp-Q";
const BASE_URL = "https://www.googleapis.com/youtube/v3/";

class Api 
{
  Future<List<Video>?> search(String search) async
  {
    http.Response get = await http.get(Uri.parse(
      BASE_URL + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=5"
      "&order=date"
      "&key=$YOUTUBE_API_KEY"
      //"&channelId=$CHANNEL_ID"
      "&q=$search"
    ));

    if( get.statusCode == 200)
    {
      // Getting the decoded data and storing it in a Map 'jsonData'
      Map<String, dynamic> jsonData = jsonDecode(get.body);

      // Getting the decode data stored in 'jsonData' Map above and converting into a usefull List 'videos'
      List<Video> videos = jsonData["items"].map<Video>(
        // Passing a map 'JsonData' to be converted into a list 'videos'
        (passing_a_map_JsonData_ToBeConvertedIntoAList) => Video.fromJson(passing_a_map_JsonData_ToBeConvertedIntoAList)
      ).toList();
      
      return videos;
      
      /*// Uncomment for testing ><><<><
       for(var video in videos)
      {
        print(video.title);
      }
      for (var video in jsonData["items"])
      {
        print("${video.toString()}\n");
      } 
      print(jsonData["items"][2]["snippet"]["title"]);
      */
    }
    else
    {
      print("Something went wrong returning List<Video> videos on file lib/api.dart");
    }
  }
}