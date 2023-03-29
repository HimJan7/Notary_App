import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notary_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:notary_app/components/get_class.dart';

class data extends StatefulWidget {
  data({super.key, required this.mailId});
  String mailId;
  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  late Future<bool> init;
  UserController newUser = UserController();

  Future<bool> initilize() async {
    newUser.makePostRequest();

    return true;
  }

  @override
  void initState() {
    init = initilize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text('Companies List'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.008,
              ),
              Text('12 companies Found'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              SizedBox(
                height: 30,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  decoration: kRoundInputDecoration,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  children: newUser.companiesNameList,
                ),
              ),
            ],
          ),
        ));
  }
}
