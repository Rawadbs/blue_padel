import 'package:bluepadel/Features/Register%20exsersize/view/registerexercise.dart';
import 'package:bluepadel/Features/howmanyexexercize/howmanyexexercizeview.dart';
import 'package:bluepadel/Features/option/optionview.dart';
import 'package:bluepadel/Services/supabaseservies.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jcxzocmwwjsecfstztop.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjeHpvY213d2pzZWNmc3R6dG9wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA3MzM3ODEsImV4cCI6MjA0NjMwOTc4MX0.dUYzfr_OBMR-SIUpjUobXh2tLT6yqDWblevKd85DqAg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const Optionview(),
      routes: {
        Register.routeName: (context) => const Register(),
        Registerexercise.routeName: (context) => const Registerexercise(),
        howmanyexexercizeview.routeName: (context) =>
            const howmanyexexercizeview(),
      },
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('register'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Container(
                            width: 200,
                            height: 150,
                            //decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(40),
                            //border: Border.all(color: Colors.blueGrey)),
                            child: Placeholder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: controller,
                        // validator: ((value) {
                        // if (value == null || value.isEmpty) {
                        //	 return 'please enter some text';
                        // } else if (value.length < 5) {
                        //	 return 'Enter atleast 5 Charecter';
                        // }

                        // return null;
                        // }),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter first named'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 charecter filled name'),
                        ]),

                        decoration: InputDecoration(
                            hintText: 'Enter first Name',
                            labelText: 'first named',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller1,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter last named'),
                          MinLengthValidator(3,
                              errorText:
                                  'Last name should be atleast 3 charater'),
                        ]),
                        decoration: InputDecoration(
                            hintText: 'Enter last Name',
                            labelText: 'Last named',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller2,
                        keyboardType: TextInputType.number,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter mobile number'),
                          LengthRangeValidator(
                              min: 9,
                              max: 9,
                              errorText: 'Enter 9 digit number'),
                        ]),
                        decoration: InputDecoration(
                            hintText: 'Mobile',
                            labelText: 'Mobile',
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9)))),
                      ),
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        // margin: EdgeInsets.fromLTRB(200, 20, 50, 0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              
                              SupabaseServices supabaseServices =
                                  SupabaseServices();
                              supabaseServices.adduser(controller2.text,
                                  controller.text + " " + controller1.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('add user')),
                              );
                            }
                          },
                        ),

                        width: MediaQuery.of(context).size.width,

                        height: 50,
                      ),
                    )),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 90),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                            ),
                            Container(
                              height: 70,
                              width: 70,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
