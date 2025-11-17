import 'package:chat_app/combonents/my_button.dart';
import 'package:chat_app/combonents/my_text_fields.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/views/register_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();

    // signIn user
    void signIn() async {
      final authService = Provider.of<AuthService>(context, listen: false);
      try {
        await authService.signInWithEmailandPassword(
          emailcontroller.text.trim(),
          passwordcontroller.text.trim(),
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Icon
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.message_rounded,
                    size: 80,
                    color: Colors.green.shade600,
                  ),
                ),
                SizedBox(height: 20),

                // Title
                Text(
                  "Welcome Back",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Login to continue chatting",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),

                SizedBox(height: 40),

                // Email field
                MyTextField(
                  controller: emailcontroller,
                  hintText: 'Enter your email',
                ),
                SizedBox(height: 20),

                // Password field
                MyTextField(
                  controller: passwordcontroller,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
                SizedBox(height: 30),

                // Sign in button
                MyButton(onTap: signIn, text: 'Sign In'),

                SizedBox(height: 30),

                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.7, color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.7, color: Colors.grey[400]),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // Register option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(color: Colors.grey[800], fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
