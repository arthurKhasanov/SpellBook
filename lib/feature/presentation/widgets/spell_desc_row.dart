import 'package:flutter/material.dart';

class SpellDescRow extends StatelessWidget {
  final String rowName;
  final String rowDesc;
  const SpellDescRow({Key? key, required this.rowName, required this.rowDesc,r})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              rowName,
              style:const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                rowDesc,
                style:const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 12),
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ],
        )
      ],
    );
  }
}
