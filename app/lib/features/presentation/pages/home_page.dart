import 'package:app/features/core/const/app_scroll_ctrl.dart';
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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RepoProvider>().loadRepos();
    });

    AppScrollCtrl.scrollController.addListener(() {
      final provider = context.read<RepoProvider>();

      if (AppScrollCtrl.scrollController.position.pixels >=
          AppScrollCtrl.scrollController.position.maxScrollExtent - 200) {
        provider.loadMore();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),

      backgroundColor: const Color(0xffF2F4F7),
      body: Consumer<RepoProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            controller: AppScrollCtrl.scrollController,
            itemCount: value.repos.length + 1,
            itemBuilder: (_, index) {
              if (index == value.repos.length) {
                return value.isMoreLoading
                    ? const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const SizedBox();
              }

              final repo = value.repos[index];
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
