import 'package:flutter/material.dart';
import 'package:super_hero_app/models/super_hero.dart';
import 'package:super_hero_app/utils/extension.dart';
import 'package:super_hero_app/widgets/custom_expantion_tile.dart';
import 'package:super_hero_app/widgets/custom_tile.dart';
import 'package:super_hero_app/widgets/powerstats.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.brown[300],
          title: Text(
            "${widget.superhero.name}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.brown[300],
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: context.screenWidth * .5,
                  height: context.screenHeight * .2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "${widget.superhero.images!.lg}",
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * .02,
                ),
                Text(
                  "${widget.superhero.name}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${widget.superhero.biography!.fullName}",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * .02,
                ),
                HeroExpantionTile(
                  heroInfo: "Appearance",
                  children: [
                    HeroTile(
                      title: "Gender",
                      subtitle: "${widget.superhero.appearance!.gender}",
                      icon: widget.superhero.appearance!.gender == "Male"
                          ? const Icon(
                              Icons.male,
                              size: 30,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.female,
                              size: 30,
                              color: Colors.white,
                            ),
                    ),
                    HeroTile(
                      title: "Race",
                      subtitle: "${widget.superhero.appearance!.race}",
                      icon: const Icon(
                        Icons.people_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    HeroTile(
                      title: "Eye Color",
                      subtitle: "${widget.superhero.appearance!.eyeColor}",
                      icon: const Icon(
                        Icons.remove_red_eye,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    HeroTile(
                      title: "Hair Color",
                      subtitle: "${widget.superhero.appearance!.hairColor}",
                      icon: const Icon(
                        Icons.color_lens,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    HeroTile(
                      title: "Height",
                      subtitle: "${widget.superhero.appearance!.height}",
                      icon: const Icon(
                        Icons.height,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    HeroTile(
                      title: "Weight",
                      subtitle: "${widget.superhero.appearance!.weight}",
                      icon: const Icon(
                        Icons.fitness_center,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                HeroExpantionTile(
                  heroInfo: "Biography",
                  children: [
                    HeroTile(
                        title: "Full Name",
                        subtitle: "${widget.superhero.biography!.fullName}",),
                    HeroTile(
                        title: "Alter Ego",
                        subtitle: "${widget.superhero.biography!.alterEgos}"),
                    HeroTile(
                        title: "Aliases",
                        subtitle: "${widget.superhero.biography!.aliases}"),
                    HeroTile(
                        title: "Place Of Birth",
                        subtitle:
                            "${widget.superhero.biography!.placeOfBirth}"),
                    HeroTile(
                        title: "First Appearance",
                        subtitle:
                            "${widget.superhero.biography!.firstAppearance}"),
                    HeroTile(
                        title: "Publisher",
                        subtitle: "${widget.superhero.biography!.publisher}"),
                    HeroTile(
                        title: "Alignment",
                        subtitle: "${widget.superhero.biography!.alignment}"),
                  ],
                ),
                HeroExpantionTile(
                  heroInfo: "Connection",
                  children: [
                    HeroTile(
                        title: "Group Affilation",
                        subtitle:
                            "${widget.superhero.connections!.groupAffiliation}"),
                    HeroTile(
                        title: "Relatives",
                        subtitle: "${widget.superhero.connections!.relatives}")
                  ],
                ),
                HeroExpantionTile(
                  heroInfo: "Work",
                  children: [
                    HeroTile(
                        title: "Occupation",
                        subtitle: "${widget.superhero.work!.occupation}"),
                    HeroTile(
                        title: "Base",
                        subtitle: "${widget.superhero.work!.base}"),
                  ],
                ),
                HeroExpantionTile(
                  heroInfo: "Powerstats",
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PowerStatsWidget(
                          title: "Intelligence",
                          value: widget.superhero.powerstats!.intelligence!
                              .toInt(),
                        ),
                        PowerStatsWidget(
                          title: "Strength",
                          value: widget.superhero.powerstats!.strength!.toInt(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PowerStatsWidget(
                          title: "Speed",
                          value: widget.superhero.powerstats!.speed!.toInt(),
                        ),
                        PowerStatsWidget(
                          title: "Durability",
                          value:
                              widget.superhero.powerstats!.durability!.toInt(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PowerStatsWidget(
                          title: "Power",
                          value: widget.superhero.powerstats!.power!.toInt(),
                        ),
                        PowerStatsWidget(
                          title: "Combat",
                          value: widget.superhero.powerstats!.combat!.toInt(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
