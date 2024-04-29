import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';

class ActivityProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
}
