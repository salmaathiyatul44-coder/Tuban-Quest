import 'package:flutter/material.dart';
import 'admin_dashboard_screen.dart';
import 'settings_screen.dart';

class ProfileSettingsScreen extends StatelessWidget {
  final String playerName;
  final Function(String) onNameChanged;
  final bool isSoundOn;
  final bool isVibrationOn;
  final bool isDarkMode;
  final Color primaryColor;
  final int selectedColorIndex;
  final Function(bool) onSoundChanged;
  final Function(bool) onVibrationChanged;
  final Function(bool) onDarkModeChanged;
  final Function(Color, int) onColorChanged;

  const ProfileSettingsScreen({
    super.key,
    required this.playerName,
    required this.onNameChanged,
    required this.isSoundOn,
    required this.isVibrationOn,
    required this.isDarkMode,
    required this.primaryColor,
    required this.selectedColorIndex,
    required this.onSoundChanged,
    required this.onVibrationChanged,
    required this.onDarkModeChanged,
    required this.onColorChanged,
  });

  void _showEditNameDialog(BuildContext context) {
    final controller = TextEditingController(text: playerName);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Ubah Nama Pemain', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Nama Baru',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                onNameChanged(controller.text.trim());
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Nama berhasil diubah!'), backgroundColor: primaryColor),
                );
              }
            },
            child: const Text('Simpan', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(
                    isSoundOn: isSoundOn,
                    isVibrationOn: isVibrationOn,
                    isDarkMode: isDarkMode,
                    primaryColor: primaryColor,
                    selectedColorIndex: selectedColorIndex,
                    onSoundChanged: onSoundChanged,
                    onVibrationChanged: onVibrationChanged,
                    onDarkModeChanged: onDarkModeChanged,
                    onColorChanged: onColorChanged,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: primaryColor,
                  child: const Icon(Icons.person, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              playerName,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit_rounded, color: primaryColor, size: 18),
                            onPressed: () => _showEditNameDialog(context),
                          ),
                        ],
                      ),
                      const Text('Lv. 1', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.6,
                          minHeight: 6,
                          backgroundColor: const Color(0xFFE5E9F0),
                          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildStatCard(context, 'Menang', '0'),
              const SizedBox(width: 8),
              _buildStatCard(context, 'Seri', '0'),
              const SizedBox(width: 8),
              _buildStatCard(context, 'Total Game', '0'),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Badge & Prestasi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBadgeItem(context, 'Penjelajah', Icons.explore_rounded),
              _buildBadgeItem(context, 'Ahli Sejarah', Icons.menu_book_rounded),
              _buildBadgeItem(context, 'Penyelamat', Icons.shield_rounded),
              _buildBadgeItem(context, 'Master', Icons.military_tech_rounded),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: primaryColor, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
                );
              },
              icon: Icon(Icons.admin_panel_settings_rounded, color: primaryColor),
              label: Text(
                'Masuk ke Panel Admin',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeItem(BuildContext context, String title, IconData icon) {
    return Container(
      width: 76,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: primaryColor, size: 28),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}