import 'package:bluepadel/Features/Register%20exsersize/view/registerexercise.dart';
import 'package:bluepadel/Features/howmanyexexercize/howmanyexexercizeview.dart';
import 'package:bluepadel/main.dart';
import 'package:flutter/material.dart';

class Optionview extends StatelessWidget {
  const Optionview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Option'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOptionButton(context, 'Register User',  () {
                Navigator.pushNamed(context, Register.routeName);
                // Add navigation or functionality for registering a user
              }),
              const SizedBox(height: 20),
              _buildOptionButton(context, 'Register Exercise',  () {
                Navigator.pushNamed(context, Registerexercise.routeName);
                // Add navigation or functionality for registering an exercise
              }),
              const SizedBox(height: 20),
              _buildOptionButton(context, 'How Many Exercises',() {
                Navigator.pushNamed(context, howmanyexexercizeview.routeName);
                // Add navigation or functionality to show the number of exercises
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String title,  VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
       
        minimumSize: const Size(200, 100),
        maximumSize: const Size(200, 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
