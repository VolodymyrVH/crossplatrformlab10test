class Resume {
  final id;
  final fullName;
  final hobbies;
  final currentSituation;
  final aboutMe;
  final gitHubUsername;

  Resume(
    {
      required this.id,
      required this.fullName,
      required this.hobbies,
      required this.currentSituation,
      required this.aboutMe,
      required this.gitHubUsername,
    }
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'hobbies': hobbies,
      'currentSituation': currentSituation,
      'aboutMe': aboutMe,
      'gitHubUsername': gitHubUsername,
    };
  }

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      id: map['id'] as int, 
      fullName: map['fullName'], 
      hobbies: map['hobbies'], 
      currentSituation: map['currentSituation'], 
      aboutMe: map['aboutMe'], 
      gitHubUsername: map['gitHubUsername']
    );
  }
}