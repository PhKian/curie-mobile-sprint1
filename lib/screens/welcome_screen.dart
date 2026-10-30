import 'package:flutter/material.dart';

import '../main.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B1730), Color(0xFF123B70), Color(0xFF2563EB)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.science_outlined,
                  color: Color(0xFF67E8F9),
                  size: 42,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'CURIE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Ciência nuclear mais perto de você.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Aprenda, explore e descubra. Um laboratório educativo em cada escola.',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: .78),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(builder: (_) => const CurieShell()),
                  ),
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Começar exploração'),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF06B6D4),
                    foregroundColor: const Color(0xFF0B1730),
                    padding: const EdgeInsets.symmetric(vertical: 17),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Projeto educacional • Leituras demonstrativas',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .68),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
