import 'package:app/features/presentation/provider/repo_provider.dart';
import 'package:app/features/presentation/widgets/repos_crad.dart';
import 'package:flutter/material.dart';
import 'package:app/features/core/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RepoProvider>().loadRepos();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: const Color(0xffF2F4F7),
      body: Consumer<RepoProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: value.repos.length,
            itemBuilder: (_, i) {
              final repo = value.repos[i];
              return repoCard(
                image: repo.owner.avatarUrl,
                name: repo.name,
                description: repo.description,
                stars: repo.stars.toString(),
                owner: repo.owner.username,
              );
            },
          );
        },
      ),
    );
  }
}
