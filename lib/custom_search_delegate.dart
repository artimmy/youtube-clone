import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>
{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        // Clear button on the search box
        onPressed: ()
        {
          // Clears the 'query' text
          query = "";
        },
        icon: const Icon(Icons.clear)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        // Return to the previous page
        onPressed: ()
        {
          // Closes this context going back, and Returns a empty result
          close(context, "");
        },
        icon: const Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    // when the user presses search this class returns the query (which is the search field text)
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Can suggest things for the user based on what their're typing.  
    return Container();
  }

}