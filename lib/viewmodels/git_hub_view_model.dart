import 'package:flutter/foundation.dart';
import 'package:lab10/models/github_user.dart';
import 'package:lab10/repository/github_repository.dart';

class GitHubViewModel extends ChangeNotifier {
  final GitHubRepository _repository;

  GitHubViewModel(this._repository);

  GitHubUser? _user;
  bool _isLoading = false;
  String? _errorMessage;

  GitHubUser? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUser(String username) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _repository.getUser(username);
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
