import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const ListenAudio());
}

class ListenAudio extends StatelessWidget {
  const ListenAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: const Listenerhomepage(),
    );
  }
}

class Listenerhomepage extends StatefulWidget {
  const Listenerhomepage({super.key});

  @override
  State<Listenerhomepage> createState() => _ListenerhomepageState();
}

class _ListenerhomepageState extends State<Listenerhomepage> {
  FilePickerResult? result; //variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio listener'),
        //backgroundColor: Colors.blueAccent,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://static.vecteezy.com/system/resources/previews/023/986/631/original/whatsapp-logo-whatsapp-logo-transparent-whatsapp-icon-transparent-free-free-png.png',
              height: 300,
            ),
            const Text('Scegli un vocale'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: playAudio,
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 100,
                ),
                ElevatedButton(
                  onPressed: playbackRate,
                  child: const Text('x1'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickfile,
        child: const Icon(Icons.audio_file),
      ),
    );
  }

  void pickfile() async {
    result = await FilePicker.platform.pickFiles();
  }

  void playAudio() {}

  void playbackRate() {}
}