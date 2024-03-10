import 'package:flutter/material.dart';
import 'package:mobsec4lab/api/sheets/feedbackSheetApi.dart';
import 'package:mobsec4lab/views/homepage.dart';

import 'feedbackpage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('lab 4',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(30),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Medvedeva Valentina',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.normal)),
                    ],
                  )),
              // const SizedBox(height: 30),
              ElevatedButton(
                child: const Text('Rest API'),
                //style: Style(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const Text('Feedback Form'),
                //style: Style(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedBackPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
