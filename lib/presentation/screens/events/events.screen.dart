import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/presentation/components/my_sliver_app_bar.dart';
import 'package:mybuddys/presentation/screens/events/widgets/event_grid_tile.dart';
import 'package:mybuddys/presentation/screens/events/widgets/event_list_tile.dart';

import 'controllers/events.controller.dart';

class EventsScreen extends GetView<EventsController> {
  EventsScreen({super.key}) {
    Get.lazyPut(() => EventsController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchEvents();
        },
        child: CustomScrollView(
          slivers: [
            MySliverAppBar(
              title: 'Events',
              avatarIcon: Icons.sports_soccer,
              rightIconWidget: IconButton(
                icon: const Icon(
                  Icons.view_list,
                ),
                onPressed: () {
                  controller.toggleListView();
                },
              ),
            ),
            // Obx(
            //   () {
            //     if (controller.state == null) {
            //       return const SliverFillRemaining(
            //         child: Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //       );
            //     }
            //
            //     if (controller.state!.isEmpty) {
            //       return const SliverFillRemaining(
            //         child: Center(
            //           child: Text('No events found'),
            //         ),
            //       );
            //     }
            //
            //     //onLoading
            //     if (controller.status.isLoading) {
            //       return const SliverFillRemaining(
            //         child: Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //       );
            //     }
            //
            //     if (controller.isListView.isTrue) {
            //       return _buildSliverList();
            //     } else {
            //       return _buildSliverGrid();
            //     }
            //   },
            // ),
            controller.obx(
              (state) {
                if (state != null) {
                  return Obx(
                    () => controller.isListView.isTrue
                        ? _buildSliverList()
                        : _buildSliverGrid(),
                  );
                } else {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text("No events found"),
                    ),
                  );
                }
              },
              onLoading: const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              onError: (error) => SliverFillRemaining(
                child: Center(
                  child: Text(error.toString()),
                ),
              ),
              onEmpty: const SliverFillRemaining(
                child: Center(
                  child: Text("No events found"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final event = controller.state![index];
          return EventListTile(
            event: event,
            onTap: () => controller.onEventTap(event),
          );
        },
        childCount: controller.state?.length ?? 0,
      ),
    );
  }

  Widget _buildSliverGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final event = controller.state![index];
          return EventListTile(
            event: event,
            onTap: () => controller.onEventTap(event),
          );
        },
        childCount: controller.state?.length ?? 0,
      ),
    );
  }

  SliverChildDelegate _buildSliverListDelegate() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        final event = controller.state![index];
        return EventGridTile(
          event: event,
          onTap: () => controller.onEventTap(event),
        );
      },
      childCount: controller.state?.length ?? 0,
    );
  }
}
