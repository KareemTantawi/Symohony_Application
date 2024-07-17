import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextScreen extends StatefulWidget {
  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "I'm listening...";
  bool _speechInitialized = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                _text,
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _listen,
              child: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_speechInitialized) {
      _speechInitialized = await _speech.initialize(
        onStatus: (val) {
          print('onStatus: $val');
          if (val == 'done') {
            setState(() => _isListening = false);
            _speech.stop();
          }
        },
        onError: (val) {
          print('onError: $val');
          setState(() => _isListening = false);
        },
      );
    }

    if (_speechInitialized) {
      if (!_isListening) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text += ' ${val.recognizedWords}';
          }),
          // ignore: deprecated_member_use
          listenMode: stt.ListenMode.deviceDefault,
          // ignore: deprecated_member_use
          partialResults: true,
        );
      } else {
        setState(() => _isListening = false);
        _speech.stop();
      }
    }
  }
}
