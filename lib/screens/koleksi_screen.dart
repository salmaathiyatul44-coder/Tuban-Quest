import 'package:flutter/material.dart';

class KoleksiScreen extends StatelessWidget {
  const KoleksiScreen({super.key});

  void _showImageDetail(BuildContext context, String title, String category, String description, IconData icon, Color iconColor) {
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
              height: 150,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 60, color: iconColor),
                  const SizedBox(height: 6),
                  Text(category, style: TextStyle(color: iconColor, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                  backgroundColor: const Color(0xFF007AFF),
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
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Makam Sunan Bonang',
        'category': 'Situs Bersejarah',
        'icon': Icons.account_balance_rounded,
        'color': Colors.blue,
        'desc': 'Situs pemakaman bersejarah salah satu anggota Wali Songo di pusat Kota Tuban yang ramai dikunjungi peziarah.',
      },
      {
        'title': 'Pelabuhan Kuno Pantai Boom',
        'category': 'Wisata Bahari',
        'icon': Icons.sailing_rounded,
        'color': Colors.orange,
        'desc': 'Pelabuhan perdagangan terpenting Kerajaan Majapahit pada abad ke-13 yang kini menjadi pantai wisata ikonik.',
      },
      {
        'title': 'Stalaktit Goa Akbar',
        'category': 'Keajaiban Alam',
        'icon': Icons.landscape_rounded,
        'color': Colors.brown,
        'desc': 'Goa alam unik ribuan tahun dengan bentukan stalaktit dan stalagmit yang berada tepat di bawah area Pasar Baru Tuban.',
      },
      {
        'title': 'Batik Gedog Tuban',
        'category': 'Budaya & Kerajinan',
        'icon': Icons.palette_rounded,
        'color': Colors.purple,
        'desc': 'Batik khas Tuban yang proses pembuatannya ditenun secara tradisional mulai dari serat kapas hingga kain motif.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF007AFF),
        elevation: 0,
        centerTitle: true,
        title: const Text('Koleksi Sejarah', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => _showImageDetail(
                  context,
                  item['title'],
                  item['category'],
                  item['desc'],
                  item['icon'],
                  item['color'],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: (item['color'] as Color).withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item['icon'] as IconData, color: item['color'] as Color),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            const SizedBox(height: 2),
                            Text(item['category'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      const Icon(Icons.info_outline_rounded, color: Color(0xFF007AFF)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}