import 'package:bluepadel/Services/supabaseservies.dart';
import 'package:bluepadel/Services/urllancherservies.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class HowManyExerciseView extends StatefulWidget {
  const HowManyExerciseView({super.key});
  static const routeName = '/howmanyexexercizeview';

  @override
  State<HowManyExerciseView> createState() => _HowManyExerciseViewState();
}

class _HowManyExerciseViewState extends State<HowManyExerciseView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController sessionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FF),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Register Your Exercise',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A3F),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Register your sessions easily with your phone number',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(24),
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    )
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: sessionsController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter number of exercises',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'ex: 553610108 without zero',
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter mobile number'),
                          LengthRangeValidator(
                            min: 9,
                            max: 9,
                            errorText: 'Enter a 9-digit number',
                          ),
                        ]).call,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5A48F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SupabaseServices().addnewsession(
                                phoneController.text,
                                int.parse(sessionsController.text),
                              );
                              openWhatsAppWeb(phoneController.text, '''
بادل مكة
تم تأكيد تسجيل اشتراككم في عدد(${sessionsController.text}) تمارين بنجاح

شكرا لثقتكم بنا 
Blue Padel Makkah
''');
                            }
                          },
                          child: const Text(
                            'Register Exercise',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
