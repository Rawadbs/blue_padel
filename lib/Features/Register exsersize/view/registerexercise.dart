import 'package:bluepadel/Services/supabaseservies.dart';
import 'package:bluepadel/Services/urllancherservies.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Registerexercise extends StatefulWidget {
  const Registerexercise({super.key});

  static const String routeName = '/registerexercise';

  @override
  State<Registerexercise> createState() => _RegisterexerciseState();
}

class _RegisterexerciseState extends State<Registerexercise> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Exercise'),
      ),
      body: Center(
          child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: controller,
                  validator: MultiValidator([
                    LengthRangeValidator(
                        min: 9, max: 9, errorText: 'Enter 9 digit number'),
                    RequiredValidator(errorText: 'Enter mobile number'),
                   
                  ]),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'ex: 553610108 without zero in start',
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                  )),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  int session = await SupabaseServices()
                      .getcurrentsession(controller.text);
                  if (session == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Please add at least one exercise first')),
                    );
                  }
                  else {
                     SupabaseServices().updatecurrentsession(controller.text, session-1);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Exercise registered successfully')),
                    );
                    openWhatsAppWeb( controller.text, '''
شكرا لاختياركم ملاعب بلو بادل مكة
تم تسجيل حضوركم  التمرين بنجاح
عدد التمارين المتبقية ${session-1}
في انتظاركم التمرين القادم
فريق
Blue Padel Makkah
''');

                  }
     
                }
              },
              child: Text(
                'Register Exercise',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
