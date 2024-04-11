import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:mobsec4lab/views/postPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feedbackpage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.pref,});
  final SharedPreferences pref;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    getSecure();
  }
  getSecure() async {
    await FlutterWindowManager.addFlags(
        FlutterWindowManager.FLAG_SECURE);
  }
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
                      builder: (context) => const PostPage(),
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
                      builder: (context) => FeedBackPage(pref: widget.pref),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
