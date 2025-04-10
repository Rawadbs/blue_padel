import 'package:bluepadel/Features/Register%20exsersize/view/registerexercise.dart';
import 'package:bluepadel/Features/howmanyexexercize/howmanyexexercizeview.dart';
import 'package:bluepadel/Features/otp/otp_screen.dart';
import 'package:bluepadel/main.dart';
import 'package:flutter/material.dart';

class OptionView extends StatelessWidget {
  const OptionView({super.key});
  static const routeName = '/optionview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/blue_padel.png',
              height: 120,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 32),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _buildCard(
                  context,
                  title: 'Register User',
                  subtitle:
                      'Join our community and start your fitness journey today',
                  buttonLabel: 'Register Now',
                  icon: Icons.person_add_alt_1,
                  onPressed: () {
                    Navigator.pushNamed(context, Register.routeName);
                  },
                ),
                _buildCard(
                  context,
                  title: 'Register Exercise',
                  subtitle:
                      'Browse and book from hundreds of classes and trainers',
                  buttonLabel: 'Booked Now',
                  icon: Icons.calendar_today,
                  onPressed: () {
                    Navigator.pushNamed(context, HowManyExerciseView.routeName);
                  },
                ),
                _buildCard(
                  context,
                  title: 'Confirm Attendance',
                  subtitle: 'Check in to your upcoming or ongoing sessions',
                  buttonLabel: 'Check In',
                  icon: Icons.check_circle_outline,
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterExercise.routeName);
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String buttonLabel,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: const Color(0xFF5A48F2)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A3F),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A48F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: onPressed,
              child: Text(
                buttonLabel,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
