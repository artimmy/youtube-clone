import 'package:flutter/material.dart';
import 'package:youtube_clone/api.dart';
import 'package:youtube_clone/model/video.dart';

class AppHome extends StatefulWidget {
  const AppHome({ Key? key }) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {

  _listVideos()
  {
    Api api = Api();
    return api.search("");
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>?>(
      future: _listVideos(),
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

                  return Column(
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