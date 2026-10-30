import 'package:flutter/material.dart';

import '../models/mission.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({
    required this.mission,
    required this.isCompleted,
    required this.onComplete,
    super.key,
  });
  final Mission mission;
  final bool isCompleted;
  final VoidCallback onComplete;
  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  bool _measured = false;
  double _reading = 0;
  void _takeReading() {
    setState(() {
      _reading = 0.08 + (widget.mission.id.hashCode.abs() % 12) / 100;
      _measured = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Missão educativa')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              widget.mission.title,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  widget.mission.description,
                  style: const TextStyle(height: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Card(
              color: const Color(0xFFEFF6FF),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, color: Color(0xFF2563EB)),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'SIMULAÇÃO EDUCATIVA: esta leitura é gerada localmente, não usa sensor e não representa uma medição real.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (!_measured)
              FilledButton.icon(
                onPressed: _takeReading,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Iniciar simulação'),
              )
            else
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.sensors,
                        size: 48,
                        color: Color(0xFF2563EB),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Leitura simulada',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${_reading.toStringAsFixed(2)} µSv/h',
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B1730),
                        ),
                      ),
                      const Text('Valor fictício para fins educativos'),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20),
            if (_measured && !widget.isCompleted)
              FilledButton.icon(
                key: const ValueKey('completeMissionButton'),
                onPressed: () {
                  widget.onComplete();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.task_alt),
                label: Text(
                  'Concluir missão • +${widget.mission.points} pontos',
                ),
              ),
            if (widget.isCompleted)
              const Card(
                child: ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text('Missão já concluída'),
                  subtitle: Text('Os pontos não serão adicionados novamente.'),
                ),
              ),
            if (_measured && !widget.isCompleted)
              TextButton(
                onPressed: _takeReading,
                child: const Text('Gerar outra leitura'),
              ),
          ],
        ),
      ),
    );
  }
}
