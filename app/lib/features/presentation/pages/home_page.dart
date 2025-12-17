import 'package:app/features/presentation/widgets/repos_crad.dart';
import 'package:flutter/material.dart';
import 'package:app/features/core/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: const Color(0xffF2F4F7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Top starred repositories created in the last 60 days.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                repoCard(
                  name: 'flutter_riverpod',
                  description:
                      'A simple and scalable state management solution for Flutter.',
                  stars: '4.5k',
                  owner: 'rrousselGit',
                ),
                repoCard(
                  name: 'langchain',
                  description:
                      'Building applications with LLMs through composable components.',
                  stars: '3.8k',
                  owner: 'hwchase17',
                ),
                repoCard(
                  name: 'github-readme-activity-graph',
                  description:
                      'A dynamically generated activity graph for your README.',
                  stars: '3.2k',
                  owner: 'ashutosh00710',
                ),
                repoCard(
                  name: 'open-interpreter',
                  description:
                      'Run code in natural language. Sandbox for AI agents.',
                  stars: '2.9k',
                  owner: 'killian',
                ),
                repoCard(
                  name: 'suno-bark',
                  description:
                      'Generative audio model that can synthesize realistic speech.',
                  stars: '2.5k',
                  owner: 'suno-ai',
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'Loading more...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
