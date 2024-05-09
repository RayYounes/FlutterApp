import 'package:flutter/material.dart';

class Level3a extends StatefulWidget {
  const Level3a({Key? key}) : super(key: key);

  @override
  _Level3aState createState() => _Level3aState();
}

class _Level3aState extends State<Level3a> {
  int count = 0;
  bool square1Visible = true;
  bool square2Visible = true;
  bool square3Visible = true; // New boolean for the third square

  void _handleSquareTap(int squareId) {
    setState(() {
      count++;
      if (squareId == 1) {
        square1Visible = false;
      } else if (squareId == 2) {
        square2Visible = false;
      } else if (squareId == 3) { // Check for the third square
        square3Visible = false;
      }
      if (count == 3) { // Update the condition for showing completion dialog
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
        content: const Text('All levels completed.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Pop the dialog
              Navigator.of(context).pop();
              // Navigate to main.dart
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            },
            child: const Text('Done'),
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
        title: const Text('Level Hard'),
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
                  'assets/images/level3a.png', // Path to your larger image
                  width: 500, // Adjust the width as needed
                  height: 500, // Adjust the height as needed
                ),
                // Count display
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    '$count/3', // Change count to 3
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Positioned invisible square 1
                if (square1Visible)
                  Positioned(
                    bottom: 57, // Adjust the position from bottom
                    right: 45, // Adjust the position from right
                    child: GestureDetector(
                      onTap: () => _handleSquareTap(1),
                      child: Container(
                        width: 23, // Increase the width
                        height: 40, // Increase the height
                        color: Colors.transparent, // Set color to blue
                      ),
                    ),
                  ),
                // Positioned invisible square 2
                if (square2Visible)
                  Positioned(
                    bottom: 263, // Adjust the position from bottom
                    left: 18, // Adjust the position from right
                    child: GestureDetector(
                      onTap: () => _handleSquareTap(2),
                      child: Container(
                        width: 15, // Increase the width
                        height: 15, // Increase the height
                        color: Colors.transparent, // Set color to red
                      ),
                    ),
                  ),
                // Positioned invisible square 3
                if (square3Visible) // Add this condition for the new square
                  Positioned(
                    bottom: 100, // Adjust the position from bottom
                    right: 120, // Adjust the position from right
                    child: GestureDetector(
                      onTap: () => _handleSquareTap(3),
                      child: Container(
                        width: 60, // Increase the width
                        height: 60, // Increase the height
                        color: Colors.transparent, // Set color to purple
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
                    'assets/images/level3aobject1.png', // Path to your first image
                    width: 100, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                  ),
                  SizedBox(width: 10), // Adjust the space between the images
                  Image.asset(
                    'assets/images/level3aobject2.png', // Path to your second image
                    width: 100, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                  ),
                  SizedBox(width: 10), // Adjust the space between the images
                  Image.asset(
                    'assets/images/level3aobject3.png', // Path to your third image
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
