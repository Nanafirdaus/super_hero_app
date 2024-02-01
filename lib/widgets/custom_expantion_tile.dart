import 'package:flutter/material.dart';

class HeroExpantionTile extends StatelessWidget {
  final String heroInfo;
  final List<Widget> children;

  const HeroExpantionTile({
    required this.heroInfo,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[400],
      child: ExpansionTile(
        trailing: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        title: Text(
          heroInfo,
          style: const TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        children: children,
      ),
    );
  }
}
