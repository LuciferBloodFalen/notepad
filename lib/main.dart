import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotepadScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotepadScreen extends StatefulWidget {
  const NotepadScreen({super.key});

  @override
  State<NotepadScreen> createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearNote() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '📝 Notepad',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 1.5,
            color: Colors.deepPurple,
            fontFamily: 'Courier', // You can change to any available font
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Clear',
            onPressed: _clearNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          expands: true,
          textAlignVertical:
              TextAlignVertical.top, // Ensures input starts at the top
          textAlign: TextAlign.start, // Ensures input starts at the left
          decoration: const InputDecoration(
            hintText: 'Start typing your notes...',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
