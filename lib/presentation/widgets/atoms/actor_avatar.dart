import 'dart:math';
import 'package:flutter/material.dart';

class ActorAvatar extends StatelessWidget {
  final String actorName;
  final _random = Random();

  Color get getRandomColor {
    return Color.fromARGB(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(230 - 200),
    );
  }

  ActorAvatar({
    Key? key,
    required this.actorName,
  }) : super(key: key);

  String get getInitialName {
    return actorName.isNotEmpty
        ? actorName.trim().split(' ').map((l) => l[0]).take(2).join()
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24),
              color: getRandomColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              getInitialName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            actorName,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
