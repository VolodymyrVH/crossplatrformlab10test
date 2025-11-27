import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/resume.dart';

class MyHobbies extends StatelessWidget {
  const MyHobbies({super.key, required Resume resume});

  @override
  Widget build(BuildContext context) {
    final resume = GoRouterState.of(context).extra as Resume;

    return Scaffold(
      appBar: AppBar(title: Text("${resume.fullName} - Hobbies")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(resume.hobbies, style: const TextStyle(fontSize: 24)),
            ElevatedButton(
                onPressed: () {
                  context.go("/homepage", extra: resume);
                },
                child: const Text('Back'),
              ),
          ],
        )
      ),
    );
  }
}