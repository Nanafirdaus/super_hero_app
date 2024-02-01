import 'package:flutter/material.dart';
import 'package:super_hero_app/utils/extension.dart';

// ignore: must_be_immutable
class PowerStatsWidget extends StatelessWidget {
  String title;
  int value;
  PowerStatsWidget({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .3,
      height: context.screenHeight * .15,
      decoration: BoxDecoration(
        color: Colors.brown[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(129, 129, 129, 0.25),
          ),
        ],
      ),
      margin: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: context.screenWidth * .14,
                height: context.screenWidth * .14,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(
                    Colors.brown[700],
                  ),
                  value: value / 100.toDouble(),
                ),
              ),
              Text(
                '$value%',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
