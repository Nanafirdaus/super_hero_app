import 'package:flutter/material.dart';
import 'package:super_hero_app/models/super_hero.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  Superhero superhero;
  DetailScreen({required this.superhero, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[200],
          title: Text("${widget.superhero.id}"),
        ),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight / 2,
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              NetworkImage(widget.superhero.images!.lg!),
                        ),
                      ),
                      Center(
                        child: Text(
                          widget.superhero.name!,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: screenHeight / 2,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.brown[500],
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(16),
                    topEnd: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Appearance",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('${widget.superhero.appearance!.gender}'),
                              Text('${widget.superhero.appearance!.race}'),
                              Text('${widget.superhero.appearance!.height}'),
                              Text('${widget.superhero.appearance!.weight}'),
                              Text('${widget.superhero.appearance!.eyeColor}'),
                              Text('${widget.superhero.appearance!.hairColor}'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Biography",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('${widget.superhero.biography!.fullName}'),
                              Text('${widget.superhero.biography!.alterEgos}'),
                              Text('${widget.superhero.biography!.aliases}'),
                              Text(
                                  '${widget.superhero.biography!.placeOfBirth}'),
                              Text('${widget.superhero.biography!.publisher}'),
                              Text('${widget.superhero.biography!.alignment}'),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "PowerStats",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  '${widget.superhero.powerstats!.intelligence}'),
                              Text('${widget.superhero.powerstats!.strength}'),
                              Text('${widget.superhero.powerstats!.speed}'),
                              Text(
                                  '${widget.superhero.powerstats!.durability}'),
                              Text('${widget.superhero.powerstats!.power}'),
                              Text('${widget.superhero.powerstats!.combat}'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
