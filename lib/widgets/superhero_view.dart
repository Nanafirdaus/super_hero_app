import 'package:flutter/material.dart';
import '../models/super_hero.dart';
import '../screens/detail_screen.dart';

class SuperHeroView extends StatefulWidget {
  const SuperHeroView({
    super.key,
    required this.superHeros,
  });

  final List<Superhero> superHeros;

  @override
  State<SuperHeroView> createState() => _SuperHeroViewState();
}

class _SuperHeroViewState extends State<SuperHeroView> {
  late List<Superhero> sortedSuperheroes = [];
  List<String> comicCategories = [
    "All",
    "Marvel Comics",
    "DC Comics",
    "Dark Horse Comics",
  ];

  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    sortedSuperheroes = widget.superHeros;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10,
              children: [
                ...comicCategories.map(
                  (e) => ChoiceChip(
                    selectedColor: Colors.brown[200],
                    label: Text(e),
                    selected: selectedCategory == e,
                    onSelected: (_) {
                      selectedCategory = e;
                      if (selectedCategory == comicCategories[0]) {
                        setState(() {
                          sortedSuperheroes = widget.superHeros;
                        });
                      } else if (selectedCategory == comicCategories[1]) {
                        setState(() {
                          sortedSuperheroes = widget.superHeros
                              .where((superhero) =>
                                  superhero.biography!.publisher ==
                                  "Marvel Comics")
                              .toList();
                        });
                      } else if (selectedCategory == comicCategories[2]) {
                        setState(() {
                          sortedSuperheroes = widget.superHeros
                              .where((superhero) =>
                                  superhero.biography!.publisher == "DC Comics")
                              .toList();
                        });
                      } else {
                        setState(() {
                          sortedSuperheroes = widget.superHeros
                              .where((superhero) =>
                                  superhero.biography!.publisher ==
                                  "Dark Horse Comics")
                              .toList();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: sortedSuperheroes.length,
            itemBuilder: (context, index) {
              Superhero superhero = sortedSuperheroes[index];
              return Card(
                color: Colors.brown[200],
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen(
                            superhero: superhero,
                          );
                        },
                      ),
                    );
                  },
                  title: Text(superhero.name!),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${superhero.images!.lg}"),
                  ),
                  trailing: const Icon(Icons.info_outline),
                  subtitle: Text(
                    "${superhero.biography!.publisher}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
