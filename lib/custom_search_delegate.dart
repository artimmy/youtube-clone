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
    // When the user presses search this class returns the query (which is the search field text)
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Can suggest things for the user based on what their're typing.  
    List<String> list = [];
    // If the user didnt type anything yet then else...
    if ( query.isNotEmpty )
    {
      // Creating a manual list of possible words. Could be done using a autocomplete api.
      list = [
        "Android", "Automobiles", "Automation", "IOS", "Games", "Blockchain", "Bob Ross", "Cars", "Detailing", "Flying", "Gangstar Paradise",
        // Filter this list selecting a list item 'word' where this word starts with what the user is typing 'query'.
      ].where(
        (word) => word.toLowerCase().startsWith( query.toLowerCase() )
        // Converting it back to a list / returning a list with the words tha match.
      ).toList();

      // Creating a ListView with 'list' items.
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index)
        {
          return ListTile(
            title: Text( list[index] ),
            // When the user clicks the list item i.e. selecting a suggestion, whis will close the search and
            // return the list item clicked as the 'query'
            onTap: () => close(context, list[index]),
          );
        }
      );
    }
    else 
    {
      // This will apear only when 'query' is empty
      return const Center(
        child: Text("No Results"),
      );
    }
    // return Container();
  }

}