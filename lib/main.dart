import 'package:bluepadel/Features/Register%20exsersize/view/registerexercise.dart';
import 'package:bluepadel/Features/howmanyexexercize/howmanyexexercizeview.dart';
import 'package:bluepadel/Features/login/login_screen.dart';
import 'package:bluepadel/Features/option/optionview.dart';
import 'package:bluepadel/Features/otp/otp_screen.dart';
import 'package:bluepadel/Services/supabaseservies.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ynwltfywuxlmecrcgprz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlud2x0Znl3dXhsbWVjcmNncHJ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE4ODkzMTAsImV4cCI6MjA1NzQ2NTMxMH0.lCpWj_neryCr6iqr2l81hrIY6o4HZB_3RCUuRfOhCH4',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          color: Colors.purple, // Sets the AppBar color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            maximumSize: const Size(200, 100),
            minimumSize: const Size(200, 100),
            backgroundColor:
                Colors.purple.withOpacity(0.8), // Sets button color
          ),
        ),
      ),
      home: const LoginScreen(),
      routes: {
        Register.routeName: (context) => const Register(),
        RegisterExercise.routeName: (context) => const RegisterExercise(),
        HowManyExerciseView.routeName: (context) => const HowManyExerciseView(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        // OtpScreen.routeName: (context) => OtpScreen(
        //       phoneNumber:
        //           '+1234567890', // Replace with the actual phone number
        //     ),
      },
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});
  static const String routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FF),
      ),
      backgroundColor: const Color(0xFFF5F7FF),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/blue_padel.png',
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A3F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Join our fitness community today',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  // First Name and Last Name side-by-side
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextFormField(
                            controller: firstNameController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Enter first name'),
                              MinLengthValidator(3,
                                  errorText: 'Minimum 3 characters required'),
                            ]).call,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            controller: lastNameController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Enter last name'),
                              MinLengthValidator(3,
                                  errorText: 'Minimum 3 characters required'),
                            ]).call,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Phone Number
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter mobile number'),
                      LengthRangeValidator(
                          min: 9, max: 9, errorText: 'Enter 9 digit number'),
                    ]).call,
                    decoration: InputDecoration(
                      hintText: '5XXXXXXXX',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5A48F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await SupabaseServices().adduser(
                              phoneController.text,
                              '${firstNameController.text} ${lastNameController.text}',
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('User registered successfully')),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Failed to register user: $e')),
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
