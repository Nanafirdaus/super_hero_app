import 'package:flutter/material.dart';
import '../models/super_hero.dart';
import '../screens/detail_screen.dart';

class SuperHeroView extends StatelessWidget {
  const SuperHeroView({
    super.key,
    required this.superHeros,
  });

  final List<Superhero> superHeros;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
