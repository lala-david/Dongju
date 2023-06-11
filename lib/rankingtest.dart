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
        title: Center(child: const Text("🍇 랭킹")), // 앱바 타이틀
        backgroundColor: Color(0xff8887ea), // 앱바 배경색
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection(collectionName).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // 로딩 중이면 로딩 표시기 표시
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // 에러가 발생하면 에러 메시지 표시
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('😑 사용자 없어')); // 데이터 없거나 사용자가 없는 경우 표시
          } else {
            final users = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
            users.sort((a, b) => (b['score'] as num).compareTo(a['score'] as num)); // 점수에 따라 사용자 정렬

            return Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // 수평 패딩
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final name = user['name'] as String? ?? '';
                  final score = user['score'] as num;
                  final rank = index + 1;

                  Widget leadingWidget;
                  if (rank <= 3) {
                    // 상위 3위 이모지 표시
                    leadingWidget = Padding(
                      padding: const EdgeInsets.only(left: 3.0, top: 5.0, bottom: 5.0, right: 3.0),
                      child: _getFruitEmoji(rank),
                    );
                  } else {
                    // 그 외에는 순위 숫자 표시
                    leadingWidget = CircleAvatar(
                      backgroundColor: Color(0xff8887ea),
                      child: Text(
                        rank.toString(),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    );
                  }

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Color(0xff8887ea)),
                    ),
                    elevation: 4.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.white,
                    child: ListTile(
                      leading: leadingWidget, // 선두 위젯
                      title: Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: Text(
                        'Score: $score',
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _getFruitEmoji(int rank) {
    switch (rank) {
      case 1:
        return Icon(
          Icons.emoji_events,
          color: Colors.yellow,
          size: 35,
        );
      case 2:
        return Icon(
          Icons.emoji_events,
          color: Colors.black26,
          size: 30,
        );
      case 3:
        return Icon(
          Icons.emoji_events,
          color: Colors.brown,
          size: 30,
        );
      default:
        return Text(
          rank.toString(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        );
    }
  }
}
