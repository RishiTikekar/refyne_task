class RepositoryModel {
  final String fullName;
  final String description;
  final int forkCount;
  final String ownerAvatar;
  final String ownerLogin;
  final String ownerType;
  final int id;

  RepositoryModel({
    required this.id,
    required this.fullName,
    required this.forkCount,
    required this.description,
    required this.ownerAvatar,
    required this.ownerLogin,
    required this.ownerType,
  });

  factory RepositoryModel.fromMap(Map repoData) {
    return RepositoryModel(
      id: repoData['id'] ?? 0,
      fullName: repoData['full_name'] ?? "",
      forkCount: repoData['forks_count'] ?? 0,
      description: repoData['description'] ?? "",
      ownerAvatar: repoData['owner']['avatar_url'],
      ownerLogin: repoData['owner']['login'],
      ownerType: repoData['owner']['type'],
    );
  }
}
