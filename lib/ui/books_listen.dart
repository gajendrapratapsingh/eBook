import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
  String textToSpeak = "This is a basic example to get you started. You can enhance the app by adding more features such as pausing, stopping, seeking, displaying playback duration, handling errors, etc. Make sure to handle exceptions and errors appropriately, especially when dealing with network requests and audio playback.";
  double duration = 0.0;
  double position = 0.0;

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
                          onPressed: () {},
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
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    //"By Afia Atakora",
                    "By ${Book.allBooks[index!].name!}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                onPressed: () {},
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
