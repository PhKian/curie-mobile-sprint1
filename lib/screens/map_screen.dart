import 'package:flutter/material.dart';

import '../data/demo_data.dart';
import '../widgets/curie_components.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Column(
      children: [
        const PageHeading(
          title: 'Mapa CURIE',
          subtitle: 'Ciência cidadã em uma demonstração local.',
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              Card(
                color: const Color(0xFF0B1730),
                child: SizedBox(
                  height: 190,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CustomPaint(painter: _GridPainter()),
                      ),
                      const Center(
                        child: Icon(
                          Icons.public,
                          color: Color(0xFF67E8F9),
                          size: 88,
                        ),
                      ),
                      const Positioned(left: 22, top: 30, child: _MapDot()),
                      const Positioned(right: 36, top: 58, child: _MapDot()),
                      const Positioned(left: 72, bottom: 28, child: _MapDot()),
                      const Positioned(right: 80, bottom: 32, child: _MapDot()),
                      const Positioned(
                        left: 16,
                        bottom: 12,
                        child: Text(
                          'VISUALIZAÇÃO ILUSTRATIVA',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Color(0xFF2563EB)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Locais e valores abaixo são fictícios. Esta Sprint não coleta nem envia dados.',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const SectionTitle('Registros demonstrativos'),
              ...demoReadings.map(
                (reading) => Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFDCFCE7),
                      child: Icon(Icons.place, color: Color(0xFF047857)),
                    ),
                    title: Text(reading['place']! as String),
                    subtitle: Text('${reading['city']} • ${reading['date']}'),
                    trailing: Text(
                      '${reading['value']} µSv/h',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B1730),
                      ),
                    ),
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

class _MapDot extends StatelessWidget {
  const _MapDot();
  @override
  Widget build(BuildContext context) => Container(
    width: 14,
    height: 14,
    decoration: BoxDecoration(
      color: const Color(0xFF34D399),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF34D399).withValues(alpha: .55),
          blurRadius: 12,
          spreadRadius: 4,
        ),
      ],
    ),
  );
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: .07)
      ..strokeWidth = 1;
    for (var x = 0.0; x < size.width; x += 28) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y < size.height; y += 28) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
