import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QuizMain());
}

class QuizMain extends StatelessWidget {
  QuizMain({Key? key}) : super(key: key);

  final firestore = FirebaseFirestore.instance;

  Future<String> loadAsset(String path) async{
    return await rootBundle.loadString(path);
  }
  Map<String, dynamic> toJsonforquiz(quizname, codes) => {
    'name': quizname,
    'codes': codes,
  };

  @override
  Widget build(BuildContext context) {
    CollectionReference quizdatacollect = firestore.collection('Quizs');
    String quiz = 'quiz.c';
    return FutureBuilder(
        future: loadAsset('$quiz'),
        builder: (context, snapshot) {
          var contents = snapshot.data.toString();

          String docname = 'Quiz10';
          var codes = contents;
          //quizdatacollect.doc(docname).set(toJsonforquiz(docname+'.c', codes));

          return MaterialApp();
        }
    );
  }
}
