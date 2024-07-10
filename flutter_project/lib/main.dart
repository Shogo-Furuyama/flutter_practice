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
    final response = await http.post(
      Uri.parse('https://misskey.io/api/notes/hybrid-timeline'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    print(response);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        notes = json.map((note) => Note.fromJson(note)).toList();
      });
    } else {
      // エラー処理
      print('Failed to fetch notes: ${response.statusCode}');
    }
  }

  Future<void> _postNote() async {
    final response = await http.post(
      Uri.parse('https://misskey.io/api/notes'),
      headers: {'Authorization': 'Bearer $accessToken'},
      body: jsonEncode({'text': newNoteText}),
    );

    if (response.statusCode == 200) {
      // 投稿成功処理
      setState(() {
        newNoteText = '';
        notes.insert(0, Note.fromJson(jsonDecode(response.body)));
      });
    } else {
      // エラー処理
      print('Failed to post note: ${response.statusCode}');
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
