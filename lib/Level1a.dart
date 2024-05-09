import 'package:flutter/material.dart';
import 'dart:math';
import 'level2a.dart';
import 'level2b.dart'; 

class Level1a extends StatelessWidget {
  const Level1a({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Level Easy'),
           automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stack to position the invisible square
            Stack(
              children: [
                // Larger image
                Image.asset(
                  'assets/images/level1a.png', // Path to your larger image
                  width: 500, // Adjust the width as needed
                  height: 500, // Adjust the height as needed
                ),
                // Positioned invisible square
                Positioned(
                  bottom: 150, // Adjust the position from bottom
                  right: 50, // Adjust the position from right
                  child: GestureDetector(
                    onTap: () {
                      // Show alert box when the invisible square is tapped
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Object Found!'),
                            content: const Text('Level 1 completed.'),
                            actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                // Pop the dialog
                                Navigator.of(context).pop();
                                // Generate a random number (0 or 1)
                                Random random = Random();
                                int randomNumber = random.nextInt(2); // Generates either 0 or 1
                                // Navigate to either level2a.dart or level2b.dart based on the random number
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => randomNumber == 0 ? Level2a() : Level2b()),
                                );
                              },
                              child: const Text('Next level'),
                            ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 80, // Increase the width
                      height: 80, // Increase the height
                      color: Colors.transparent, // Set color to transparent
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // SizedBox to add spacing between images
            // Text
            Text(
              'Find this object', // Replace with your desired text
              style: TextStyle(
                fontSize: 20, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Adjust the font weight as needed
              ),
            ),
            SizedBox(height: 10), // SizedBox to add spacing between text and image
            // Smaller image
            Image.asset(
              'assets/images/level1aobject.png', // Path to your smaller image
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}
