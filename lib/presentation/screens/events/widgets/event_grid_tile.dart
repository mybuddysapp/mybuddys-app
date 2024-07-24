import 'package:flutter/material.dart';
import 'package:mybuddys/app/data/models/event/event.dart';

class EventGridTile extends StatelessWidget{
  final Event event;
  final Function onTap;

  const EventGridTile({
    required this.event,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: ListTile(
        title: Text(
          event.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${event.address.city}, ${event.address.country}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          //   Text(
          //     event.datetime.toString(),
          //     style: const TextStyle(
          //       fontSize: 16,
          //     ),
          //   ),
          ],
        ),
      ),
    );
  }
}
