import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notary_app/constants.dart';
import 'package:notary_app/components/rounded_button.dart';
import 'package:notary_app/screens/data_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const id = 'Login_Screen';
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
                buttonColor: Color(0xFF424242),
                onPress: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => data(
                        mailId: EmailController.text,
                      ),
                    ),
                  );
                },
                name: 'Login')
          ],
        ),
      ),
    );
  }
}
