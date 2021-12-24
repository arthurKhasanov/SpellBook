import 'package:flutter/material.dart';

class SpellDescRow extends StatelessWidget {
  final String rowName;
  final String rowDesc;
  const SpellDescRow({
    Key? key,
    required this.rowName,
    required this.rowDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RichText(
          text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '${rowName} ',
            style: const TextStyle(
                color: Colors.black87,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          TextSpan(
            text: rowDesc.contains('[') ? fixString(rowDesc) : rowDesc,
            style: const TextStyle(
                color: Colors.black87, fontFamily: 'Montserrat', fontSize: 15),
          ),
        ],
      ))
    ]);
  }

  String fixString(String rowDesc) {
    final result = rowDesc.substring(1, rowDesc.length - 1);
    

    return result;
  }
}

            
          





/* 
String fixString(String rowDesc) {
    final result = rowDesc.substring(1, rowDesc.length - 1);
    ;

    return result;
  }
  */