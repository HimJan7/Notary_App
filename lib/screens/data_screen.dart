import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notary_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:notary_app/components/get_class.dart';
import 'package:provider/provider.dart';

import '../Models/SearchModel.dart';
import '../components/list_view.dart';

CurrentList firstInstance = CurrentList();

class data extends StatefulWidget {
  data({super.key, required this.mailId});
  String mailId;
  @override
  State<data> createState() => _dataState();
}

//demo@thenotary.app
class _dataState extends State<data> {
  late Future<bool> init;

  UserController newUser = UserController();

  List<String> updateList(String searchQuery, List<String> stringList) {
    List<String> matchedStrings = [];
    for (String string in stringList) {
      if (string.toLowerCase().contains(searchQuery.toLowerCase())) {
        matchedStrings.add(string);
      }
    }
    return matchedStrings;
  }

  UpdatingFunction(value) {
    if (value == "") {
      firstInstance.assign(newUser.companiesNameList);
    } else {
      firstInstance.assign(updateList(value, newUser.companiesNameList));
    }
  }

  Future<bool> initilize() async {
    newUser.emailId = widget.mailId;
    await newUser.makePostRequest();

    firstInstance.assign(newUser.companiesNameList);

    return true;
  }

  @override
  void initState() {
    init = initilize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: firstInstance,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Consumer<CurrentList>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text('Companies List'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Text('${value.ItemList.length} companies Found'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    SizedBox(
                      height: 30,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) async {
                          await UpdatingFunction(value);
                        },
                        decoration: kRoundInputDecoration,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: value.ItemList.length,
                          itemBuilder: (context, index) {
                            return companiesListWidget(
                              companyName: value.ItemList[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
