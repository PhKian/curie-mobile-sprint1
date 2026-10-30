import 'package:flutter/material.dart';

class ObservationFormScreen extends StatefulWidget {
  const ObservationFormScreen({super.key});
  @override
  State<ObservationFormScreen> createState() => _ObservationFormScreenState();
}

class _ObservationFormScreenState extends State<ObservationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _observation = TextEditingController();
  String _category = 'Experimento';
  bool _submitted = false;

  @override
  void dispose() {
    _name.dispose();
    _observation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Registro de observação')),
    body: SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Caderno de campo',
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text('Registre o que você observou durante a atividade.'),
            const SizedBox(height: 14),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  'Registro demonstrativo local. Não inclui dados de medição real.',
                ),
              ),
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                labelText: 'Título da observação',
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (value) => value == null || value.trim().length < 3
                  ? 'Informe ao menos 3 caracteres.'
                  : null,
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              initialValue: _category,
              decoration: const InputDecoration(
                labelText: 'Categoria',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(),
              ),
              items: ['Experimento', 'Pergunta', 'Descoberta']
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (value) =>
                  setState(() => _category = value ?? _category),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _observation,
              minLines: 4,
              maxLines: 6,
              maxLength: 500,
              decoration: const InputDecoration(
                labelText: 'O que você observou?',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (value) => value == null || value.trim().length < 10
                  ? 'Descreva em pelo menos 10 caracteres.'
                  : null,
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  setState(() => _submitted = true);
                }
              },
              icon: const Icon(Icons.save_outlined),
              label: const Text('Validar registro'),
            ),
            if (_submitted)
              Card(
                color: const Color(0xFFDCFCE7),
                child: ListTile(
                  leading: const Icon(
                    Icons.check_circle,
                    color: Color(0xFF047857),
                  ),
                  title: const Text('Registro validado!'),
                  subtitle: Text('${_name.text.trim()} - $_category'),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
