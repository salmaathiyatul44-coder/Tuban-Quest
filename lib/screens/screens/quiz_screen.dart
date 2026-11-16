import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String locationName;

  const QuizScreen({super.key, required this.locationName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  bool _isSubmitted = false;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Apa nama tempat wisata yang terkenal dengan pantai dan mercusuar di Tuban?',
      'options': ['A. Pantai Boom', 'B. Goa Akbar', 'C. Masjid Agung Tuban', 'D. Alun-Alun Tuban'],
      'correctIndex': 0,
      'explanation': 'Pantai Boom adalah salah satu ikon wisata Tuban yang terkenal dengan keindahan pantainya dan mercusuar di sekitarnya.',
    },
    {
      'question': 'Siapa nama Wali Songo yang makamnya berada di pusat Kota Tuban?',
      'options': ['A. Sunan Ampel', 'B. Sunan Bonang', 'C. Sunan Giri', 'D. Sunan Kalijaga'],
      'correctIndex': 1,
      'explanation': 'Makam Sunan Bonang berlokasi tidak jauh dari Alun-Alun dan Masjid Agung Tuban.',
    },
    {
      'question': 'Goa terkenal yang terletak di bawah pasar Kota Tuban adalah...',
      'options': ['A. Goa Ngerong', 'B. Goa Surowiti', 'C. Goa Akbar', 'D. Goa Maharani'],
      'correctIndex': 2,
      'explanation': 'Goa Akbar adalah goa alam unik yang terletak di tengah area perkotaan Tuban.',
    },
  ];

  void _handleAnswerSelect(int index) {
    if (!_isSubmitted) {
      setState(() {
        _selectedAnswerIndex = index;
      });
    }
  }

  void _submitOrNext() {
    if (_selectedAnswerIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih salah satu jawaban terlebih dahulu!')),
      );
      return;
    }

    if (!_isSubmitted) {
      setState(() {
        _isSubmitted = true;
        if (_selectedAnswerIndex == _questions[_currentQuestionIndex]['correctIndex']) {
          _score += 20;
        }
      });
    } else {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _selectedAnswerIndex = null;
          _isSubmitted = false;
        });
      } else {
        _showResultDialog();
      }
    }
  }

  void _showResultDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: Color(0xFFE5F9ED),
              child: Icon(Icons.check_circle_rounded, color: Color(0xFF34C759), size: 52),
            ),
            const SizedBox(height: 16),
            const Text(
              'Jawaban Benar!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            const Text(
              'Kamu berhasil menjawab dengan tepat.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.amber.shade300),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.stars, color: Colors.amber, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    '+$_score Pusaka',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('Lanjut', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQ = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF007AFF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.locationName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: const Row(
              children: [
                Icon(Icons.stars, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text('500', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_currentQuestionIndex + 1}/${_questions.length}',
                style: const TextStyle(color: Color(0xFF007AFF), fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                currentQ['question'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              // Pilihan Jawaban
              ...List.generate((currentQ['options'] as List).length, (index) {
                final optionText = currentQ['options'][index];
                final isSelected = _selectedAnswerIndex == index;
                final isCorrect = index == currentQ['correctIndex'];

                Color borderColor = Colors.transparent;
                Color bgColor = Colors.white;

                if (isSelected) {
                  borderColor = const Color(0xFF007AFF);
                  bgColor = const Color(0xFFE5F0FF);
                }

                if (_isSubmitted) {
                  if (isCorrect) {
                    borderColor = const Color(0xFF34C759);
                    bgColor = const Color(0xFFE5F9ED);
                  } else if (isSelected && !isCorrect) {
                    borderColor = Colors.redAccent;
                    bgColor = const Color(0xFFFFEBEB);
                  }
                }

                return GestureDetector(
                  onTap: () => _handleAnswerSelect(index),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor, width: 2),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isSelected
                              ? Icons.radio_button_checked_rounded
                              : Icons.radio_button_off_rounded,
                          color: isSelected ? const Color(0xFF007AFF) : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            optionText,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              if (_isSubmitted) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Penjelasan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF007AFF)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentQ['explanation'],
                        style: const TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],

              const Spacer(),

              // Tombol Jawab / Lanjut
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007AFF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: _submitOrNext,
                  child: Text(
                    _isSubmitted ? 'Lanjut' : 'Jawab',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}