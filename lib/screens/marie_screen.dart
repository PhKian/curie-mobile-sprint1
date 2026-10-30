import 'package:flutter/material.dart';

import '../data/demo_data.dart';
import '../widgets/curie_components.dart';

class MarieScreen extends StatefulWidget {
  const MarieScreen({super.key});
  @override
  State<MarieScreen> createState() => _MarieScreenState();
}

class _MarieScreenState extends State<MarieScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final List<(bool, String)> _messages = [
    (
      false,
      'Olá! Sou Marie, sua tutora demonstrativa. Escolha um tema ou escreva uma pergunta sobre ciência nuclear.',
    ),
  ];
  void _ask(String question) {
    final text = question.trim();
    if (text.isEmpty) return;
    _controller.clear();
    FocusScope.of(context).unfocus();
    final lowerQuestion = text.toLowerCase();
    final key = lowerQuestion.contains('radia')
        ? 'radia'
        : lowerQuestion.contains('meia-vida')
        ? 'meia-vida'
        : lowerQuestion.contains('seguran')
        ? 'seguranca'
        : lowerQuestion.contains('curie')
        ? 'curie'
        : '';
    final answer =
        marieAnswers[key] ??
        'Ainda estou aprendendo sobre esse tema nesta demonstração. Experimente perguntar sobre radiação, meia-vida, segurança ou CURIE.';
    setState(() {
      _messages.add((true, text));
      _messages.add((false, answer));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Column(
      children: [
        const PageHeading(
          title: 'Marie',
          subtitle: 'Tutora de ciências • respostas locais',
        ),
        Expanded(
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                color: const Color(0xFFEDE9FE),
                child: const Padding(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Icon(Icons.smart_toy_outlined, color: Color(0xFF6D28D9)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Demonstração educativa: sem IA generativa ou conexão com a internet.',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children:
                    [
                          'O que é radiação?',
                          'O que é meia-vida?',
                          'Como ter segurança?',
                        ]
                        .map(
                          (q) => ActionChip(
                            label: Text(q),
                            onPressed: () => _ask(q),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 12),
              ..._messages.map(
                (message) => Align(
                  alignment: message.$1
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(13),
                    constraints: const BoxConstraints(maxWidth: 310),
                    decoration: BoxDecoration(
                      color: message.$1
                          ? const Color(0xFFDBEAFE)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message.$2,
                      style: const TextStyle(height: 1.4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.send,
                  onSubmitted: _ask,
                  decoration: const InputDecoration(
                    hintText: 'Pergunte à Marie...',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: () => _ask(_controller.text),
                icon: const Icon(Icons.send),
                tooltip: 'Enviar pergunta',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
