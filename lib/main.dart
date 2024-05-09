import 'dart:math'; 
import 'package:flutter/material.dart';
import 'level1a.dart';
import 'level1b.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Find the object'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Play Now!',
              style: TextStyle(fontSize: 32),
            ),
            ElevatedButton(
              onPressed: () {
                // Generate a random number between 0 and 1
                final random = Random();
                final randomNumber = random.nextInt(2); // Generates 0 or 1

                // Navigate to either SecondPage or ThirdPage based on random number
                if (randomNumber == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1a()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1b()),
                  );
                }
              },
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
