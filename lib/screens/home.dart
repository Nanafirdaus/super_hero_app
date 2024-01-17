import 'package:flutter/material.dart';
import 'package:super_hero_app/models/super_hero.dart';
import 'package:super_hero_app/screens/detail_screen.dart';
import 'package:super_hero_app/services/http_service.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        title: const Text("Super Heros"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: superHeros,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Superhero> superHeros = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: superHeros.length,
                itemBuilder: (context, index) {
                  Superhero superhero = superHeros[index];
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
                        backgroundImage:
                            NetworkImage("${superhero.images!.lg}"),
                      ),
                    ),
                  );
                },
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
