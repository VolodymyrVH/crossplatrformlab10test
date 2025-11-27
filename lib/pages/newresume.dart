import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/resume.dart';
import '../viewmodels/resume_view_model.dart';

class NewResume extends StatelessWidget {
  final Resume? template;

  NewResume({super.key, this.template});

  final _fullNameController = TextEditingController();
  final _hobbiesController = TextEditingController();
  final _currentSituationController = TextEditingController();
  final _aboutMeController = TextEditingController();
  final _githubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (template != null) {
      _fullNameController.text = template!.fullName;
      _hobbiesController.text = template!.hobbies;
      _currentSituationController.text = template!.currentSituation;
      _aboutMeController.text = template!.aboutMe;
      _githubController.text = template!.gitHubUsername;
    }
    
    return Scaffold(
      appBar: AppBar(title: const Text("New Resume")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'Enter your Name'),
              ),
              TextFormField(
                controller: _hobbiesController,
                decoration: const InputDecoration(labelText: 'Write your hobbies'),
              ),
              TextFormField(
                controller: _currentSituationController,
                decoration: const InputDecoration(labelText: 'What do you do right now'),
              ),
              TextFormField(
                controller: _aboutMeController,
                decoration: const InputDecoration(labelText: 'Write something about you'),
              ),
              TextFormField(
                controller: _githubController,
                decoration: const InputDecoration(labelText: 'Your GitHub username'),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final newResume = Resume(
                        id: DateTime.now().millisecondsSinceEpoch,
                        fullName: _fullNameController.text,
                        hobbies: _hobbiesController.text,
                        currentSituation: _currentSituationController.text,
                        aboutMe: _aboutMeController.text,
                        gitHubUsername: _githubController.text,
                      );

                      final viewModel = context.read<ResumeViewModel>();
                      viewModel.addResume(newResume);

                      context.pop();
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
