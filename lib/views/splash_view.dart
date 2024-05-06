import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 16), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: "News",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " Cloud",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff974ed9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Lottie.network(
                    'https://lottie.host/cf34c4b0-caef-4cef-8aa6-c6d721e87e92/7wfhbRC6uY.json'),
              ),
            ),
          ],
        ));
  }
}
