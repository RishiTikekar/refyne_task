import 'package:flutter/material.dart';
import 'package:testassign/feature/respository_screen/models/repository_model.dart';

class RepositoryDetailScreen extends StatelessWidget {
  final RepositoryModel repository;
  const RepositoryDetailScreen({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repo Details"),
      ),
      body: Column(
        children: [
          Text(repository.fullName),
          const SizedBox(height: 16),
          Text(repository.description),
          const SizedBox(height: 16),
          Text("${repository.id}"),
          const SizedBox(height: 16),
          Text(repository.ownerAvatar),
          const SizedBox(height: 16),
          Text(repository.ownerLogin),
          const SizedBox(height: 16),
          Text(repository.ownerType),
          const SizedBox(height: 16),
          Text("${repository.forkCount}"),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
