import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lab10/viewmodels/theme_view_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('ThemeViewModel loads, toggles and saves theme mode', () async {
    final viewModel = ThemeViewModel();
    await viewModel.init();

    expect(viewModel.isDarkTheme, false);

    await viewModel.toggleTheme();
    expect(viewModel.isDarkTheme, true);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool('isDarkTheme'), true);

    await viewModel.toggleTheme();
    expect(viewModel.isDarkTheme, false);
    expect(prefs.getBool('isDarkTheme'), false);
  });
}
