import 'package:flutter/material.dart';
import 'package:mobsec4lab/models/feedback.dart';
import 'package:uuid/uuid.dart';
import '../api/sheets/feedbackSheetApi.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  var uuid = Uuid();
  late TextEditingController controllerName;
  late TextEditingController controllerReview;
  String name = '';
  String review = '';

  @override
  void initState() {
    super.initState();
    controllerName = TextEditingController();
    controllerReview = TextEditingController();
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerReview.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('FeedBack',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a name',
                  ),
                  controller: controllerName,
                  onSubmitted: (String valName) {
                    setState(() {
                      name = controllerName.text;
                    });
                  }),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a review',
                ),
                controller: controllerReview,
                onSubmitted: (String valName) {
                  setState(() {
                    review = controllerReview.text;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                child: Text('Save'),
                //style: Style(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
                onPressed: () async {
                  List<Map<String, dynamic>> feedbackMap = [];
                  Map<String, dynamic> item = {
                    FeedbackFields().id: uuid.v1(),
                    FeedbackFields().name: name,
                    FeedbackFields().review: review
                  };
                  feedbackMap.add(item);
                  await FeedBackSheetApi.insert(feedbackMap);
                  setState((){
                    review = "";
                    controllerReview.text="";
                    controllerName.text="";
                    name = "";
                  });


                }),
          ],
        ),
      ),
    );
    ;
  }
}
