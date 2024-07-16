import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

// Noteクラスを定義
class Note {
  final String text;
  final User user;
  final String userId;
  final String createDate;

  // Note class constructor
  Note({
    required this.text,
    required this.user,
    required this.userId,
    required this.createDate,
  });

  // NoteクラスからMap<String, dynamic>への変換
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'user': user.toMap(),
      'userId': userId,
      'createDate': createDate,
    };
  }

  // Map<String, dynamic>からNoteクラスへの変換
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      text: map['text'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      userId: map['userId'] as String,
      createDate: map['createDate'] as String,
    );
  }
}

// Userクラスを定義
class User {
  final String username;

  // Userクラスのコンストラクタ
  User({
    required this.username,
  });

  // UserクラスからMap<String, dynamic>への変換
  Map<String, dynamic> toMap() {
    return {
      'username': username,
    };
  }

  // Map<String, dynamic>からUserクラスへの変換
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
    );
  }
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
        Duration(minutes: -5); // -10分間のDurationオブジェクトを作成 (30分前を表す)
    DateTime sinceTime = nowtime.add(duration); // 変更した日時を取得
    int Int_nowtime = nowtime.millisecondsSinceEpoch ~/ 1000;
    int Int_sinceTime = sinceTime.millisecondsSinceEpoch ~/ 1000;
    print(Int_nowtime);
    print(Int_sinceTime);

    const url = 'https://misskey.io/api/notes/local-timeline';
    final body = jsonEncode({
      "withFiles": false,
      "withRenotes": false,
      "withReplies": false,
      "limit": 30,
      "allowPartial": true,
      "sinceDate": Int_sinceTime,
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
      print(response.headers);
      print('Timeline input successfully!');
      // response.bodyをJSON形式に変換
      final responseBody = jsonDecode(response.body) as List<dynamic>;
      // responseBody内の要素をループ
      for (final noteMap in responseBody) {
        // text、user、userIdを抽出
        final text = noteMap['text']?.toString() ?? 'なし';

        final userMap = noteMap['user'] as Map<String, dynamic>?;
        final username = userMap?['name']?.toString() ?? '名無し';

        final userId = noteMap['userId']?.toString() ?? '';
        final createDate = noteMap['createdAt']?.toString() ?? '';

        // 抽出した情報を元にNoteオブジェクトを作成
        final note = Note(
          text: text,
          user: User(username: username),
          userId: userId,
          createDate: createDate,
        );

        // 作成したNoteオブジェクトをnotes配列に追加
        notes.add(note);
      }
      // notes配列の内容を出力
      print(notes);
      setState(() {
        notes;
      });
    } else {
      // Error creating note
      print('Error Timeline: ${response.statusCode}');
    }
  }

  Future<void> _postNote() async {
    const url = 'https://misskey.io/api/notes/create';
    final body = jsonEncode({
      'text': '$newNoteText',
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
      print(response);
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
            obscureText: true, // アクセストークンを非表示にする
            onChanged: (text) {
              setState(() {
                accessToken = text;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              notes = [];
              _fetchNotes();
            },
            child: Text('タイムラインを取得'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.user.username),
                  subtitle: Text(note.text + '\n' + note.createDate),
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
