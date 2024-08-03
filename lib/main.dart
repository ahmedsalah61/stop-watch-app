import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: timer_App(),
    );
  }
}

class timer_App extends StatefulWidget {
  const timer_App({super.key});

  @override
  State<timer_App> createState() => _date_timeState();
}

class _date_timeState extends State<timer_App> {
  Timer? num;
  Duration duration = const Duration(seconds: 0);

  void startTimer() {
    num = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int sec = duration.inSeconds + 1;
        duration = Duration(seconds: sec);
      });
    });
  }

  bool isrunining = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 22),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        duration.inHours.toString().padLeft(2, "0"),
                        style: const TextStyle(
                          fontSize: 80,
                        ),
                      ),
                    ),
                    const Text(
                      "hours",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 22),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        duration.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: const TextStyle(
                          fontSize: 80,
                        ),
                      ),
                    ),
                    const Text(
                      "minutes",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 22),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        duration.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: const TextStyle(
                          fontSize: 80,
                        ),
                      ),
                    ),
                    const Text(
                      "seconds",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            isrunining
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: () {
                        num!.cancel();
                        setState(() {
                          duration = const Duration(seconds: 0);
                          isrunining = false;
                        });
                      },
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(14)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: const Text(
                        "cancel",
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (num!.isActive) {
                          setState(() {
                            num!.cancel();
                          });
                        } else {
                          startTimer();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(14)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: Text(
                        (num!.isActive) ? "stop" : "resume",
                        style: const TextStyle(fontSize: 27),
                      ),
                    )
                  ])
                : ElevatedButton(
                    onPressed: () {
                      startTimer();
                      isrunining = true;
                    },
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(14)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child: const Text(
                      "start timer",
                      style: TextStyle(fontSize: 27),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
