import 'package:flutter/material.dart';

class HeroTile extends StatelessWidget {
  final String title;
  final String subtitle;
  Widget? icon;
  HeroTile({
    required this.title,
    required this.subtitle,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[300],
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        trailing: icon,
      ),
    );
  }
}
