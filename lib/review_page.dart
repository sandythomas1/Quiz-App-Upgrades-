// want to create file that holds the review page
// top of screen will have 3 buttons - quiz 1, quiz, quiz 3
// when user clicks on one it will enlargen that button to show distinction
// below that will be a 5 star rating system 
// below that will be a text box to write review
// below that will be a submit button
// background will be the same color scheme as the rest of the app
// the review page will be accessed from the results screen
// add a button to the results screen to go to the review page
// after button is submitted, it will go back to the results screen
// when clicking star for rating, it will change color to show selection
// if user clicks on a different star, it will change the color of the previous star back and change the color of the newly selected star
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() {
    return _ReviewPageState();
  }
}

class _ReviewPageState extends State<ReviewPage> {
  int selectedQuiz = 0;
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Page'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 140, 0),
                Color.fromARGB(255, 34, 139, 34),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 140, 0),
              Color.fromARGB(255, 34, 139, 34),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Quiz selection buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedQuiz = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 206, 209),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: selectedQuiz == 1 ? 24 : 16,
                        vertical: selectedQuiz == 1 ? 16 : 12,
                      ),
                    ),
                    child: Text('Quiz 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedQuiz = 2;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 206, 209),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: selectedQuiz == 2 ? 24 : 16,
                        vertical: selectedQuiz == 2 ? 16 : 12,
                      ),
                    ),
                    child: Text('Quiz 2'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedQuiz = 3;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 206, 209),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: selectedQuiz == 3 ? 24 : 16,
                        vertical: selectedQuiz == 3 ? 16 : 12,
                      ),
                    ),
                    child: Text('Quiz 3'),
                  ),
                ],
              ),
            ),
            
            // Spacer to push stars to middle
            const Spacer(flex: 2),
            
            // Star rating system
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                Icons.star,
                color: selectedRating > index ? Colors.yellow : Colors.grey,
                ),
                onPressed: () {
                setState(() {
                  selectedRating = index + 1;
                });
                },
              );
              }),
            ),
            
            // Spacer to push text field to bottom half
            const Spacer(flex: 3),
            
            // Text box for review
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'Write your review here',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.black),
              maxLines: null,
              minLines: 3,
              ),
            ),
            
            // Submit button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
              onPressed: () {
              Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 206, 209),
              foregroundColor: Colors.black,
              ),
              child: Text('Submit'),
              ),
            ),
            const Spacer(),
            ],
          ),
          ),
    );
  }
}
