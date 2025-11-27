import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/resume.dart';
import 'package:lab10/viewmodels/git_hub_view_model.dart';
import 'package:provider/provider.dart';

class GithubStats extends StatelessWidget {
  const GithubStats({super.key, required Resume resume});

  @override
  Widget build(BuildContext context) {
    final resume = GoRouterState.of(context).extra as Resume;
    final viewModel = context.watch<GitHubViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text("${resume.fullName} GitHub stats")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resume.gitHubUsername,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            if (viewModel.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (viewModel.user != null)
              Text(
                "Repositories: ${viewModel.user!.publicRepos}",
                style: const TextStyle(fontSize: 20),
              )
            else
              ElevatedButton(
                onPressed: () {
                  viewModel.fetchUser(resume.gitHubUsername);
                },
                child: const Text("Download stats"),
              ),

            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go("/homepage", extra: resume);
                },
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
