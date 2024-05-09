import 'package:flutter/material.dart';
import 'dart:math';
import 'level3a.dart';
import 'level3b.dart'; 

class Level2a extends StatefulWidget {
  const Level2a({Key? key}) : super(key: key);

  @override
  _Level2aState createState() => _Level2aState();
}

class _Level2aState extends State<Level2a> {
  int count = 0;
  bool square1Visible = true;
  bool square2Visible = true;

  void _handleSquareTap(int squareId) {
    setState(() {
      count++;
      if (squareId == 1) {
        square1Visible = false;
      } else if (squareId == 2) {
        square2Visible = false;
      }
      if (count == 2) {
        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Object Found!'),
          content: const Text('Level 2 completed.'),
          actions: <Widget>[
          TextButton(
           onPressed: () {
           Navigator.of(context).pop();
           Random random = Random();
           int randomNumber = random.nextInt(2); 
           Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => randomNumber == 0 ? Level3a() : Level3b()),
           );
           },
           child: const Text('Next level'),
           ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Level Meduim'),
           automaticallyImplyLeading: false,
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stack to position the invisible squares and count display
            Stack(
              children: [
                // Larger image
                Image.asset(
                  'assets/images/level2a.png', // Path to your larger image
                  width: 500, // Adjust the width as needed
                  height: 500, // Adjust the height as needed
                ),
                // Count display
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    '$count/2',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Positioned invisible square 1
                 if (square1Visible)
                  Positioned(
                    bottom: 330, // Adjust the position from bottom
                    right: 0, // Adjust the position from right
                    child: GestureDetector(
                      onTap: () => _handleSquareTap(1),
                      child: Container(
                        width: 50, // Increase the width
                        height: 80, // Increase the height
                        color: Colors.transparent, // Set color to blue
                      ),
                    ),
                  ),
                // Positioned invisible square 2
                if (square2Visible)
                  Positioned(
                    bottom: 240, // Adjust the position from bottom
                    left: 60, // Adjust the position from right
                    child: GestureDetector(
                      onTap: () => _handleSquareTap(2),
                      child: Container(
                        width: 20, // Increase the width
                        height: 80, // Increase the height
                        color: Colors.transparent, // Set color to red
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20), // SizedBox to add spacing between images
            // Text
            Text(
              'Find these objects', // Replace with your desired text
              style: TextStyle(
                fontSize: 20, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Adjust the font weight as needed
              ),
            ),
            SizedBox(height: 10), // SizedBox to add spacing between text and image
            // Centered Row containing two images
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/level2aobject1.png', // Path to your first image
                    width: 100, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                  ),
                  SizedBox(width: 10), // Adjust the space between the images
                  Image.asset(
                    'assets/images/level2aobject2.png', // Path to your second image
                    width: 100, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}