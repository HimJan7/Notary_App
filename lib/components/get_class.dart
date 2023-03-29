import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'list_view.dart';

class UserController extends GetxController {
  RxString message = ''.obs;

  List<String> companiesNameList = [];
  // final box = GetStorage();
  Future<void> makePostRequest() async {
    Dio dio = Dio();
    Map<String, dynamic> data = {
      'email': 'demo@thenotary.app',
    };

    try {
      final response = await dio.post(
          'https://notaryapp-staging.herokuapp.com/customer/login',
          data: data);

      List<dynamic> companiesList = response.data['data']['companiesList'];

      for (var company in companiesList) {
        companiesNameList.add(company['name']);
        print(company['name']);
      }
    } catch (e) {
      print(e);
    }
  }
}
