import 'package:flutter/material.dart';

void main() {
  runApp(const TokendeApp());
}

class TokendeApp extends StatelessWidget {
  const TokendeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokende',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0085FF),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TokendeHome(),
    );
  }
}

class TokendeHome extends StatefulWidget {
  const TokendeHome({super.key});

  @override
  State<TokendeHome> createState() => _TokendeHomeState();
}

class _TokendeHomeState extends State<TokendeHome> {
  String selectedType = 'moto';
  String from = 'Gombe';
  String to = 'Kintambo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            color: const Color(0xFF0085FF),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('🛵', style: TextStyle(fontSize: 28)),
                    const SizedBox(width: 10),
                    const Text('Tokende', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: const Text('Kinshasa', style: TextStyle(color: Color(0xFF0085FF), fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Tika tokende! Move in Congo', style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),
          // Map fake
          Container(
            height: 180,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F2FF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF0085FF).withOpacity(0.2)),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, size: 50, color: Color(0xFF0085FF)),
                  SizedBox(height: 8),
                  Text('Carte Kinshasa - Map View', style: TextStyle(color: Color(0xFF0085FF))),
                  Text('Gombe → Kintambo', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          // Ride type
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _typeCard('moto', '🛵', 'Moto', '3,500 FC', true),
                const SizedBox(width: 12),
                _typeCard('car', '🚕', 'Voiture', '12,000 FC', false),
                const SizedBox(width: 12),
                _typeCard('tricycle', '🛺', 'Tricycle', '6,000 FC', false),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // From To
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(children: [const Icon(Icons.circle, size: 12, color: Colors.green), const SizedBox(width: 10), Text('De: $from')]),
                  const Divider(),
                  Row(children: [const Icon(Icons.location_on, size: 16, color: Colors.red), const SizedBox(width: 10), Text('Vers: $to')]),
                ],
              ),
            ),
          ),
          const Spacer(),
          // Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0085FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tokende! Recherche chauffeur... Bientôt!')));
                },
                child: Text('Tokende na $selectedType - Commander', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20), child: Text('Made in DRC 🇨🇩 avec ❤️', style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }

  Widget _typeCard(String id, String emoji, String name, String price, bool isMoto) {
    bool selected = selectedType == id;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedType = id),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: selected? const Color(0xFF0085FF) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: selected? const Color(0xFF0085FF) : Colors.grey[300]!),
          ),
          child: Column(children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: selected? Colors.white : Colors.black)),
            Text(price, style: TextStyle(fontSize: 12, color: selected? Colors.white70 : Colors.grey)),
          ]),
        ),
      ),
    );
  }
}

