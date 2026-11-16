import 'package:flutter/material.dart';
import 'screens/main_menu.dart';
import 'screens/map_selection.dart';
import 'screens/pusaka_screen.dart';
import 'screens/koleksi_screen.dart';
import 'screens/profile_settings_screen.dart';

void main() {
  runApp(const TubanQuestApp());
}

class TubanQuestApp extends StatefulWidget {
  const TubanQuestApp({super.key});

  @override
  State<TubanQuestApp> createState() => _TubanQuestAppState();
}

class _TubanQuestAppState extends State<TubanQuestApp> {
  int _currentIndex = 0;
  int _userCoins = 0;
  String _playerName = 'Pemain Hebat';

  bool _isSoundOn = true;
  bool _isVibrationOn = true;
  bool _isDarkMode = false;
  Color _primaryColor = const Color(0xFF007AFF);
  int _selectedColorIndex = 0;

  void _addCoins(int amount) {
    setState(() {
      _userCoins += amount;
    });
  }

  void _updatePlayerName(String newName) {
    setState(() {
      _playerName = newName;
    });
  }

  void _changeThemeColor(Color color, int index) {
    setState(() {
      _primaryColor = color;
      _selectedColorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      MainMenuScreen(playerName: _playerName, primaryColor: _primaryColor),
      MapSelectionScreen(
        userCoins: _userCoins,
        onCoinEarned: _addCoins,
        primaryColor: _primaryColor,
      ),
      PusakaScreen(userCoins: _userCoins, primaryColor: _primaryColor),
      const KoleksiScreen(),
      ProfileSettingsScreen(
        playerName: _playerName,
        onNameChanged: _updatePlayerName,
        isSoundOn: _isSoundOn,
        isVibrationOn: _isVibrationOn,
        isDarkMode: _isDarkMode,
        primaryColor: _primaryColor,
        selectedColorIndex: _selectedColorIndex,
        onSoundChanged: (val) => setState(() => _isSoundOn = val),
        onVibrationChanged: (val) => setState(() => _isVibrationOn = val),
        onDarkModeChanged: (val) => setState(() => _isDarkMode = val),
        onColorChanged: _changeThemeColor,
      ),
    ];

    final Color cardColor = _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    return MaterialApp(
      title: 'Tuban Quest',
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF2F5F9),
        primaryColor: _primaryColor,
        cardColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: _primaryColor,
        cardColor: const Color(0xFF1E1E1E),
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: cardColor,
            border: Border(top: BorderSide(color: _isDarkMode ? Colors.white10 : const Color(0xFFE5E9F0), width: 1)),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: cardColor,
            selectedItemColor: _primaryColor,
            unselectedItemColor: _isDarkMode ? Colors.white54 : const Color(0xFF8E8E93),
            selectedFontSize: 11,
            unselectedFontSize: 11,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Beranda'),
              BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'Peta'),
              BottomNavigationBarItem(icon: Icon(Icons.shield_rounded), label: 'Pusaka'),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Koleksi'),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
            ],
          ),
        ),
      ),
    );
  }
}