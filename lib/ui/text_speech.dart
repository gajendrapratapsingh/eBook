import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class TextToSpeechScreen extends StatefulWidget {
  const TextToSpeechScreen({super.key});

  @override
  _TextToSpeechScreenState createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  final FlutterTts flutterTts = FlutterTts();
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 0.5;
  String textToSpeak = "अमृत राय (सन् 1921 ई.-सन् 1996 ई.) का जन्म वाराणसी, उत्तर प्रदेश में हुआ । वह उपन्यासकार, निबन्धकार, समीक्षक, व्यंग्यकार और अनुवादक थे। अमृत राय प्रेमचंद के छोटे बेटे हैं। पिता की तरह मूलतः कहानीकार व उपन्यासकार थे । श्रेष्ठ अनुवादक व जीवनीकार के रूप में भी ख्याति । प्रेमचंद की जीवनी 'कलम का सिपाही' के लिए साहित्य अकादमी पुरस्कार से सम्मानित हुए । नाट्य-लेखन में भी सक्रिय रहे। अंग्रेजी, बंगला और हिन्दी पर समान अधिकार था । अमृतराय जी का विवाह सुभद्रा कुमारी चौहान जी की बेटी सुधा चौहान से हुआ था। सुधा ने सुभद्रा कुमारी चौहान तथा अपने पिता लक्षमण सिंह जी की संयुक्त जीवनी लिखी - 'मिला तेज से तेज'। प्रेमचंद की बिखरी रचनाओं के संपादन के अतिरिक्त आपने 'हंस' का संपादन अपने ही अंदाज़ में किया। कृतियाँ : 'साहित्य में संयुक्त मोर्चा', 'सुबह का रंग', 'लाल धरती', 'नई समीक्षा', 'नागफनी का देश', 'हाथी के दांत', 'अग्निशिखा', 'फांसी के तख्ते से', 'कस्बे का एक दिन', 'गीली मिट्टी', 'कठघरे', 'जंगले', 'सहचिंतन', 'भटियाली', 'आधुनिक भावबोध की संज्ञा', 'बतरस', 'चतुरंग', 'सारंग' और 'धुआं'। 'प्रेमचन्द', 'कलम का सिपाही' (जीवनी), 'बीज' (उपन्यास), 'तिरंगा कफ़न' (कहानी-संग्रह)। अनुवाद : 'स्पार्टाकस' का अनुवाद 'आदिविद्रोही', 'हैमलेट' का अनुवाद 'समरगाथा'।";
  double duration = 0.0;
  double position = 0.0;

  late Timer _timer;
  int _seconds = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, (Timer timer) {
        setState(() {
           _seconds++;
        });
      },
    );
  }

  String _formatDuration(Duration duration) {
    String hours = (duration.inHours % 60).toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    flutterTts.setStartHandler(() {
      print("Playing");
      startTimer();
    });
    flutterTts.setCompletionHandler(() {
      print("Complete");
      _timer.cancel();
    });
    flutterTts.setErrorHandler((msg) {
      print("Error: $msg");
    });
    flutterTts.setContinueHandler(() {
      print("TTS continued");
      // Perform actions or provide additional content when TTS continues
    });
    flutterTts.setProgressHandler((text, start, end, word) {
      // Duration startTime = Duration(milliseconds: start);
      //
      // // Extract hours, minutes, and seconds from start time duration
      // int startHours = startTime.inHours;
      // int startMinutes = startTime.inMinutes.remainder(60);
      // int startSeconds = startTime.inSeconds.remainder(60);
      //
      // // Format start time
      // String formattedStartTime = '$startHours:${startMinutes.toString().padLeft(2, '0')}:${startSeconds.toString().padLeft(2, '0')}';
      //
      // // Calculate end time duration
      // Duration endTime = Duration(milliseconds: end);
      //
      // // Extract hours, minutes, and seconds from end time duration
      // int endHours = endTime.inHours;
      // int endMinutes = endTime.inMinutes.remainder(60);
      // int endSeconds = endTime.inSeconds.remainder(60);
      //
      // // Format end time
      // String formattedEndTime = '$endHours:${endMinutes.toString().padLeft(2, '0')}:${endSeconds.toString().padLeft(2, '0')}';
      //
      // // Display formatted start and end times
      // print('Start Time: $formattedStartTime');
      // print('End Time: $formattedEndTime');
      // double progress = start/end;
      // setState(() {
      //   position = progress;
      // });
      // print("Progress: $start - $end");
    });
    flutterTts.getMaxSpeechInputLength.then((value) => print("Speech Length $value"));
    flutterTts.setPauseHandler((){});
    // flutterTts.setDurationHandler((newDuration) {
    //   setState(() {
    //     duration = newDuration.toDouble();
    //   });
    // });
    // flutterTts.setPositionHandler((newPosition) {
    //   setState(() {
    //     position = newPosition.toDouble();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text-to-Speech'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textToSpeak,
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: speak,
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: pause,
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: stop,
                ),
                IconButton(
                  icon: Icon(Icons.fast_forward),
                  onPressed: forward,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            StreamBuilder<int>(
              stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
              builder: (context, snapshot) {
                Duration duration = Duration(seconds: _seconds);
                return Text(
                  _formatDuration(duration),
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            Text('Position: ${position.toStringAsFixed(2)} / ${duration.toStringAsFixed(2)} seconds'),
            const SizedBox(height: 20.0),
            Text('Volume: $volume'),
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
      ),
    );
  }

  Future<void> speak() async {
    //await flutterTts.setLanguage("en-US");
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setVolume(volume);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.speak(textToSpeak);
  }

  Future<void> pause() async {
    await flutterTts.pause();
  }

  Future<void> stop() async {
    await flutterTts.stop();
  }

  Future<void> forward() async {
    await flutterTts.stop();
    setState(() {
      position += 10.0; // Forward by 10 seconds (adjust as needed)
    });
    //await flutterTts.seekTo(position);
    await speak();
  }
}
