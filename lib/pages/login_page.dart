import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLoginSuccess;
  final VoidCallback onGoToSignUp;

  const LoginPage({
    super.key,
    required this.onLoginSuccess,
    required this.onGoToSignUp,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorEmail;
  String? errorPassword;
  String? loginError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.shopping_bag, color: Colors.yellow[700], size: 80),
                const SizedBox(height: 12),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Login to your shoe store account',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    errorText: errorEmail,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    errorText: errorPassword,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  obscureText: true,
                ),
                if (loginError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 6),
                    child: Text(
                      loginError!,
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Login', style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    setState(() {
                      errorEmail = emailController.text.isEmpty
                          ? 'Please fill up'
                          : null;
                      errorPassword = passwordController.text.isEmpty
                          ? 'Please fill up'
                          : null;
                      loginError = null;
                    });
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      return;
                    }
                    if (passwordController.text.length < 6) {
                      setState(() {
                        loginError = "Password must be at least 6 characters";
                      });
                      return;
                    }
                    // Implement your own authentication logic here
                    widget.onLoginSuccess();
                  },
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not registered yet?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: widget.onGoToSignUp,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                SizedBox(
                  height: 130,
                  child: Image.asset(
                    'assets/images/shoe_login.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
