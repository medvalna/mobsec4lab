import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key, required this.pref});
  final SharedPreferences pref;

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  late TextEditingController controllerName;
  late TextEditingController controllerReview;
  String name = '';
  String review = '';
  String? dbName = '';
  String? dbReview = '';
  @override
  void initState(){
    super.initState();
    controllerName = TextEditingController();
    controllerReview = TextEditingController();
    dbName= widget.pref.getString('name');
    dbReview = widget.pref.getString('review');
    print(dbName);
    print(dbReview);
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
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                child: Column(
                  //alignment: Alignment.topLeft,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('previous review:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Name: $dbName', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
                    Text('Review: $dbReview', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),],
                ),
              ),


            ),
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

            ElevatedButton(
                child: Text('Save'),
                //style: Style(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
                onPressed: () async {
                  await widget.pref.setString('review',review);
                  await widget.pref.setString('name',name);
                  dbName= widget.pref.getString('name');
                  dbReview = widget.pref.getString('review');
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
