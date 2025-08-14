import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList); // Provider: Estado inmutable / no cambia

final isDarkModeProvider = StateProvider((ref) => false); // StateProvider: Mantener, actualizar y tener un estado

final selectedColorProvider = StateProvider((ref) => 0);

// Objeto de tipo AppTheme (custom)          //* Clase que controla, Clase Tipo
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier()); //? Debemos mandar la primera instancia

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {

  // State = Estado = new AppTheme() o nueva instancia de AppTheme
  ThemeNotifier(): super( AppTheme() );
  
  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
  
}