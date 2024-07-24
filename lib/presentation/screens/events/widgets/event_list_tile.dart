import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mybuddys/app/data/models/event/event.dart';


class EventListTile extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const EventListTile({
    Key? key,
    required this.event,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            const SizedBox(height: 8.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: event.picture != null
                  ? Image.network(event.picture!)
                  // : Image.asset('assets/images/placeholder.png'),
                  : Icon(Icons.image),
            ),
            const SizedBox(height: 8.0),
            Text(
              event.description ?? 'No description available',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: event.activity.name.isEmpty
                  ? Icon(FontAwesome.football_solid)
                  : Text(event.activity.name[0]),
            ),
            const SizedBox(width: 8.0),
            Text(
              event.activity.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Icon(Icons.access_time, size: 16.0),
        const SizedBox(width: 4.0),
        Text(
          '${event.datetime.hour}:${event.datetime.minute.toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 16.0),
        Icon(Icons.location_on, size: 16.0),
        const SizedBox(width: 4.0),
        TextButton(
          style: const ButtonStyle(
              // backgroundColor: MaterialColor(Colors.amber,Co),
              ),
          onPressed: () {},
          child: Text(
            event.address.city, // Assuming address has a city field
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Spacer(),
        Icon(Icons.favorite_border),
      ],
    );
  }

  Widget _buildPhoto(BuildContext context) {
    return Container();
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      event.description ?? '',
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        Badge(icon: Icons.location_on, text: event.address.city, color: Colors.blue.shade100),
        SizedBox(width: 8.0),
        Badge(icon: Icons.timelapse, text: '4', color: Colors.pink.shade100),
        ...event.players.take(4).map((playerId) => Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://example.com/player/$playerId/avatar', // Update with actual player avatar URL
                ),
              ),
            )),
        if (event.players.length > 4)
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CircleAvatar(
              child: Text('+${event.players.length - 4}'),
            ),
          ),
        const Spacer(),
        Text(
          'Created by ${event.creator.pseudonym}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: 8.0),
        CircleAvatar(
          backgroundImage: event.creator.avatar != null
              ? NetworkImage(event.creator.avatar!)
              : null,
          child: event.creator.avatar == null ? Icon(Icons.person) : null,
        ),
      ],
    );
  }
}

class Badge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  Badge({required this.icon, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: color ?? Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16.0,
            color: Colors.white,
          ),
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mybuddys/app/data/models/event/event.dart';
//
// class EventListTile extends StatelessWidget {
//   final Event event;
//   final VoidCallback onTap;
//
//   EventListTile({required this.event, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildHeader(context),
//             SizedBox(height: 8.0),
//             _buildImage(context),
//             SizedBox(height: 8.0),
//             _buildDescription(context),
//             SizedBox(height: 8.0),
//             _buildFooter(context),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(BuildContext context) {
//     return Row(
//       children: [
//         CircleAvatar(
//           backgroundImage: event.creator.avatar?.isNotEmpty == true
//               ? NetworkImage(event.creator.avatar!)
//               : null,
//           child: event.creator.avatar?.isNotEmpty != true
//               ? Icon(Icons.person)
//               : null,
//         ),
//         SizedBox(width: 8.0),
//         Text(
//           event.creator.pseudonym,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         Spacer(),
//         IconButton(
//           icon: Icon(Icons.favorite_border),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: Icon(Icons.help_outline),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
//
//   Widget _buildImage(BuildContext context) {
//     return Column(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12.0),
//           child: Image.network(
//             event.picture ?? 'default_url',
//             fit: BoxFit.cover,
//             height: 150,
//             width: double.infinity,
//           ),
//         ),
//         Row(
//           children: [
//             Icon(Icons.calendar_today, size: 16.0),
//             SizedBox(width: 4.0),
//             Text(
//               '${event.created_at}',
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             SizedBox(width: 8.0),
//             Icon(Icons.location_on, size: 16.0),
//             SizedBox(width: 4.0),
//             Text(
//               event.address.toString(),
//               // Assuming address has a fullAddress field
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDescription(BuildContext context) {
//     return Text(
//       event.description ?? '',
//       style: Theme.of(context).textTheme.bodyMedium,
//     );
//   }
//
//   Widget _buildFooter(BuildContext context) {
//     return Row(
//       children: [
//         TextButton(
//           onPressed: () {},
//           style: TextButton.styleFrom(
//             backgroundColor: Colors.pink.shade100,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//           ),
//           child: Text('Escucha', style: TextStyle(color: Colors.black)),
//         ),
//         SizedBox(width: 8.0),
//         TextButton(
//           onPressed: () {},
//           style: TextButton.styleFrom(
//             backgroundColor: Colors.pink.shade100,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//           ),
//           child: Text('Ahorrar', style: TextStyle(color: Colors.black)),
//         ),
//         Spacer(),
//         IconButton(
//           icon: Icon(Icons.phone),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: Icon(Icons.message),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }
