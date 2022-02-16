import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_clone/model/video.dart';


const YOUTUBE_API_KEY = "AIzaSyDDYh1td9nLAeM8uAoSSpA53vtwqc_WVyU";
const CHANNEL_ID = "UCuAzzwvW_qAz8pp1AUMJp-Q";
const BASE_URL = "https://www.googleapis.com/youtube/v3/";

class Api 
{
  search(String search) async
  {
    http.Response get = await http.get(Uri.parse(
      BASE_URL + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=5"
      "&order=date"
      "&key=$YOUTUBE_API_KEY"
      "&channelId=$CHANNEL_ID"
      "&q=$search"
    ));

    if( get.statusCode == 200)
    {
      List<Video> video;
      Map<String, dynamic> jsonData = jsonDecode(get.body);
      print(jsonData["items"][0]["snippet"]["title"].toString());
    }

  }
}