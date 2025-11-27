import 'package:lab10/repository/resume_repository.dart';
import 'package:lab10/models/resume.dart';
import 'package:flutter/material.dart';

class ResumeViewModel extends ChangeNotifier {
  final ResumeRepository _repository = ResumeRepository();

  List<Resume> _resumes = [];
  bool _isLoading = true;

  List<Resume> get resumes => _resumes;
  bool get isLoading => _isLoading;

  ResumeViewModel() {
    loadResumes();
  }

  Future<void> loadResumes() async {
    _isLoading = true;
    notifyListeners();

    _resumes = await _repository.getAll();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addResume(Resume resume) async {
    await _repository.addResume(resume);
    await loadResumes();
  }

  Future<void> deleteResume(int id) async {
    await _repository.deleteResume(id);
    await loadResumes();
  }

  Resume? getById(int id) {
    try {
      return _resumes.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }
}