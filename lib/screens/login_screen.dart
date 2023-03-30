import 'package:flutter/material.dart';
import 'package:notary_app/components/rounded_button.dart';
import 'package:notary_app/screens/data_screen.dart';
import 'package:notary_app/components/get_class.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  String mailId = '';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  TextEditingController EmailController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.24,
            ),
            Container(
              height: 30.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xFF000000),
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: EmailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Color(0xFF000000),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            roundButton(
                buttonColor: Color.fromARGB(255, 15, 8, 8),
                onPress: () async {
                  if (EmailController.text != '') {
                    setState(() {
                      isLoading = true;
                    });

                    UserController saveUser = UserController();
                    await saveUser.makePostRequest(EmailController.text);
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => data(
                          newUser: saveUser,
                        ),
                      ),
                    );
                  }
                },
                name: 'Login'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            isLoading
                ? LoadingBouncingLine.circle(
                    backgroundColor: Color.fromARGB(255, 15, 8, 8),
                    borderColor: Color.fromARGB(255, 15, 8, 8),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
