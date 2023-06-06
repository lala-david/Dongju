import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RankingSystemPage extends StatefulWidget {
  const RankingSystemPage({Key? key}) : super(key: key);

  @override
  _RankingSystemPageState createState() => _RankingSystemPageState();
}

class _RankingSystemPageState extends State<RankingSystemPage> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String collectionName = 'rank';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🍇 랭킹시스템'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection(collectionName).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 로딩
            return Center(child: CircularProgressIndicator());
          }
          // 에러 메세지 주기
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // 데이터가 없는 경우 데이터 없어~
          else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('😑 사용자 없어'));
          }
          // 점수 sort랑 사용자 리스트
          else {
            var contents = snapshot.data.toString();
            print(contents);
            final users = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
            users.sort((a, b) => (b['score'] as num).compareTo(a['score'] as num));

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final name = user['name'] as String? ?? '';
                final score = user['score'] as num;
                final rank = index + 1;

                return ListTile(
                  title: Text('$rank. $name'),
                  subtitle: Text('Score: $score'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
