import 'package:flutter/material.dart';

void main() {
  runApp(const ErettsegiApp());
}

class ErettsegiApp extends StatelessWidget {
  const ErettsegiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ErettsegiForm(),
    );
  }
}

class ErettsegiForm extends StatefulWidget {
  const ErettsegiForm({super.key});

  @override
  State<ErettsegiForm> createState() => _ErettsegiFormState();
}

class _ErettsegiFormState extends State<ErettsegiForm> {
  final List<String> _tantargyak = ['Magyar', 'Matematika', 'Történelem', 'Informatika', 'Fizika', 'Biológia'];
  final List<String> _nyelvek = ['Angol', 'Német', 'Francia', 'Olasz', 'Spanyol'];

  final List<Map<String, dynamic>> _vizsgak = [];

  void _ujVizsga(bool nyelvvizsga) {
    setState(() {
      if (nyelvvizsga) {
        _vizsgak.add({
          'tipus': 'nyelvvizsga',
          'megnevezes': _nyelvek[0],
          'szint': 'B2',
          'fajta': 'Komplex',
        });
      } else {
        _vizsgak.add({
          'tipus': 'erettsegi',
          'megnevezes': _tantargyak[0],
          'szint': 'Közép',
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vizsga Jelentkezés'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _vizsgak.length,
              itemBuilder: (context, index) {
                final vizsga = _vizsgak[index];
                final isNyelv = vizsga['tipus'] == 'nyelvvizsga';

                return Card(
                  color: isNyelv ? Colors.blue.shade50 : Colors.orange.shade50,
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(isNyelv ? Icons.translate : Icons.school, size: 20),
                        const SizedBox(width: 8),
                        Text(isNyelv ? 'Nyelvvizsga' : 'Érettségi tárgy'),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            // Megnevezés választó
                            Expanded(
                              flex: 2,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: vizsga['megnevezes'],
                                items: (isNyelv ? _nyelvek : _tantargyak).map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (val) => setState(() => vizsga['megnevezes'] = val),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Szint választó
                            Expanded(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: vizsga['szint'],
                                items: (isNyelv ? ['B1', 'B2', 'C1'] : ['Közép', 'Emelt']).map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (val) => setState(() => vizsga['szint'] = val),
                              ),
                            ),
                          ],
                        ),
                        if (isNyelv) // Extra mező csak nyelvvizsgához
                          DropdownButton<String>(
                            isExpanded: true,
                            value: vizsga['fajta'],
                            items: ['Komplex', 'Írásbeli', 'Szóbeli'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                            onChanged: (val) => setState(() => vizsga['fajta'] = val),
                          ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                      onPressed: () => setState(() => _vizsgak.removeAt(index)),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _ujVizsga(false),
                    child: const Text('+ Érettségi'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _ujVizsga(true),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade100),
                    child: const Text('+ Nyelvvizsga'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}