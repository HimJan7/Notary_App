import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'list_view.dart';

class UserController extends GetxController {
  String emailId = '';
  final box = GetStorage();
  final String listKey = 'companiesListKey';
  final String userKey = 'emailId';
  List<String> companiesNameList = [];

  Future<void> makePostRequest() async {
    Dio dio = Dio();
    Map<String, dynamic> data = {
      'email': emailId,
    };

    try {
      String? storedString = box.read(emailId);
      String temp = emailId + 'KEY';
      if (storedString == temp) {
        List<String>? storedList = box.read(temp)?.cast<String>();
        for (var company in storedList!) {
          companiesNameList.add(company);
        }
        print('From Storage');
        print(storedList);
      } else {
        print('NEW');
        final response = await dio.post(
            'https://notaryapp-staging.herokuapp.com/customer/login',
            data: data);

        List<dynamic> companiesList = response.data['data']['companiesList'];

        for (var company in companiesList) {
          companiesNameList.add(company['name']);
        }
        String userList = emailId + 'KEY';
        box.write(emailId, userList);
        box.write(userList, companiesNameList);
        print('DONE');
      }
    } catch (e) {
      print('ERROR');
      print(e);
    }
  }
}
