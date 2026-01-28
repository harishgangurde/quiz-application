import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QuizApp());
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      'question': "Who is current FIDE World Chess Champion?",
      'options': [
        "Magnus Carlsen",
        "Ian Nepomniachtchi",
        "Gukesh Dommaraju",
        "Ding Liren",
      ],
      'correctAnswer': 2,
    },
    {
      'question': "Who won FIDE Women's World Cup 2025 ?",
      'options': ["Divya Deshmukh", "Koneru Humpy", "Ju Wenjun", "Hou Yifan"],
      'correctAnswer': 0,
    },
    {
      'question': "Who is currently at Top in Live chess Rating?",
      'options': [
        "Hikaru Nakamura",
        "Fabiano Caruana",
        "Arjun Erigaisi",
        "Magnus Carlsen",
      ],
      'correctAnswer': 3,
    },
    {
      'question': "Who is current Women's FIDE World Chess Champion?",
      'options': ["Ju Wenjun", "Hou Yifan", "Lei Tingjie", "Koneru Humpy"],
      'correctAnswer': 0,
    },
    {
      'question': "King's Pawn Opening begins with which Move?",
      'options': ["Nf3", "e4", "d4", "g3"],
      'correctAnswer': 1,
    },
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool isQuestionPage = true;
  int count = 0;

  WidgetStatePropertyAll<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]['correctAnswer']) {
        if (answerIndex == selectedAnswerIndex) {
          count++;
        }
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return WidgetStatePropertyAll(Colors.red);
      } else {
        return WidgetStatePropertyAll(null);
      }
    } else {
      return WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return quizAppPage();
  }

  Scaffold quizAppPage() {
    if (isQuestionPage == true) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.orange,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 120),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 80,
              width: 380,
              child: Text(
                allQuestions[currentQuestionIndex]['question'],
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(0)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][0],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][1],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][2],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(3)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][3],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex != -1) {
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
                selectedAnswerIndex = -1;
              } else {
                isQuestionPage = false;
              }
              setState(() {});
            }
          },
          backgroundColor: Colors.blue,
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 15, color: Colors.orange),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Result Screen", style: TextStyle(fontSize: 30)),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                "https://media.istockphoto.com/id/1477780233/vector/trophy-icon-vector-design-template-simple-and-modern.jpg?s=612x612&w=0&k=20&c=n2appnG8M5pJmroqLxzU6EiWj-kpaDbfIH43zJ4OKEg=",
                width: 500,
                height: 500,
              ),
              SizedBox(height: 30),
              Text(
                "Score : $count/${allQuestions.length}",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30),
              Text(
                "Congratulations",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      );
    }
  }
}
