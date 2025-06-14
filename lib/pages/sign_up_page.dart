import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onSignUpSuccess;
  final VoidCallback onGoToLogin;

  const SignUpPage({
    super.key,
    required this.onSignUpSuccess,
    required this.onGoToLogin,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? errorEmail;
  String? errorUsername;
  String? errorPassword;
  String? errorConfirmPassword;
  String? signUpError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.yellow[700]),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.shopping_bag_outlined, color: Colors.yellow[700], size: 70),
                const SizedBox(height: 10),
                Text(
                  'Create Account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 34),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    errorText: errorEmail,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person_outline),
                    errorText: errorUsername,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    errorText: errorPassword,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    errorText: errorConfirmPassword,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  obscureText: true,
                ),
                if (signUpError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 6),
                    child: Text(signUpError!, style: TextStyle(color: Colors.red, fontSize: 13)),
                  ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Sign Up', style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    setState(() {
                      errorEmail = emailController.text.isEmpty ? 'Please fill up' : null;
                      errorUsername = usernameController.text.isEmpty ? 'Please fill up' : null;
                      errorPassword = passwordController.text.isEmpty ? 'Please fill up' : null;
                      errorConfirmPassword = confirmPasswordController.text.isEmpty ? 'Please fill up' : null;
                      signUpError = null;
                    });
                    if (emailController.text.isEmpty ||
                        usernameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      return;
                    }
                    if (passwordController.text.length < 6) {
                      setState(() {
                        signUpError = "Password must be at least 6 characters";
                      });
                      return;
                    }
                    if (passwordController.text != confirmPasswordController.text) {
                      setState(() {
                        signUpError = "Password didn't matched";
                      });
                      return;
                    }
                    widget.onSignUpSuccess();
                  },
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?', style: TextStyle(color: Colors.grey[600])),
                    TextButton(
                      onPressed: widget.onGoToLogin,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.yellow[700], fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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