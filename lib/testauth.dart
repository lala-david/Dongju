import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:plz/ffiretest.dart';
import 'MainPage.dart';
import 'homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){

        FirebaseFirestore firestore = FirebaseFirestore.instance;
        CollectionReference users = firestore.collection('testcolladd');

        final user = FirebaseAuth.instance.currentUser;

        if(!snapshot.hasData){
          return SignInScreen(
            headerBuilder: (context, constraints, _){
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('assets/sung1.jpg'),
                  ),
              );
            },
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
          );
        }
        // 유저 정보 추출 테스트
        if(user != null){
          final name = user.displayName;
          final email = user.email;
          final pht = user.photoURL;
          print(user);
          Map<String, dynamic> toJson() => {
            'email': email,
            'uid': user.uid,
          };
          //users.add(toJson());
        }
        //return MyHomePage();
        return Main();
      },
    );
  }

}