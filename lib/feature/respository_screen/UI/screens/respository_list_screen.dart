import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testassign/app_routing/pages.dart';
import 'package:testassign/app_routing/router_delegate.dart';
import 'package:testassign/constants/enums.dart';
import 'package:testassign/feature/respository_screen/models/repository_model.dart';
import 'package:testassign/feature/respository_screen/providers/repo_list_pvd.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RepoListPvd()),
      ],
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final repoListPvd = context.watch<RepoListPvd>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Repository list"),
      ),
      body: switch (repoListPvd.currentState) {
        States.loading || States.none => const _LoadingWidget(),
        States.empty => const _EmptyStateWidget(),
        States.success => const _RepositoryListSection(),
        States.error => const _ErrorWidget(),
      },
    );
  }
}

class _RepositoryListSection extends StatelessWidget {
  const _RepositoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final repoListPvd = context.read<RepoListPvd>();
    return ListView.builder(
      itemBuilder: (_, index) => _RepositoryListTile(
        repository: repoListPvd.repositories[index],
      ),
      itemCount: repoListPvd.repositories.length,
    );
  }
}

class _RepositoryListTile extends StatelessWidget {
  final RepositoryModel repository;
  const _RepositoryListTile({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => RDelegate.i.pushRoute(
        RepoDetailsPage(repository: repository),
      ),
      title: Text(repository.fullName),
      subtitle: Text(repository.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.abc),
          const SizedBox(width: 8),
          Text("${repository.forkCount}"),
        ],
      ),
    );
  }
}

class _EmptyStateWidget extends StatelessWidget {
  const _EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("You dont have any repositories available");
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator());
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final repoListPvd = context.read<RepoListPvd>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Something went wrong!"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => repoListPvd.init(),
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }
}
