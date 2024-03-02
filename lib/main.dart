import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Text('Login form'),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  const Text('Username: '),
                  SizedBox(
                    width: 250,
                    height: 30,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide())),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  const Text('Password: '),
                  SizedBox(
                    width: 250,
                    height: 30,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide())),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Log in')),
          ],
        ),
      ),
    );
  }
}
