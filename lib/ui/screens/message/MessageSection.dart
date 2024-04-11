import 'package:flutter/material.dart';

class MessageSection extends StatefulWidget {
  const MessageSection({super.key});

  @override
  _MessageSectionState createState() => _MessageSectionState();
}

class _MessageSectionState extends State<MessageSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: ChatScreen(),
    );
  }
}
class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace this with your actual number of chats
        itemBuilder: (context, index) {
          // Replace this with your chat item data
          return ChatItem(
            onTap: () {
              // Handle tap on chat item, navigate to chat detail screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatDetailScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final VoidCallback onTap;

  const ChatItem({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              // Replace this with user/group avatar image
              child: Icon(Icons.person),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Chat Name', style: TextStyle(fontSize: 18)),
                Text('Last message', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Detail'),
      ),
      body: Center(
        child: Text('Chat Detail Screen'),
      ),
    );
  }
}