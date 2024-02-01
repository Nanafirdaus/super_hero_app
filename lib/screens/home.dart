import 'package:flutter/material.dart';
import 'package:super_hero_app/models/super_hero.dart';
import 'package:super_hero_app/screens/searc_screen.dart';
import 'package:super_hero_app/services/http_service.dart';

import '../widgets/superhero_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Superhero>?> superHeros;

  @override
  void initState() {
    super.initState();
    superHeros = HttpService.fetchSuperHero();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: superHeros,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Superhero> superHeros = snapshot.data!;
            return DefaultTabController(
              length: 3,
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      title: Text(
                        "SuperHeros",
                        style: TextStyle(
                            color: Colors.brown[700],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                      actions: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) {
                                      return const SearchScreen();
                                    },
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.brown[700],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings,
                                size: 30,
                                color: Colors.brown[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                      toolbarHeight: 50,
                      backgroundColor: Colors.brown[200],
                      bottom: TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.brown[500],
                        indicatorColor: Colors.brown[500],
                        tabs: const [
                          Tab(
                            text: "All",
                          ),
                          Tab(
                            text: "Male",
                          ),
                          Tab(
                            text: "Female",
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    SuperHeroView(superHeros: superHeros),
                    SuperHeroView(
                      superHeros: superHeros
                          .where((superhero) =>
                              superhero.appearance!.gender! == "Male")
                          .toList(),
                    ),
                    SuperHeroView(
                      superHeros: superHeros
                          .where((superhero) =>
                              superhero.appearance!.gender! == "Female")
                          .toList(),
                    ),
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
