import 'dart:async';
import 'dart:ui';

import 'package:ebook/widgets/manage_voice_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../models/book_data.dart';
import '../models/book_model.dart';

class BooksListen extends StatelessWidget {
  List<int> Heights = [];
  List<Book>? bookList;
  final int? index;
  final String? section;

  BooksListen({super.key, this.index, this.section});

  final FlutterTts flutterTts = FlutterTts();
  double volume = 0.5;
  double pitch = 0.5;
  double rate = 0.3;
  String textToSpeak = "अमृत राय (सन् 1921 ई.-सन् 1996 ई.) का जन्म वाराणसी, उत्तर प्रदेश में हुआ। वह उपन्यासकार, निबन्धकार, समीक्षक, व्यंग्यकार और अनुवादक थे। अमृत राय प्रेमचंद के छोटे बेटे हैं। पिता की तरह मूलतः कहानीकार व उपन्यासकार थे । श्रेष्ठ अनुवादक व जीवनीकार के रूप में भी ख्याति । प्रेमचंद की जीवनी 'कलम का सिपाही' के लिए साहित्य अकादमी पुरस्कार से सम्मानित हुए । नाट्य-लेखन में भी सक्रिय रहे। अंग्रेजी, बंगला और हिन्दी पर समान अधिकार था । अमृतराय जी का विवाह सुभद्रा कुमारी चौहान जी की बेटी सुधा चौहान से हुआ था। सुधा ने सुभद्रा कुमारी चौहान तथा अपने पिता लक्षमण सिंह जी की संयुक्त जीवनी लिखी - 'मिला तेज से तेज'। प्रेमचंद की बिखरी रचनाओं के संपादन के अतिरिक्त आपने 'हंस' का संपादन अपने ही अंदाज़ में किया। कृतियाँ : 'साहित्य में संयुक्त मोर्चा', 'सुबह का रंग', 'लाल धरती', 'नई समीक्षा', 'नागफनी का देश', 'हाथी के दांत', 'अग्निशिखा', 'फांसी के तख्ते से', 'कस्बे का एक दिन', 'गीली मिट्टी', 'कठघरे', 'जंगले', 'सहचिंतन', 'भटियाली', 'आधुनिक भावबोध की संज्ञा', 'बतरस', 'चतुरंग', 'सारंग' और 'धुआं'। 'प्रेमचन्द', 'कलम का सिपाही' (जीवनी), 'बीज' (उपन्यास), 'तिरंगा कफ़न' (कहानी-संग्रह)। अनुवाद : 'स्पार्टाकस' का अनुवाद 'आदिविद्रोही', 'हैमलेट' का अनुवाद 'समरगाथा'।";
  double duration = 0.0;
  double position = 0.0;

  late Timer _timer;
  int _seconds = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, (Timer timer) {
      // setState(() {
      //   _seconds++;
      // });
    },
    );
  }

  String _formatDuration(Duration duration) {
    String hours = (duration.inHours % 60).toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  // @override
  // void initState() {
  //   super.initState();
  //   flutterTts.setStartHandler(() {
  //     print("Playing");
  //   });
  //   flutterTts.setCompletionHandler(() {
  //     print("Complete");
  //   });
  //   flutterTts.setErrorHandler((msg) {
  //     print("Error: $msg");
  //   });
  //   flutterTts.setDurationHandler((newDuration) {
  //     setState(() {
  //       duration = newDuration.toDouble();
  //     });
  //   });
  //   flutterTts.setPositionHandler((newPosition) {
  //     setState(() {
  //       position = newPosition.toDouble();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < MediaQuery.of(context).size.width / 9.3; i++) {
      Heights.add(Random().nextInt(50));
    }
    if (section == "Continue Reading") {
      bookList = recentBooks;
    } else if (section == "Discover More") {
      bookList = Book.allBooks;
    }
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Book.allBooks[index!].coverImage!),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.1),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            //showBottomSheet();
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 25,
                                offset: const Offset(8, 8),
                                spreadRadius: 3,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 25,
                                offset: const Offset(-8, -8),
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              // "assets/images/0.jfif",
                              Book.allBooks[index!].coverImage!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    // "Conjure Women",
                    Book.allBooks[index!].name!,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    //"By Afia Atakora",
                    "By ${Book.allBooks[index!].name!}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xfffff8ee),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Chapter 2",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 35,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  itemBuilder: (ctx, i) => Bars(
                                    height: Heights[i].toDouble(),
                                    color: i < Heights.length / 2
                                        ? const Color(0xffc44536)
                                        : Colors.redAccent.withOpacity(0.5),
                                  ),
                                  itemCount: Heights.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("01:33"),
                                  Text("08:47"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.grey,
                                  size: 32,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.skip_previous,
                                  color: Colors.grey,
                                  size: 38,
                                ),
                                onPressed: () {},
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffc44536),
                                ),
                                child: IconButton(
                                  alignment: Alignment.center,
                                  icon: const Icon(
                                    Icons.pause,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    speak();
                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.skip_next,
                                  color: Colors.grey,
                                  size: 38,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey,
                                  size: 32,
                                ),
                                onPressed: () {
                                  Get.dialog(const ManageVoiceDialog());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> speak() async {
    //await flutterTts.setLanguage("en-US");
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setVoice({"language": "hi-IN", "gender": "male"});
    await flutterTts.setVolume(volume);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.speak(textToSpeak);
    // Set the voice to a male voice
    //await flutterTts.setVoice({"name": "en-us-x-sfg#male_1-local"});
  }

  Future<void> pause() async {
    await flutterTts.pause();
  }

  Future<void> stop() async {
    await flutterTts.stop();
  }

  Future<void> forward() async {
    await flutterTts.stop();
    // setState(() {
    //   position += 10.0; // Forward by 10 seconds (adjust as needed)
    // });
    //await flutterTts.seekTo(position);
    await speak();
  }

  void showBottomSheet() {
    Widget bottomSheet = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text('Music'),
            onTap: () => Get.back(result: 'Music'),
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Photo'),
            onTap: () => Get.back(result: 'Photo'),
          ),
          ListTile(
            leading: const Icon(Icons.videocam),
            title: const Text('Video'),
            onTap: () => Get.back(result: 'Video'),
          ),
        ],
      ),
    );

    Get.bottomSheet(
      bottomSheet,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
    ).then((value) {
      // Check if value is not null before accessing it
      if (value != null) {
        print('Selected: $value');
      }
    });
  }

// Future<void> forward() async {
  //   await flutterTts.stop();
  //   // Forward by 10 seconds (adjust as needed)
  //   await flutterTts.setPlaybackRate(rate + 0.5);
  //   await speak();
  // }
}

class Bars extends StatelessWidget {
  final double? height;
  final Color? color;

  const Bars({super.key, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      color: const Color(0xfffff8ee),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Center(
        child: Container(
          height: height,
          color: color,
          width: 4,
        ),
      ),
    );
  }
}
