import 'package:flutter/material.dart';

import '../data/demo_data.dart';
import '../models/mission.dart';
import '../widgets/curie_components.dart';

class MissionsScreen extends StatelessWidget {
  const MissionsScreen({
    required this.completedIds,
    required this.onOpen,
    super.key,
  });
  final Set<String> completedIds;
  final ValueChanged<Mission> onOpen;
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Column(
      children: [
        const PageHeading(
          title: 'Missões',
          subtitle: 'Aprenda ciência em pequenas descobertas.',
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: demoMissions.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final mission = demoMissions[index];
              final done = completedIds.contains(mission.id);
              return Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => onOpen(mission),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: const Color(0xFFE0F2FE),
                          child: Icon(
                            [
                              Icons.radar,
                              Icons.hourglass_bottom,
                              Icons.health_and_safety,
                            ][index],
                            color: const Color(0xFF0369A1),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mission.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(mission.subtitle),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 14,
                                runSpacing: 6,
                                children: [
                                  InfoPill(
                                    icon: Icons.schedule,
                                    label: mission.duration,
                                  ),
                                  InfoPill(
                                    icon: Icons.star_outline,
                                    label: '${mission.points} pts',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          done ? Icons.check_circle : Icons.chevron_right,
                          color: done ? Colors.green : null,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
