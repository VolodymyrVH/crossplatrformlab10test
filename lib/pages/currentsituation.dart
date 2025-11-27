import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/resume.dart';

class MySituation extends StatelessWidget {
  const MySituation({super.key, required Resume resume});

  @override
  Widget build(BuildContext context) {
    final resume = GoRouterState.of(context).extra as Resume;

    return Scaffold(
      appBar: AppBar(title: Text("${resume.fullName} - Right Now")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(resume.currentSituation, style: const TextStyle(fontSize: 24)),
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