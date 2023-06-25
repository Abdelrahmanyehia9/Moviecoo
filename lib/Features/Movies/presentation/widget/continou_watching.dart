import 'package:flutter/material.dart';
import 'package:moviecoo/core/utils/dim.dart';

import '../../../../constants.dart';

class ContinuoWatching extends StatelessWidget {
  const ContinuoWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              'assets/images/venom.jpg',
              height: dimHeight(context) * 0.32,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Positioned(
            right: 16,
            bottom: 16,
            child: CircleAvatar(
              backgroundColor: secondColor.withOpacity(0.5),
              radius: 24,
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ))
      ],
    ) ;
    ;
  }
}
