import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatelessWidget {
  final bool isSoundOn;
  final bool isVibrationOn;
  final bool isDarkMode;
  final Color primaryColor;
  final int selectedColorIndex;
  final ValueChanged<bool> onSoundChanged;
  final ValueChanged<bool> onVibrationChanged;
  final ValueChanged<bool> onDarkModeChanged;
  final Function(Color, int) onColorChanged;

  const SettingsScreen({
    super.key,
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

  // 1. TAMPILAN HALAMAN TENTANG APLIKASI
  void _openAboutPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Tentang Aplikasi',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    'Tuban Quest',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Versi 1.0.0',
                    style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Aplikasi edukasi berbasis permainan yang mengenalkan sejarah, budaya, dan tempat wisata di Kabupaten Tuban.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontSize: 15, height: 1.5),
                  ),
                  const Spacer(),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black54, fontSize: 13, height: 1.5),
                      children: [
                        TextSpan(text: 'Dikembangkan dengan '),
                        TextSpan(text: '❤️\n', style: TextStyle(color: Colors.red)),
                        TextSpan(text: 'untuk Tuban yang lebih dikenal'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Kembali',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 2. DIALOG KELUAR APLIKASI
  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.door_back_door_outlined, color: Colors.white, size: 38),
            ),
            const SizedBox(height: 20),
            const Text(
              'Keluar Aplikasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            const Text(
              'Apakah kamu yakin ingin menutup aplikasi?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE5EEF8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Batal', style: TextStyle(color: Color(0xFF007AFF), fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF4D4D),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () => SystemNavigator.pop(),
                      child: const Text('Ya, Keluar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 3. TAMPILAN HALAMAN TEMA WARNA
  void _openThemePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ColorThemeSelectionScreen(
          initialIndex: selectedColorIndex,
          primaryColor: primaryColor,
          onColorSelected: onColorChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = isDarkMode;
    final Color itemBg = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF7F9FC);
    final Color borderColor = isDark ? Colors.white10 : const Color(0xFFEBF0F5);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengaturan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildSwitchTile(
                  icon: Icons.volume_up_rounded,
                  title: 'Suara',
                  subtitle: 'Efek suara dan musik',
                  value: isSoundOn,
                  itemBg: itemBg,
                  borderColor: borderColor,
                  onChanged: onSoundChanged,
                ),
                const SizedBox(height: 12),
                _buildSwitchTile(
                  icon: Icons.settings_suggest_rounded,
                  title: 'Getaran',
                  subtitle: 'Getaran saat bermain',
                  value: isVibrationOn,
                  itemBg: itemBg,
                  borderColor: borderColor,
                  onChanged: onVibrationChanged,
                ),
                const SizedBox(height: 12),
                _buildSwitchTile(
                  icon: Icons.contrast_rounded,
                  title: 'Mode Gelap',
                  subtitle: 'Ubah tampilan aplikasi',
                  value: isDarkMode,
                  itemBg: itemBg,
                  borderColor: borderColor,
                  onChanged: onDarkModeChanged,
                ),
                const SizedBox(height: 12),
                _buildActionTile(
                  icon: Icons.color_lens_outlined,
                  title: 'Tema Warna',
                  subtitle: 'Pilih tema warna',
                  itemBg: itemBg,
                  borderColor: borderColor,
                  trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                  onTap: () => _openThemePage(context),
                ),
                const SizedBox(height: 12),
                _buildActionTile(
                  icon: Icons.language_rounded,
                  title: 'Bahasa',
                  subtitle: 'Pilih bahasa aplikasi',
                  itemBg: itemBg,
                  borderColor: borderColor,
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Indonesia', style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500)),
                      SizedBox(width: 4),
                      Icon(Icons.chevron_right_rounded, color: Colors.grey),
                    ],
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _buildActionTile(
                  icon: Icons.help_outline_rounded,
                  title: 'Bantuan',
                  subtitle: 'Panduan permainan',
                  itemBg: itemBg,
                  borderColor: borderColor,
                  trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _buildActionTile(
                  icon: Icons.lock_outline_rounded,
                  title: 'Tentang',
                  subtitle: 'Versi aplikasi',
                  itemBg: itemBg,
                  borderColor: borderColor,
                  trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                  onTap: () => _openAboutPage(context),
                ),
                const SizedBox(height: 12),
                _buildActionTile(
                  icon: Icons.logout_rounded,
                  title: 'Keluar',
                  subtitle: 'Keluar dari aplikasi',
                  itemBg: itemBg,
                  borderColor: borderColor,
                  trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                  onTap: () => _showExitDialog(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Color itemBg,
    required Color borderColor,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: itemBg, borderRadius: BorderRadius.circular(18), border: Border.all(color: borderColor)),
      child: Row(
        children: [
          _buildIconContainer(icon),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Switch(
            value: value,
            activeTrackColor: const Color(0xFF34C759),
            activeThumbColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade400,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color itemBg,
    required Color borderColor,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(color: itemBg, borderRadius: BorderRadius.circular(18), border: Border.all(color: borderColor)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                _buildIconContainer(icon),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 2),
                      Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(color: primaryColor.withValues(alpha: 0.15), shape: BoxShape.circle),
      child: Icon(icon, color: primaryColor, size: 20),
    );
  }
}

// 4. LAYAR PEMILIHAN TEMA WARNA PRESISI STORYBOARD
class ColorThemeSelectionScreen extends StatefulWidget {
  final int initialIndex;
  final Color primaryColor;
  final Function(Color, int) onColorSelected;

  const ColorThemeSelectionScreen({
    super.key,
    required this.initialIndex,
    required this.primaryColor,
    required this.onColorSelected,
  });

  @override
  State<ColorThemeSelectionScreen> createState() => _ColorThemeSelectionScreenState();
}

class _ColorThemeSelectionScreenState extends State<ColorThemeSelectionScreen> {
  late int _selectedIndex;

  final List<Map<String, dynamic>> _options = const [
    {'name': 'Biru (Default)', 'color': Color(0xFF007AFF)},
    {'name': 'Hijau', 'color': Color(0xFF00C7BE)},
    {'name': 'Ungu', 'color': Color(0xFFAF52DE)},
    {'name': 'Oranye', 'color': Color(0xFFFF9500)},
    {'name': 'Merah', 'color': Color(0xFFFF3B30)},
    {'name': 'Pink', 'color': Color(0xFFFF2D55)},
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final currentColor = _options[_selectedIndex]['color'] as Color;

    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(
        backgroundColor: currentColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tema Warna',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pilih tema warna yang kamu suka',
                  style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _options.length,
                    itemBuilder: (context, index) {
                      final item = _options[index];
                      final isSelected = _selectedIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F9FC),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFFEBF0F5)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: item['color'] as Color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  item['name'],
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                ),
                              ),
                              if (isSelected)
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: currentColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      widget.onColorSelected(currentColor, _selectedIndex);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}