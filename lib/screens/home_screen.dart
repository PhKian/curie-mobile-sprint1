import 'package:flutter/material.dart';

import '../data/demo_data.dart';
import '../widgets/curie_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.points,
    required this.completedCount,
    required this.onNavigate,
    super.key,
  });
  final int points;
  final int completedCount;
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFFDBEAFE),
              child: Icon(Icons.science, color: Color(0xFF1D4ED8)),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá, cientista!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('Pronto para descobrir algo novo?'),
                ],
              ),
            ),
            IconButton(
              onPressed: () => onNavigate(4),
              icon: const Icon(Icons.emoji_events_outlined),
              tooltip: 'Conquistas',
            ),
          ],
        ),
        const SizedBox(height: 22),
        Card(
          color: const Color(0xFF0B1730),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SUA JORNADA CIENTÍFICA',
                  style: TextStyle(
                    color: Color(0xFF67E8F9),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$points',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8, left: 8),
                      child: Text(
                        'pontos',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.auto_awesome,
                      color: Color(0xFFFBBF24),
                      size: 34,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: (completedCount / demoMissions.length).clamp(0, 1),
                    minHeight: 9,
                    backgroundColor: Colors.white24,
                    color: const Color(0xFF06B6D4),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$completedCount de ${demoMissions.length} missões concluídas',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF2563EB)),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'As medições e os pontos são demonstrativos e não representam dados científicos reais.',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        SectionTitle(
          'Continue explorando',
          action: 'Ver todas',
          onAction: () => onNavigate(1),
        ),
        const SizedBox(height: 8),
        ...demoMissions
            .take(2)
            .map(
              (mission) => Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFE0F2FE),
                    child: Icon(Icons.bolt, color: Color(0xFF0369A1)),
                  ),
                  title: Text(
                    mission.title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${mission.duration} • ${mission.points} pontos',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => onNavigate(1),
                ),
              ),
            ),
        const SizedBox(height: 16),
        SectionTitle('Seu laboratório'),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _QuickCard(
                icon: Icons.map_outlined,
                title: 'Mapa CURIE',
                color: const Color(0xFFDCFCE7),
                onTap: () => onNavigate(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _QuickCard(
                icon: Icons.forum_outlined,
                title: 'Marie',
                color: const Color(0xFFEDE9FE),
                onTap: () => onNavigate(3),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _QuickCard extends StatelessWidget {
  const _QuickCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: const Color(0xFF0B1730)),
            ),
            const SizedBox(height: 9),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    ),
  );
}
