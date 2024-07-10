import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Misskey Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String accessToken = '';
  List<Note> notes = [];
  String newNoteText = '';

  Future<void> _fetchNotes() async {
    DateTime nowtime = DateTime.now();
    Duration duration =
        Duration(minutes: -30); // -30分間のDurationオブジェクトを作成 (30分前を表す)
    DateTime sinceTime = nowtime.add(duration); // 変更した日時を取得
    int Int_nowtime = nowtime.millisecondsSinceEpoch ~/ 1000;
    int Int_sinceTime = sinceTime.millisecondsSinceEpoch ~/ 1000;
    print(Int_nowtime);
    print(Int_sinceTime);

    const url = 'https://misskey.io/api/notes/create';
    final body = jsonEncode({
      'text': 'Hello Misskey API World with My Application!',
    });
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // Note created successfully
      print('Note created successfully!');
    } else {
      // Error creating note
      print('Error creating note: ${response.statusCode}');
    }
  }

  Future<void> _postNote() async {
    const url = 'https://misskey.io/api/notes/create';
    final body = jsonEncode({
      'text': 'APIクライアントてすと',
    });
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // Note created successfully
      print('Note created successfully!');
    } else if (response.statusCode == 401) {
      // Authentication error
      final errorJson = jsonDecode(response.body) as Map<String, dynamic>;
      final errorCode = errorJson['error']['code'];

      if (errorCode == 'CREDENTIAL_REQUIRED') {
        // Handle credential required error
        print('Credential required error!');
      } else {
        // Handle other authentication errors
        print('Authentication error: $errorCode');
      }
    } else {
      // Other errors
      print('Error creating note: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Misskey Client'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'アクセストークン：'),
            onChanged: (text) {
              setState(() {
                accessToken = text;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              _fetchNotes();
            },
            child: Text('タイムラインを取得'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length <= 10 ? notes.length : 10, // 最新10件のみ表示
              itemBuilder: (context, index) {
                final note = notes[index]; // 最新のノートから順に取得
                return ListTile(
                  title: Text(note.user.username),
                  subtitle: Text(note.text),
                );
              },
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: '新しい投稿'),
            onChanged: (text) {
              setState(() {
                newNoteText = text;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              _postNote();
            },
            child: Text('投稿'),
          ),
        ],
      ),
    );
  }
}

class Note {
  final User user;
  final String text;

  Note.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json['user']),
        text = json['text'];
}

class User {
  final String username;

  User.fromJson(Map<String, dynamic> json) : username = json['username'];
}
