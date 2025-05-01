import 'package:flutter/material.dart';
import '../models/user.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            user == null
                ? Center(child: Text("No user data found!"))
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, ${user.fullName}!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Email: ${user.email}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Gender: ${user.gender}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'DOB: ${user.dob.day}/${user.dob.month}/${user.dob.year}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      child: Text("Go to About Us"),
                    ),
                  ],
                ),
      ),
    );
  }
}
