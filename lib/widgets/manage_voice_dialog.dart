import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';


class ManageVoiceDialog extends StatefulWidget {
  const ManageVoiceDialog({super.key});

  @override
  State<ManageVoiceDialog> createState() => _ManageVoiceDialogState();
}

class _ManageVoiceDialogState extends State<ManageVoiceDialog> {

  final FlutterTts flutterTts = FlutterTts();
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 1.0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
      title: const Text('Story Book'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Volume: $volume'),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0.0', textAlign: TextAlign.start),
                Text('1.0', textAlign: TextAlign.start),
              ],
            ),
          ),
          Slider(
            value: volume,
            min: 0.0,
            max: 1.0,
            onChanged: (newValue) {
              setState(() {
                volume = newValue;
                flutterTts.setVolume(volume);
              });
            },
          ),
          Text('Pitch: $pitch'),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0.5', textAlign: TextAlign.start),
                Text('2.0', textAlign: TextAlign.start),
              ],
            ),
          ),
          Slider(
            value: pitch,
            min: 0.5,
            max: 2.0,
            onChanged: (newValue) {
              setState(() {
                pitch = newValue;
                flutterTts.setPitch(pitch);
              });
            },
          ),
          Text('Rate: $rate'),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0.5', textAlign: TextAlign.start),
                Text('2.0', textAlign: TextAlign.start),
              ],
            ),
          ),
          Slider(
            value: rate,
            min: 0.5,
            max: 2.0,
            onChanged: (newValue) {
              setState(() {
                rate = newValue;
                flutterTts.setSpeechRate(rate);
              });
            },
          ),
        ],
      ),
     );
  }
}
