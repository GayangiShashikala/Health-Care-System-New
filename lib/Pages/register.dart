import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../reusable_widget/reusable_widget.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

//Authenticate user
  Future signUp() async {
    if (passwordConfirmed()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
    //add user details
    addUserDetails(
        _firstnameController.text.trim(),
        _lastnameController.text.trim(),
        double.parse(_heightController.text.trim()),
        double.parse(_weightController.text.trim()),
        int.parse(_ageController.text.trim()),
        _emailController.text.trim());
  }

  Future addUserDetails(String firstName, String lastName, double height,
      double weight, int age, String email) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'First Name': firstName,
      'Last Name': lastName,
      'Age': age,
      'Height': height,
      'Weight': weight,
      'Email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background_login.PNG"),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text
              Text(
                "Register Now",
                style: GoogleFonts.bebasNeue(fontSize: 40),
              ),

              const SizedBox(height: 10),

              const Text(
                "Register below with your details",
                style: TextStyle(fontSize: 20),
              ),

              //First Name textfield

              const SizedBox(height: 10),
              reusableTextField("First Name", Icons.person_outline, false,
                  _firstnameController),

              //Last Name textfield

              const SizedBox(height: 10),
              reusableTextField("Last Name", Icons.person_outline, false,
                  _lastnameController),

              //Age textfield

              const SizedBox(height: 10),
              reusableTextField(
                  "Age", Icons.analytics_rounded, false, _ageController),

              //Height textfield

              const SizedBox(height: 10),
              reusableTextField("Height", Icons.help_outline_rounded, false,
                  _heightController),

              //Weight textfield

              const SizedBox(height: 10),
              reusableTextField("Weight", Icons.help_center_rounded, false,
                  _weightController),

              //Email textfield

              const SizedBox(height: 10),
              reusableTextField(
                  "Email", Icons.mail_sharp, false, _emailController),

              //Password textfield

              const SizedBox(height: 10),
              reusableTextField(
                  "Password", Icons.lock_outline, true, _passwordController),

              //Confirm Password textfield

              const SizedBox(height: 10),
              reusableTextField("Confirmed Password", Icons.lock_person, true,
                  _confirmpasswordController),

              const SizedBox(height: 20),
              //Sign In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: () {
                      signUp();
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return Colors.grey[800];
                        }),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30)))),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              //not a member Register button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I am a member..',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                      'Login Now',
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
