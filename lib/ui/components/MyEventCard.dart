import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mybuddys/algo/model/event/event.dart';
import 'package:mybuddys/algo/routes/route_config.dart';



class MyEventCard extends StatelessWidget {
  final Event event;

  const MyEventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          event.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 4),
            Text(event.location),
            // SizedBox(height: 4),
            Text('Activity: ${event.activity.name}'),
          ],
        ),
        // get the event photo from event.picture or use a default image as leading
        leading: SizedBox(
          // width: 60,
          // height: 60,
          child: event.picture != null
              ? Image.network(
                  event.picture!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.event),
        ),

        // the trailing should be the date of the event
        // trailing: MyDateWidget(
        //   datatime: event.datetime,
        // ),

        onTap: () {
          context.pushNamed(
            APP.event.toName,
            extra: event,
          );
        },
      ),
    );
  }
}

class MyDateWidget extends StatelessWidget {
  final DateTime datatime;

  const MyDateWidget({
    super.key,
    required this.datatime,
  });

  @override
  Widget build(BuildContext context) {
    // display the  month and day of the event and the time of the event in vertical order
    return Column(
      children: [
        Text(
          datatime.month.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          datatime.day.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${datatime.hour}:${datatime.minute}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
