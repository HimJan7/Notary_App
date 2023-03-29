import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class companiesListWidget extends StatelessWidget {
  companiesListWidget({super.key, required this.companyName});
  String companyName;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              companyName,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ));
  }
}
