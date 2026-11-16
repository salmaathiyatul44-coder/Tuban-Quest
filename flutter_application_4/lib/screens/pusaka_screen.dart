import 'package:flutter/material.dart';

class PusakaScreen extends StatefulWidget {
  final int userCoins;
  final Color primaryColor;

  const PusakaScreen({
    super.key,
    required this.userCoins,
    this.primaryColor = const Color(0xFF007AFF),
  });

  @override
  State<PusakaScreen> createState() => _PusakaScreenState();
}

class _PusakaScreenState extends State<PusakaScreen> {
  String _selectedCategory = 'Semua';

  void _showPusakaDetail(String title, String description, IconData icon, Color iconColor) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 70, color: iconColor),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: widget.primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Tutup', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pusaka',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.stars, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  '${widget.userCoins}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: widget.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterChip('Semua'),
                _buildFilterChip('Koin'),
                _buildFilterChip('Badge'),
                _buildFilterChip('Lainnya'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    _buildPusakaCard(
                      'Koin Tuban',
                      '${widget.userCoins}/100',
                      Icons.monetization_on_rounded,
                      Colors.amber,
                      'Koin bernilai sejarah tinggi yang diperoleh dari keberhasilan menjawab kuis kuis kedaerahan Tuban.',
                    ),
                    const SizedBox(width: 10),
                    _buildPusakaCard(
                      'Lencana Sejarah',
                      '1/20',
                      Icons.military_tech_rounded,
                      Colors.redAccent,
                      'Lencana kehormatan bagi para penjelajah kuis sejarah Kadipaten Tuban.',
                    ),
                    const SizedBox(width: 10),
                    _buildPusakaCard(
                      'Kerang Boom',
                      '1/15',
                      Icons.beach_access_rounded,
                      Colors.orangeAccent,
                      'Pusaka pesisir yang ditemukan di kawasan pelabuhan kuno Pantai Boom Tuban.',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildPusakaCard(
                      'Batu Goa Akbar',
                      '1/5',
                      Icons.landscape_rounded,
                      Colors.brown,
                      'Batu kristal stalaktit alam unik dari goa sejarah di bawah Pasar Tuban.',
                    ),
                    const SizedBox(width: 10),
                    _buildPusakaCard(
                      'Miniatur Masjid',
                      '0/5',
                      Icons.account_balance_rounded,
                      Colors.teal,
                      'Simbol keagungan arsitektur gabungan Jawa dan Timur Tengah Masjid Agung Tuban.',
                    ),
                    const SizedBox(width: 10),
                    _buildPusakaCard(
                      'Pusaka Bonang',
                      '0/5',
                      Icons.auto_awesome_rounded,
                      Colors.purple,
                      'Pusaka peninggalan kebudayaan dakwah Sunan Bonang.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? widget.primaryColor : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildPusakaCard(String title, String count, IconData icon, Color color, String desc) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _showPusakaDetail(title, desc, icon, color),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Icon(icon, size: 36, color: color),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  const SizedBox(height: 2),
                  Text(count, style: const TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}