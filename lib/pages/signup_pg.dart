import 'package:flutter/material.dart';
import '../models/user.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '', email = '', password = '', gender = 'Male';
  DateTime? dob;
  bool termsAccepted = false;

  final List<Map<String, String>> validUsers = [
    {"email": "ash@ex.com", "password": "123456"},
    {"email": "adi@example.com", "password": "abcdef"},
    {"email": "anik@example.com", "password": "mypassword"},
  ];

  void _submit() {
    if (_formKey.currentState!.validate() && termsAccepted) {
      _formKey.currentState!.save();
      bool isValidUser = validUsers.any(
        (user) => user['email'] == email && user['password'] == password,
      );

      if (isValidUser) {
        Navigator.pushNamed(
          context,
          '/welcome',
          arguments: User(
            fullName: fullName,
            email: email,
            gender: gender,
            dob: dob!,
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Invalid email or password")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Full Name"),
                validator:
                    (value) =>
                        value!.length < 3 ? 'Min 3 characters required' : null,
                onSaved: (val) => fullName = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator:
                    (val) =>
                        !val!.contains('@') || !val.contains('.')
                            ? 'Invalid email'
                            : null,
                onSaved: (val) => email = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator:
                    (val) =>
                        val!.length < 6 ? 'Min 6 characters required' : null,
                onSaved: (val) => password = val!,
              ),
              DropdownButtonFormField(
                value: gender,
                items:
                    ['Male', 'Female', 'Other']
                        .map((g) => DropdownMenuItem(child: Text(g), value: g))
                        .toList(),
                onChanged: (val) => gender = val!,
                decoration: InputDecoration(labelText: "Gender"),
              ),
              TextButton(
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => dob = picked);
                },
                child: Text(
                  dob == null
                      ? "Select Date of Birth"
                      : "DOB: ${dob!.toLocal()}".split(' ')[0],
                ),
              ),
              CheckboxListTile(
                title: Text("Accept Terms & Conditions"),
                value: termsAccepted,
                onChanged: (val) => setState(() => termsAccepted = val!),
              ),
              ElevatedButton(onPressed: _submit, child: Text("Log in")),
            ],
          ),
        ),
      ),
    );
  }
}
