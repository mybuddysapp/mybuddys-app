import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/event/event.dart';
import 'package:mybuddys/app/data/providers/events_provider.dart';

class EventsController extends GetxController with StateMixin<List<Event>> {
  //TODO: Implement EventController
  EventsProvider _eventProvider = EventsProvider();
  final isListView = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchEvents();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchEvents() async {
    change([], status: RxStatus.loading());
    try {
      final events = await _eventProvider.getEvents();
      // final List<Event> events = [];
      change(events, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  onEventTap(Event data) {
    //TODO: Implement onEventTap
  }

  void toggleListView() {
    isListView.toggle();
  }
}
