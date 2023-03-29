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
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlueAccent),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyName,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
