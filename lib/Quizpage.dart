import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plz/MainPage.dart';
import 'package:plz/loading.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List<String>> getData(int num) async {
  await Future.delayed(Duration(seconds: 1));
  var result = await firestore.collection('Quizs').doc('Quiz$num').get();
  print(result);
  print(result.data()?['name']);
  List<String> data = [
    result.data()?['name'],
    result.data()?['codes'],
    result.data()?['contents']
  ];
  print(data);
  return data;
}
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dongju!',
//       debugShowCheckedModeBanner: false,
//       home: SolvePage(),
//     );
//   }
// } 단독 페이지 실행용

class SolvePage extends StatefulWidget {
  final int num;
  const SolvePage({Key? key, required this.num}) : super(key: key);

  @override
  State<SolvePage> createState() => _SolvePageState();
}

class _SolvePageState extends State<SolvePage> with TickerProviderStateMixin {
  String selectedAnswer = '';
  List<String> wordList = [];
  // 데이터 베이스 전송을 위한 데이터 포맷 세팅
  Map<String, dynamic> toJsonforscore(scorename, score) =>{
    'name' : scorename,
    'score' : score,
  };
  final user = FirebaseAuth.instance.currentUser;

  int cur = 0;
  int life = 3;
  int point = 0;
  int limit = 0;
  late Future<List<String>> _dataFuture;
  String detail = '';

  void initialize() {
    cur = 0;
    life = 3;
    point = 0;
    limit = 0;
  }

  @override
  void initState() {
    super.initState();
    _dataFuture = getData(widget.num);
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    CollectionReference rankdatacollect = firestore.collection('rank');
    //목숨이 다 사라졌을 때
    if (life == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              initialize();
              return OverPage();
            }));
        initialize();
      });
    }
    //목숨이 다 남아있고 , cur이 wordlist의 길이와 같을때,
    //문제 풀이 성공
    if (cur != 0 && cur == wordList.length) {
      point = (life + 1) * 10;
      //여기서 데이터베이스로 날림
      if(user != null){ //
        var username = user?.displayName;
        print(username);

        rankdatacollect.doc(username).set(toJsonforscore(username, point));
      }
      print(point);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ClearPage()));
      });
    }
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred: ${snapshot.error}'),
            );
          } else {
            List<String>? data = snapshot.data;
            String code = data![1];
            detail = data![2];
            print(detail);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                title: Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data[0]),
                      Text(
                        detail,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (limit < 1) {
                        setState(() {
                          limit += 1;
                        });
                      }
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CodeTemplate(
                            cur: cur,
                            code: code,
                          ),
                          ChoiceArea(
                            selectedAnswer: '',
                            onAnswerSelected: (String value) {
                              setState(() {
                                if (cur == wordList.length - 1) {
                                  print("완료");
                                }
                              });
                            },
                            wordList: wordList,
                            cur: cur,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}

class CodeTemplate extends StatefulWidget {
  int cur;
  String code;

  CodeTemplate({
    required this.cur,
    required this.code,
  });

  @override
  State<CodeTemplate> createState() => _CodeTemplateState();
}

String removeExtraSpaces(String text) {
  return text.replaceAll(RegExp(r'\\n\s+'), '\n');

}

class _CodeTemplateState extends State<CodeTemplate> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.92;
    final double height = MediaQuery.of(context).size.height * 0.6;
    int tmp = 0;
    List<Row> rowList = [];
    List<Widget> li = [];
    //코드 넣는곳
    String code = removeExtraSpaces(widget.code);
    // String code = '''
    // #include<stdio.h>
    // int main(void){
    // printf("aa");
    // return 0;
    // }
    // ''';
    // String code1 = '#include<stdio.h>\\nint main(void){\\nprintf("aa");\\nreturn 0;\\n}';
    print("불러온 코드");
    print(code);
    //code 는 현재 HelloWorld를 출력하는 기능을 하는 코드의 예.
    List<String> wordList = [];
    //CuriosBox의 개수를 나타냄
    int cnt = 0;
    List<String> sp = [
      '>',
      '<',
      '{',
      '}',
      '\"',
      ' ',
      '(',
      ')',
      '\n',
      ';',
      ',',
      '<=',
      '>='
    ];
    //코드에서 특수문자를 제외한 나머지를 얻어주는 함수.

    void extractCodeBlocks(String code) {
      String word = "";
      for (var i = 0; i < code.length; i++) {
        if (sp.contains(code[i])) {
          if (word.isNotEmpty) {
            wordList.add(word);
            word = "";
          }
        } else {
          word += code[i];
        }
      }
      if (word.isNotEmpty) {
        wordList.add(word);
      }
    }

    extractCodeBlocks(code);
    context.findAncestorStateOfType<_SolvePageState>()?.wordList = wordList;
    print('word;lst');
    print(wordList);
    //code에서 wordlist가 처음으로 나오는 부분들을 다 ?로 바꿔준다.
    String question = code;
    print('question : $question');
    for (int i = 0; i < wordList.length; i++) {
      question = question.replaceFirst(wordList[i], '?');
    }
    print(question);
    print(wordList);
    for (var i = 0; i < question.length; i++) {
      if (question[i] == '?') {
        li.add(
          CuriousBox(
            content: wordList[cnt],
            isFocus: cnt == widget.cur,
            isSolved: (cnt < widget.cur),
          ),
        );
        cnt += 1;
      } else {
        if (question[i] == '\n') {
          String a = " " * tmp;
          li.insert(0, Text(a));
          rowList.add(Row(children: li));
          li = [];
        } else {
          if(question[i] == '{'){
            tmp += 6;
          }
          if(question[i] == '}'){
            tmp -= 6;
          }
          //특수문자일 경우에는 문자로 넣는다.
          li.add(Text(
            question[i].toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ));
        }
      }
    }
    if (li.isNotEmpty) rowList.add(Row(children: li));
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurpleAccent.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0), // 아래로 그림자
            )
          ]),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rowList,
        ),
      ),
    );
  }
}

//CodeTemplate에 존재하는 CuriosBox
class CuriousBox extends StatefulWidget {
  final String content;
  final bool isFocus;
  final bool isSolved;

  const CuriousBox(
      {Key? key,
        required this.content,
        required this.isFocus,
        required this.isSolved})
      : super(key: key);

  @override
  State<CuriousBox> createState() => _CuriousBoxState();
}

class _CuriousBoxState extends State<CuriousBox> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        width: width * 0.195,
        height: height * 0.037,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: widget.isFocus ? Colors.purpleAccent : Colors.white,
              spreadRadius: widget.isFocus ? 2 : 0,
              blurRadius: widget.isFocus ? 2 : 0,
              offset: Offset(0, 0), // shadows are cooler at the bottom
            ),
          ],
          border: widget.isFocus || widget.isSolved
              ? null
              : Border.all(
            color: Colors.black, // Border color
            width: 0.5, // Border width
            style: BorderStyle
                .solid, // Border style (solid, dashed, or none)
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: widget.isSolved
              ? Text(
            widget.content,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
              : Icon(Icons.question_mark, color: Colors.black54, size: 20),
        ));
  }
}

class ChoiceArea extends StatefulWidget {
  final String selectedAnswer;
  final ValueChanged<String> onAnswerSelected;
  final List wordList;
  final int cur;

  const ChoiceArea({
    Key? key,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.wordList,
    required this.cur,
  }) : super(key: key);

  @override
  State<ChoiceArea> createState() => _ChoiceAreaState();
}

class _ChoiceAreaState extends State<ChoiceArea> {
  List<String> answerOptions = [];

  //현재 풀고있는 박스
  int box_cnt = 0;

  Future getRandomOptions() async {
    //다 풀었을때는 아무것도 하지않는다.
    setState(() {
      if (box_cnt >= widget.wordList.length) {
        return;
      }
      List wordList = widget.wordList;
      String correctAnswer = wordList[box_cnt];
      List<String> options = [correctAnswer];

      // 단어 목록에서 랜덤하게 답을 제외한 3개의 보기를 선택합니다.
      while (options.length < 4) {
        String randomOption = wordList[Random().nextInt(wordList.length)];
        if (!options.contains(randomOption)) {
          options.add(randomOption);
        }
      }

      options.shuffle(); // 보기를 무작위로 섞습니다.
      answerOptions = options;
    });
  }

  @override
  Widget build(BuildContext context) {
    int life = context.findAncestorStateOfType<_SolvePageState>()!.life;
    setState(() {
      if (context.findAncestorStateOfType<_SolvePageState>()!.cur !=
          context.findAncestorStateOfType<_SolvePageState>()!.wordList.length -
              1) {
        getRandomOptions();
      }
    });

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    //틀리면 진동이 울리는 부분
    _playVibrate() async {
      await Vibration.vibrate(duration: 50);
    }

    return Container(
      margin: EdgeInsets.all(10),
      width: width * 0.92,
      height: height * 0.23,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurpleAccent.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // 아래로 그림자
            )
          ]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.all(10),
              child: const Text(
                '4개의 보기중에 정답을 골라주세요.',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...answerOptions.map((option) => AnswerButton(
                  option: option,
                  selectedAnswer: '',
                  onAnswerSelected: (answer) {
                    widget.onAnswerSelected(answer);
                    String label = widget.wordList[context
                        .findAncestorStateOfType<_SolvePageState>()!
                        .cur];

                    int current_index = context
                        .findAncestorStateOfType<_SolvePageState>()!
                        .cur;
                    if (label == answer &&
                        current_index < widget.wordList.length) {
                      setState(() {
                        context
                            .findAncestorStateOfType<_SolvePageState>()
                            ?.life += 1;
                        context
                            .findAncestorStateOfType<_SolvePageState>()!
                            .cur += 1;
                        box_cnt += 1;
                        getRandomOptions();
                      });
                    } else {
                      //오답일경우
                      _playVibrate();
                      setState(() {
                        context
                            .findAncestorStateOfType<_SolvePageState>()
                            ?.life -= 1;
                      });
                    }
                  },
                )),
              ],
            );
          }),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "HP  ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
                Icon(
                  Icons.favorite_outlined,
                  color: Colors.red,
                  size: 40,
                ),
                Text(
                  " x $life",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AnswerButton extends StatefulWidget {
  final String option;
  final String selectedAnswer;
  final ValueChanged<String> onAnswerSelected;

  const AnswerButton({
    Key? key,
    required this.option,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  bool isCorrect = false;
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return ElevatedButton(
      onPressed: () {
        widget.onAnswerSelected(widget.option);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purpleAccent,
        minimumSize: Size(30, 50),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        widget.option,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class OverPage extends StatefulWidget {
  const OverPage({Key? key}) : super(key: key);

  @override
  State<OverPage> createState() => _OverPageState();
}

class _OverPageState extends State<OverPage> {
  TextStyle fontStyle = new TextStyle(
    fontSize: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Game Over",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: Size(250, 80),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Main(),
                    ));
              },
              child: Text(
                "메인으로",
                style: fontStyle,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                minimumSize: Size(250, 80),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "재도전!",
                style: fontStyle,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ClearPage extends StatelessWidget {
  const ClearPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Main(),
                      ));
                },
                child: Text("메인으로")),
            ElevatedButton(
                onPressed: () {
                  print("문제 선택");
                },
                child: Text("문제 선택창")),
          ]),
        ),
      ),
    );
  }
}