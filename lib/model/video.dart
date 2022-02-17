class Video
{
  String? id;
  String? title;
  String? description;
  String? thumbnail;
  String? channel;

  Video({this.id, this.title, this.description, this.thumbnail, this.channel});

  factory Video.fromJson(Map<String, dynamic> receiving_a_map_JsonData_ToBeConvertedIntoAList)
  {
    var list = receiving_a_map_JsonData_ToBeConvertedIntoAList;
    return Video(
      id: list["id"]["videoId"],
      title: list["snippet"]["title"],
      thumbnail: list["snippet"]["thumbnails"]["high"]["url"],
      channel: list["snippet"]["channelId"]
    );

  }
}