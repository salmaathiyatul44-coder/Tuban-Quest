import 'package:flutter/material.dart';

class LevelData {
  final String title;
  final String description;
  final Color backgroundColor;

  LevelData({
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

class LevelManager {
  static final List<LevelData> levels = [
    LevelData(
      title: 'Alun-Alun Tuban',
      description: 'Pusat kebudayaan dan ruang terbuka hijau Kota Tuban.',
      backgroundColor: const Color(0xFFE8D8C8),
    ),
    LevelData(
      title: 'Kelenteng Kwan Sing Bio',
      description: 'Kelenteng megah penghadap laut dengan simbol Kepiting.',
      backgroundColor: const Color(0xFFF5E6CC),
    ),
    LevelData(
      title: 'Gua Akbar',
      description: 'Gua alam indah di bawah pusat perbelanjaan Tuban.',
      backgroundColor: const Color(0xFFD4C3B3),
    ),
  ];
}