import 'package:flutter/material.dart';

void main() => runApp(const SmartFarmApp());

class SmartFarmApp extends StatelessWidget {
  const SmartFarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMART FARM 3D',
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: const FarmHome(),
    );
  }
}

class FarmHome extends StatefulWidget {
  const FarmHome({super.key});
  @override
  State<FarmHome> createState() => _FarmHomeState();
}

class _FarmHomeState extends State<FarmHome> {
  final length = TextEditingController();
  final width = TextEditingController();
  String soil = 'Black soil';
  String season = 'Kharif';
  double get area {
    final l = double.tryParse(length.text) ?? 0;
    final w = double.tryParse(width.text) ?? 0;
    return l * w;
  }

  @override
  void dispose() {
    length.dispose();
    width.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SMART FARM 3D 🌱')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('Plan your farm', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Enter your land measurements to calculate its area.'),
          const SizedBox(height: 18),
          TextField(controller: length, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Land length (feet)', border: OutlineInputBorder()), onChanged: (_) => setState(() {})),
          const SizedBox(height: 12),
          TextField(controller: width, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Land width (feet)', border: OutlineInputBorder()), onChanged: (_) => setState(() {})),
          const SizedBox(height: 16),
          Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Calculated land area', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${area.toStringAsFixed(1)} sq ft', style: const TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold)),
            Text('${(area / 43560).toStringAsFixed(4)} acres'),
          ]))),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(value: soil, decoration: const InputDecoration(labelText: 'Soil type', border: OutlineInputBorder()), items: ['Black soil', 'Red soil', 'Alluvial soil', 'Sandy soil', 'Unknown'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(), onChanged: (v) => setState(() => soil = v ?? soil)),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(value: season, decoration: const InputDecoration(labelText: 'Growing season', border: OutlineInputBorder()), items: ['Kharif', 'Rabi', 'Zaid'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(), onChanged: (v) => setState(() => season = v ?? season)),
          const SizedBox(height: 18),
          const Text('Next features planned', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const ListTile(leading: Icon(Icons.view_in_ar, color: Colors.green), title: Text('3D land modelling'), subtitle: Text('Planned — not available yet')),
          const ListTile(leading: Icon(Icons.grass, color: Colors.green), title: Text('District-wise crop advice'), subtitle: Text('Planned — needs verified agricultural data')),
          const ListTile(leading: Icon(Icons.science, color: Colors.green), title: Text('Soil and water analysis'), subtitle: Text('Planned — this app does not analyse soil yet')),
        ],
      ),
    );
  }
}
