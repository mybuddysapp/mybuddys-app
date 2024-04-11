import 'package:dio/dio.dart';
import 'package:mybuddys/utils/consts.dart';

const apiUrls = {
  "events": "$API_URL/event",
  "players": "$API_URL/player",
  "activities": "$API_URL/activity",
  "teams": "$API_URL/team",
};

Future<List> getResponseListData(Dio dio, String path) async {
  // debugPrint("#####################()"+apiUrls[path]!);
  final response = await dio.get(apiUrls[path] ?? '$API_URL/$path');
  // final response = await dio.get('http://192.168.1.202:8080/api/v1/$path');
  if (response.statusCode == 200) {
    // debugPrint("#####################($response)");
    return response.data;
  } else {
    return List.empty();
  }
}

Future<Object> getResponseOneData(Dio dio, String path) async {
  // debugPrint("#####################()"+apiUrls[path]!);
  final response = await dio.get(apiUrls[path] ?? '$API_URL/$path');
  // final response = await dio.get('http://192.168.1.202:8080/api/v1/$path');
  if (response.statusCode == 200) {
    // debugPrint("#####################($response)");
    return response.data;
  } else {
    return <String, dynamic>{};
  }
}
