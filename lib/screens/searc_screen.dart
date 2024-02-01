import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text(
          "SuperHeros",
          style: TextStyle(
              color: Colors.brown[700],
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SearchBar(
              trailing: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.brown,
                  ),
                ),
              ],
              hintText: "Search Superhero",
              elevation: const MaterialStatePropertyAll(10),
              hintStyle: const MaterialStatePropertyAll(
                TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
