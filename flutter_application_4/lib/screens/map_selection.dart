import 'package:flutter/material.dart';

class MapSelectionScreen extends StatelessWidget {
  final int userCoins;
  final Function(int) onCoinEarned;
  final Color primaryColor;

  const MapSelectionScreen({
    super.key,
    required this.userCoins,
    required this.onCoinEarned,
    this.primaryColor = const Color(0xFF007AFF),
  });

  void _openQuiz(BuildContext context, String locationName) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          locationName: locationName,
          userCoins: userCoins,
          onCoinEarned: onCoinEarned,
          primaryColor: primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Peta Petualangan',
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
                  '$userCoins',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMapCard(context, 'Alun-Alun Tuban', 'Pelajari sejarah alun-alun Tuban', '0/3'),
          _buildMapCard(context, 'Pantai Boom', 'Kenali keindahan Pantai Boom', '0/3'),
          _buildMapCard(context, 'Masjid Agung Tuban', 'Jelajahi masjid bersejarah', '0/3'),
          _buildMapCard(context, 'Goa Akbar', 'Temukan keunikan Goa Akbar', '0/3'),
        ],
      ),
    );
  }

  Widget _buildMapCard(BuildContext context, String title, String subtitle, String progress) {
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
          onTap: () => _openQuiz(context, title),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: primaryColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_open_rounded,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.shield_outlined, size: 12, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(progress, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final String locationName;
  final int userCoins;
  final Function(int) onCoinEarned;
  final Color primaryColor;

  const QuizScreen({
    super.key,
    required this.locationName,
    required this.userCoins,
    required this.onCoinEarned,
    this.primaryColor = const Color(0xFF007AFF),
  });

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
          widget.onCoinEarned(20);
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
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: widget.primaryColor,
          appBar: AppBar(
            backgroundColor: widget.primaryColor,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              'Hasil Kuis',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    const Icon(Icons.stars, color: Colors.amber, size: 22),
                    const SizedBox(width: 6),
                    Text(
                      '${widget.userCoins}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
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
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFF00C7BE),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.check_rounded, color: Colors.white, size: 48),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Jawaban Benar!',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1C2B4B)),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Kamu berhasil menjawab dengan tepat.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black45, fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBF5FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Penjelasan',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF007AFF)),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _questions[_currentQuestionIndex]['explanation'],
                            style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E7),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          elevation: 0,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Lanjut',
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQ = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.locationName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.stars, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text('${widget.userCoins}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                style: TextStyle(color: widget.primaryColor, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                currentQ['question'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...List.generate((currentQ['options'] as List).length, (index) {
                final optionText = currentQ['options'][index];
                final isSelected = _selectedAnswerIndex == index;
                final isCorrect = index == currentQ['correctIndex'];

                Color borderColor = Colors.transparent;
                Color bgColor = Theme.of(context).cardColor;

                if (isSelected) {
                  borderColor = widget.primaryColor;
                  bgColor = widget.primaryColor.withValues(alpha: 0.1);
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
                          color: isSelected ? widget.primaryColor : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            optionText,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.primaryColor,
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