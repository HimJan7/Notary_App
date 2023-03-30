import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class companiesListWidget extends StatelessWidget {
  companiesListWidget({super.key, required this.companyName});
  String companyName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.007,
      ),
      height: MediaQuery.of(context).size.height * 0.07,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.005,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF2196f3)),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyName,
            style: TextStyle(fontSize: 15, color: Color(0xFF424242)),
          ),
        ],
      ),
    );
  }
}
