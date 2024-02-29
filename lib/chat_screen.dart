import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [
    "Hello?",
    "Hai",
  ];

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        iconTheme: IconThemeData(color: Colors.white),
        title: titleContent(),
        actions: [
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Colors.white,
              size: 29,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.call,
              color: Colors.white,
              size: 29,
            ),
            onPressed: () {},
          ),
          popUpMenuItems(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                String message = messages[index];
                // For simplicity, assume alternating sender and receiver
                bool isSender = index % 2 == 0;
                return MessageBubble(message: message, isSender: isSender);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            // color: Colors.red
                            ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.emoji_emotions_outlined)),
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a message...",
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.attach_file_sharp),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.currency_rupee),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = textEditingController.text;
                    if (message.isNotEmpty) {
                      sendMessage(message);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sendMessage(String message) {
    setState(() {
      messages.add(message);
      // Simulate received message
      messages.add("That's good to hear!");
    });
    textEditingController.clear();
  }
}

Widget popUpMenuItems() {
  return PopupMenuButton<String>(
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: 'View Contact',
        child: Text('View Contact'),
      ),
      PopupMenuItem<String>(
        value: 'Media, links, and docs',
        child: Text('Media, links, and docs'),
      ),
      PopupMenuItem<String>(
        value: 'Search',
        child: Text('Search'),
      ),
      PopupMenuItem<String>(
        value: 'Mute notifications',
        child: Text('Mute notifications'),
      ),
      PopupMenuItem<String>(
        value: 'Wallpaper',
        child: Text('Wallpaper'),
      ),
    ],
    onSelected: (String value) {},
  );
}

Widget titleContent() {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('assets/prfile.jpg'),
      ),
      SizedBox(width: 15),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            "Online",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    ],
  );
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isSender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message,
          style: TextStyle(color: isSender ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
