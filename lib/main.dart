import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Заметки',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(32, 26, 212, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Заметки'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _notes = [];

  void _addNote() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Новая заметка'),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Введите заметку здесь'),
          onSubmitted: (String value) {
            setState((){
              _notes.add(value);
              Navigator.pop(context);
            });
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Отмена'),
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }
  void _removeNote(int index) {
    setState((){
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_notes[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeNote(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Добавить заметку',
        child: const Icon(Icons.add)
      ),
    );
  }
}
