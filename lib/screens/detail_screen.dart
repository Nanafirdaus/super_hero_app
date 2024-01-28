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
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.superhero.images!.lg!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
