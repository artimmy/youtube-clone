import 'package:flutter/material.dart';
import 'package:youtube_clone/api.dart';
import 'package:youtube_clone/model/video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube_clone/secrets.dart';

class Start extends StatefulWidget {

  late String query;
  // Receiving res 'query' via constructor.
  Start( this.query ,{ Key? key }) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  _listVideos(String query)
  {
    Api api = Api();
    // 'res' is passed, here, to the api, with the name of 'query'.
    return api.search(query); 
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>?>(
      future: _listVideos(widget.query),
      builder: (context, snapshot)
      {
        switch (snapshot.connectionState) 
        {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if( snapshot.hasData )
            {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index)
                {
                  List<Video>? videos = snapshot.data;
                  Video video = videos![ index ];

                  return GestureDetector(
                    onTap: ()
                    {
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: YOUTUBE_API_KEY,
                        videoId: video.id,
                        autoPlay: true,
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.thumbnail.toString()),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(video.title.toString()),
                          subtitle: Text(video.channel.toString()),
                        )
                      ],
                    ),
                  ); 
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 2,
                  color: Colors.grey,
                ), 
                
              );
            }
            break;
        }
        // Returning a Widget just so the FutureBuilder builder shut up.
        // Also, taking advantage that futurebuilder asks for this Widget to handle errors.
        return Center(
          child: Text("Lists: Failed to load: ${snapshot.error.toString()}"),
        );
      },
    );
  }
}