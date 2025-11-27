import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/resume.dart';

class Homepage extends StatelessWidget {
  final Resume resume;
  const Homepage({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(resume.fullName)),
      body: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Welcome to my app!",
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(offset: Offset(2, 2), blurRadius: 4.0, color: Colors.black)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go("/about", extra: resume);
                },
                child: const Text('About me'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go("/hobbies", extra: resume);
                },
                child: const Text('Hobbies'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go("/current-situation", extra: resume);
                },
                child: const Text('Right Now'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go("/github-stats", extra: resume);
                },
                child: const Text('GitHub'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go("/", extra: resume);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}