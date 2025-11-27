class GitHubUser {
  final String login;
  final String avatarUrl;
  final int publicRepos;
  final int followers;
  final int following;

  GitHubUser({
    required this.login,
    required this.avatarUrl,
    required this.publicRepos,
    required this.followers,
    required this.following,
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return GitHubUser(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      publicRepos: json['public_repos'],
      followers: json['followers'],
      following: json['following'],
    );
  }
}
