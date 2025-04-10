import 'package:bluepadel/Features/option/optionview.dart';
import 'package:bluepadel/Services/supabaseservies.dart';
import 'package:bluepadel/Services/urllancherservies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterExercise extends StatefulWidget {
  const RegisterExercise({super.key});
  static const String routeName = '/registerexercise';

  @override
  State<RegisterExercise> createState() => _RegisterExerciseState();
}

class _RegisterExerciseState extends State<RegisterExercise> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FF),
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, OptionView.routeName);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'Confirm Your Exercise',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A3F),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          9), // ✅ يمنع المستخدم من تجاوز 9 أرقام
                    ],
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter mobile number'),
                      LengthRangeValidator(
                        min: 9,
                        max: 9,
                        errorText: 'Enter 9 digit number',
                      ),
                    ]).call,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'ex: 553610108 (without leading zero)',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5A48F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final phone = controller.text;

                          final exists =
                              await SupabaseServices().isuserexist(phone);

                          if (!exists) {
                            _showSnackBar('Phone number is not registered');
                            return; // لا تكمل التنفيذ
                          }

                          int session =
                              await SupabaseServices().getcurrentsession(phone);

                          if (session == 0) {
                            _showSnackBar(
                                'Please add at least one exercise first');
                          } else {
                            await SupabaseServices()
                                .updatecurrentsession(phone, session - 1);

                            _showSnackBar('Exercise registered successfully');

                            openWhatsAppWeb(phone, '''
شكرا لاختياركم ملاعب بلو بادل مكة
تم تسجيل حضوركم التمرين بنجاح
عدد التمارين المتبقية ${session - 1}
في انتظاركم التمرين القادم
فريق
Blue Padel Makkah
''');
                          }
                        }
                      },
                      child: const Text(
                        'Confirm Your Exercise',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
