import 'package:flutter/material.dart';

import 'data/demo_data.dart';
import 'models/mission.dart';
import 'screens/achievements_screen.dart';
import 'screens/home_screen.dart';
import 'screens/marie_screen.dart';
import 'screens/map_screen.dart';
import 'screens/measurement_screen.dart';
import 'screens/missions_screen.dart';
import 'screens/observation_form_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(const CurieApp());

class CurieApp extends StatelessWidget {
  const CurieApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'CURIE',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2563EB),
        primary: const Color(0xFF2563EB),
        secondary: const Color(0xFF06B6D4),
        surface: const Color(0xFFF4F7FB),
      ),
      scaffoldBackgroundColor: const Color(0xFFF4F7FB),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF4F7FB)),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
    home: const WelcomeScreen(),
  );
}

class CurieShell extends StatefulWidget {
  const CurieShell({super.key});

  @override
  State<CurieShell> createState() => _CurieShellState();
}

class _CurieShellState extends State<CurieShell> {
  int _tab = 0;
  final Set<String> _completed = {};

  int get _points => _completed.fold(0, (sum, id) {
    final mission = demoMissions.firstWhere((item) => item.id == id);
    return sum + mission.points;
  });

  void _complete(Mission mission) {
    final added = _completed.add(mission.id);
    if (added) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        points: _points,
        completedCount: _completed.length,
        onNavigate: (index) => setState(() => _tab = index),
      ),
      MissionsScreen(
        completedIds: _completed,
        onOpen: (mission) => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => MeasurementScreen(
              mission: mission,
              isCompleted: _completed.contains(mission.id),
              onComplete: () => _complete(mission),
            ),
          ),
        ),
      ),
      const MapScreen(),
      const MarieScreen(),
      AchievementsScreen(points: _points, completedCount: _completed.length),
    ];
    return Scaffold(
      body: IndexedStack(index: _tab, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Missões',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Mapa',
          ),
          NavigationDestination(
            icon: Icon(Icons.forum_outlined),
            selectedIcon: Icon(Icons.forum),
            label: 'Marie',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            selectedIcon: Icon(Icons.emoji_events),
            label: 'Conquistas',
          ),
        ],
      ),
      floatingActionButton: _tab == 0
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const ObservationFormScreen(),
                ),
              ),
              icon: const Icon(Icons.edit_note),
              label: const Text('Registrar observação'),
            )
          : null,
    );
  }
}
