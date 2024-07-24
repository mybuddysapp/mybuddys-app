import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/event/event.dart';
import 'package:mybuddys/config.dart';
import 'package:mybuddys/infrastructure/utils/const.dart';

class EventsProvider extends GetConnect {
  final String url = ConfigEnvironments.getEnvironments()['url']!;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = url;
    httpClient.defaultContentType = "application/json";
    // httpClient.timeout = const Duration(seconds: 8);
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return Event.fromJson(map);
    //   if (map is List) return map.map((item) => Event.fromJson(item)).toList();
    // };
  }

  @override
  onReady() {
    super.onReady();
  }

  Future<List<Event>?> getEvents() async {
    final eventUrl = '${Consts.API_URL}/event/';
    final response = await get(eventUrl);

    if (response.hasError) {
      throw Exception(response.statusText ?? 'Error fetching events');
    }
    final res = (response.body as List).map((e) => Event.fromJson(e)).toList();
    return res;
  }

  Future<Event?> getEvent(int id) async {
    final response = await get('event/$id');
    return response.body;
  }

  Future<Response<Event>> postEvent(Event event) async =>
      post('event', event.toJson());

  Future<Response<Event>> putEvent(int id, Event event) async =>
      put('event/$id', event.toJson());

  Future<Response> deleteEvent(int id) async => delete('event/$id');
}
