import 'package:flutter/material.dart';

class CaruselTitle extends StatelessWidget {
  final String level;
  const CaruselTitle({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, top: 8, bottom: 8),
      child: Text(
        level,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
