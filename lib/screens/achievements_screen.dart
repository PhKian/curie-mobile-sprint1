import 'package:flutter/material.dart';

import '../data/demo_data.dart';
import '../widgets/curie_components.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({
    required this.points,
    required this.completedCount,
    super.key,
  });
  final int points;
  final int completedCount;
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Column(
      children: [
        const PageHeading(
          title: 'Conquistas',
          subtitle: 'Cada descoberta conta.',
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Card(
                color: const Color(0xFF0B1730),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.emoji_events,
                        size: 48,
                        color: Color(0xFFFBBF24),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$points pontos',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        completedCount == 1
                            ? '1 missão concluída'
                            : '$completedCount missões concluídas',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const SectionTitle('Distintivos'),
              _Badge(
                title: 'Primeira descoberta',
                description: 'Conclua sua primeira missão',
                icon: Icons.bolt,
                unlocked: completedCount >= 1,
              ),
              _Badge(
                title: 'Curioso nuclear',
                description: 'Conclua duas missões',
                icon: Icons.biotech,
                unlocked: completedCount >= 2,
              ),
              _Badge(
                title: 'Explorador CURIE',
                description: 'Conclua todas as missões',
                icon: Icons.workspace_premium,
                unlocked: completedCount >= demoMissions.length,
              ),
              const SizedBox(height: 12),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'Pontuação local da demonstração. Cada missão conta uma única vez e o progresso não é salvo após fechar o app.',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.title,
    required this.description,
    required this.icon,
    required this.unlocked,
  });
  final String title, description;
  final IconData icon;
  final bool unlocked;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: unlocked
            ? const Color(0xFFFEF3C7)
            : const Color(0xFFE5E7EB),
        child: Icon(
          icon,
          color: unlocked ? const Color(0xFFB45309) : Colors.grey,
        ),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(description),
      trailing: Icon(
        unlocked ? Icons.check_circle : Icons.lock_outline,
        color: unlocked ? Colors.green : Colors.grey,
      ),
    ),
  );
}
