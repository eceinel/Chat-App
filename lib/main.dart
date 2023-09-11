import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:hive/hive.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(
          title: const Text(
            'Conversations',
            style: TextStyle(color: Color.fromRGBO(120, 120, 120, 1)),
            ),
          backgroundColor: Colors.white,

        ),
        
        body: Column(
          children: [
            const SearchBar(),
            Expanded(
              child: ListView(
                children: const [
                  ChatCard(),
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
      ),

      margin: const EdgeInsets.fromLTRB(8.0,16.0,8.0,16.0),

      child: const SizedBox(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search in Conversations',
            prefixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MessagePage()),
          );
       },
          child: Container(

          decoration: BoxDecoration(
            border: Border.all(
            width: 1,
            ),
            ),

          margin: const EdgeInsets.fromLTRB(8.0,1.0,8.0,1.0),

          child: Row(

            children: [
              CircleAvatar(
                backgroundColor: Colors.amber,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(faker.person.name()),
                  Text(faker.lorem.sentence()),
                ],
              ),

              Expanded(child: SizedBox(),),

              Text(faker.date.time()),
            ],
          ),
        ),
    );
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(

          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },

            child: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),

          title:  
            const Row(
              children: [

                CircleAvatar(
                  backgroundColor: Colors.amber,
                ),

                Text('',
                  style: TextStyle(color: Color.fromRGBO(120, 120, 120, 1)),
                ),

              ],
            ),

          backgroundColor: Colors.white,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView(
                reverse: true,
                children: const [
                  Placeholder(),
                  Placeholder(),
                ],
              ),
            ),
            const MessageInputArea(),
          ],
        ),
      ),
    );
  }
}


class MessageInputArea extends StatelessWidget {
  const MessageInputArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
      ),

      margin: const EdgeInsets.fromLTRB(8.0,16.0,8.0,16.0),

      child: SizedBox(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Message',
            suffixIcon: IconButton(
              onPressed: () => {
                const Placeholder(),
              },
              icon: const Icon(Icons.send),
            ),
          ),
        ),
      ),
    );
  }
}

