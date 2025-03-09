import 'package:bluepadel/Services/supabaseservies.dart';
import 'package:bluepadel/Services/urllancherservies.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class howmanyexexercizeview extends StatefulWidget {
  const howmanyexexercizeview({super.key});
  static const routeName = '/howmanyexexercizeview';

  @override
  State<howmanyexexercizeview> createState() => _howmanyexexercizeviewState();
}

class _howmanyexexercizeviewState extends State<howmanyexexercizeview> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

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
                keyboardType: TextInputType.number,
                controller: controller2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter number of exercises',
                ),
              ),
            ),
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
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  
                 
                      SupabaseServices().addnewsession(
                          controller.text, int.parse(controller2.text));
                      openWhatsAppWeb(controller.text,
                        '''
 بادل مكة
تم تأكيد تسجيل اشتراككم في عدد(${controller2.text}) تمارين بنجاح


شكرا لثقتكم بنا 
Blue Padel Makkah
''');
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
