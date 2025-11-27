import 'package:lab10/models/resume.dart';
import 'package:lab10/services/db/database_helper.dart';

class ResumeRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Resume>> getAll() async {
    return await _dbHelper.getAllResumes();
  }

  Future<void> addResume(Resume resume) async {
    await _dbHelper.insertResume(resume);
  }

  Future<void> deleteResume(int id) async {
    await _dbHelper.deleteResume(id);
  }

}