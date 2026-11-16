import 'package:flutter/material.dart';

class QuizDialog extends StatelessWidget {
  final String locationTitle;

  const QuizDialog({super.key, required this.locationTitle});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: const Color(0xFFFDF8F0),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'KUIS: $locationTitle',
              style: textTheme.titleLarge?.copyWith(color: const Color(0xFF3B2A1F)),
            ),
            const SizedBox(height: 12),
            Text(
              'Landmark khas pusat Kota Tuban adalah...',
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {},
              child: const Text('A. Alun-Alun Tuban', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: const Text('B. Tugu Pahlawan'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: const Text('C. Candi Borobudur'),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF3B2A1F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.stars, color: Color(0xFFFFD700)),
                  SizedBox(width: 8),
                  Text('+1 Pusaka', style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}