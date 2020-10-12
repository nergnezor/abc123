import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

const List<String> iconNames = <String>[
  // 'assets/svg/animals/Bear.svg',
  'assets/svg/animals/GreenSnake.svg',
  'assets/svg/animals/Pelican.svg',
  'assets/svg/animals/GreenSnake.svg',

  //'assets/svg/animals/Bear.svg',
];

class SVGs {
  static final List<Widget> painters = <Widget>[];

  SVGs() {
    for (int i = 0; i < iconNames.length; i++) {
      painters.add(
        Directionality(
          textDirection: TextDirection.ltr,
          child: SvgPicture.asset(
            iconNames[i],
            //color: Colors.blueGrey[(i + 1) * 100],
            matchTextDirection: true,
          ),
        ),
      );
    }
  }
}
