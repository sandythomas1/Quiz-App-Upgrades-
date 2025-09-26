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
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int selectedQuiz = 0;
  int selectedRating = 0;

  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Page'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 3; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedQuiz = i;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 0, 206, 209),
                        foregroundColor: Colors.black,
                        padding: selectedQuiz == i
                            ? const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)
                            : const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                      ),
                      child: Text('Quiz $i'),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: selectedRating > index
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedRating = index + 1;
                    });
                  },
                );
              }),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _reviewController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write your review here',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
                minLines: 3,
                maxLines: null,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedQuiz = 0;
                  selectedRating = 0;
                  _reviewController.clear();
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 206, 209),
                foregroundColor: Colors.black,
              ),
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}