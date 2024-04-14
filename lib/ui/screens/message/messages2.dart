// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
// import 'package:chat_bubbles/date_chips/date_chip.dart';
// import 'package:chat_bubbles/message_bars/message_bar.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
//
// class MessagePage extends StatefulWidget {
//   const MessagePage({super.key});
//
//   @override
//   _MessagePageState createState() => _MessagePageState();
// }
//
// class _MessagePageState extends State<MessagePage> {
//   AudioPlayer audioPlayer = new AudioPlayer();
//   Duration duration = new Duration();
//   Duration position = new Duration();
//   bool isPlaying = false;
//   bool isLoading = false;
//   bool isPause = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Messages'),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 BubbleNormalImage(
//                   id: 'id001',
//                   image: _image(),
//                   color: Colors.purpleAccent,
//                   tail: true,
//                   delivered: true,
//                 ),
//                 BubbleNormalAudio(
//                   color: Color(0xFFE8E8EE),
//                   duration: duration.inSeconds.toDouble(),
//                   position: position.inSeconds.toDouble(),
//                   isPlaying: isPlaying,
//                   isLoading: isLoading,
//                   isPause: isPause,
//                   onSeekChanged: _changeSeek,
//                   onPlayPauseButtonClick: _playAudio,
//                   sent: true,
//                 ),
//                 BubbleNormal(
//                   text: 'bubble normal with tail',
//                   isSender: false,
//                   color: Color(0xFF1B97F3),
//                   tail: true,
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 BubbleNormal(
//                   text: 'bubble normal with tail',
//                   isSender: true,
//                   color: Color(0xFFE8E8EE),
//                   tail: true,
//                   sent: true,
//                 ),
//                 DateChip(
//                   date: DateTime.now(),
//                 ),
//                 BubbleNormal(
//                   text: 'bubble normal without tail',
//                   isSender: false,
//                   color: Color(0xFF1B97F3),
//                   tail: false,
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 BubbleNormal(
//                   text: 'bubble normal without tail',
//                   color: Color(0xFFE8E8EE),
//                   tail: false,
//                   sent: true,
//                   seen: true,
//                   delivered: true,
//                 ),
//                 BubbleSpecialOne(
//                   text: 'bubble special one with tail',
//                   isSender: false,
//                   color: Color(0xFF1B97F3),
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 DateChip(
//                   date: DateTime.now(),
//                 ),
//                 BubbleSpecialOne(
//                   text: 'bubble special one with tail',
//                   color: Color(0xFFE8E8EE),
//                   seen: true,
//                 ),
//                 BubbleSpecialOne(
//                   text: 'bubble special one without tail',
//                   isSender: false,
//                   tail: false,
//                   color: Color(0xFF1B97F3),
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                   ),
//                 ),
//                 BubbleSpecialOne(
//                   text: 'bubble special one without tail',
//                   tail: false,
//                   color: Color(0xFFE8E8EE),
//                   sent: true,
//                 ),
//                 BubbleSpecialTwo(
//                   text: 'bubble special tow with tail',
//                   isSender: false,
//                   color: Color(0xFF1B97F3),
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                   ),
//                 ),
//                 DateChip(
//                   date: DateTime.now(),
//                 ),
//                 BubbleSpecialTwo(
//                   text: 'bubble special tow with tail',
//                   isSender: true,
//                   color: Color(0xFFE8E8EE),
//                   sent: true,
//                 ),
//                 BubbleSpecialTwo(
//                   text: 'bubble special tow without tail',
//                   isSender: false,
//                   tail: false,
//                   color: Color(0xFF1B97F3),
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                   ),
//                 ),
//                 BubbleSpecialTwo(
//                   text: 'bubble special tow without tail',
//                   tail: false,
//                   color: Color(0xFFE8E8EE),
//                   delivered: true,
//                 ),
//                 BubbleSpecialThree(
//                   text: 'bubble special three without tail',
//                   color: Color(0xFF1B97F3),
//                   tail: false,
//                   textStyle: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//                 BubbleSpecialThree(
//                   text: 'bubble special three with tail',
//                   color: Color(0xFF1B97F3),
//                   tail: true,
//                   textStyle: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//                 BubbleSpecialThree(
//                   text: "bubble special three without tail",
//                   color: Color(0xFFE8E8EE),
//                   tail: false,
//                   isSender: false,
//                 ),
//                 BubbleSpecialThree(
//                   text: "bubble special three with tail",
//                   color: Color(0xFFE8E8EE),
//                   tail: true,
//                   isSender: false,
//                 ),
//                 SizedBox(
//                   height: 100,
//                 )
//               ],
//             ),
//           ),
//           MessageBar(
//             onSend: (_) => print(_),
//             actions: [
//               InkWell(
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.black,
//                   size: 24,
//                 ),
//                 onTap: () {},
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 8, right: 8),
//                 child: InkWell(
//                   child: Icon(
//                     Icons.camera_alt,
//                     color: Colors.green,
//                     size: 24,
//                   ),
//                   onTap: () {},
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _image() {
//     return Container(
//       constraints: BoxConstraints(
//         minHeight: 20.0,
//         minWidth: 20.0,
//       ),
//       child: CachedNetworkImage(
//         imageUrl: 'https://i.ibb.co/JCyT1kT/Asset-1.png',
//         progressIndicatorBuilder: (context, url, downloadProgress) =>
//             CircularProgressIndicator(value: downloadProgress.progress),
//         errorWidget: (context, url, error) => const Icon(Icons.error),
//       ),
//     );
//   }
//
//   void _changeSeek(double value) {
//     setState(() {
//       audioPlayer.seek(Duration(seconds: value.toInt()));
//     });
//   }
//
//   void _playAudio() async {
//     const url =
//         'https://masstamilan.download/t/2023/Leo/320/Bloody-Sweet-MassTamilan.dev.mp3';
//     if (isPause) {
//       await audioPlayer.resume();
//       setState(() {
//         isPlaying = true;
//         isPause = false;
//       });
//     } else if (isPlaying) {
//       await audioPlayer.pause();
//       setState(() {
//         isPlaying = false;
//         isPause = true;
//       });
//     } else {
//       setState(() {
//         isLoading = true;
//       });
//       await audioPlayer.play(UrlSource(url));
//       setState(() {
//         isPlaying = true;
//       });
//     }
//
//     audioPlayer.onDurationChanged.listen((Duration d) {
//       setState(() {
//         duration = d;
//         isLoading = false;
//       });
//     });
//     audioPlayer.onPositionChanged.listen((Duration p) {
//       setState(() {
//         position = p;
//       });
//     });
//     audioPlayer.onPlayerComplete.listen((event) {
//       setState(() {
//         isPlaying = false;
//         duration = const Duration();
//         position = const Duration();
//       });
//     });
//   }
// }
