import 'package:flutter/material.dart';
import 'package:self_introduction/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List chatPersons = ['Raja', 'Ganapathy', 'Random'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'Whatsapp',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          bottom: tabContents(),
        ),
        body: TabBarView(
          children: [
            //community tab
            communityTabContent(),
            //chattab
            Container(
              child: ListView.builder(
                itemCount: chatPersons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/prfile.jpg'),
                    ),
                    title: Text(chatPersons[index]),
                    subtitle: Text('Chat message'),
                  );
                },
              ),
            ),
            //updateTab
            updateTabContent(),
            //callstab
            callsTabContent(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          child: Icon(
            Icons.message_outlined,
            color: Colors.white,
            size: 29,
          ),
        ),
      ),
    );
  }

  tabContents() {
    return TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.groups),
        ),
        Tab(
          text: 'Chats',
        ),
        Tab(text: 'Updates'),
        Tab(text: 'Calls')
      ],
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorColor: Colors.white,
      indicatorPadding: EdgeInsets.all(3),
      indicatorWeight: 5,
    );
  }

  communityTabContent() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
            'Stay Connected with a Community',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Communities bring members together in topic-based groups and make it easy to get admin announcements.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.all(51),
            child: Card(
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              color: Colors.teal,
              child: ListTile(
                title: Text(
                  'Start Your Community',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  updateTabContent() {
    return Container(
      child: Center(
        child: Text(
          'Updates Content',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  callsTabContent() {
    return Container(
      child: Center(
        child: Text(
          'Calls Content',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
