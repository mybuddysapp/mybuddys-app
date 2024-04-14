import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
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
            SizedBox(height: 4),
            Text(event.address.city),
            SizedBox(height: 4),
            Text('Activity: ${event.activity.name}'),
          ],
        ),
        // get the event photo from event.picture or use a default image as leading
        trailing: SizedBox(
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
        leading: MyDateWidget(
          datetime: event.datetime,
        ),

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
  final DateTime datetime;

  const MyDateWidget({
    Key? key,
    required this.datetime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      width: 100, // Adjust the width as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              DateFormat('EEEE').format(datetime).characters.take(3).join(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('dd').format(datetime),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                DateFormat('hh:mm').format(datetime),
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
