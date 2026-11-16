import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  // Daftar Lokasi Peta beserta banyak pilihan Soal Kuis bawaan
  final List<Map<String, dynamic>> _locations = [
    {
      'name': 'Alun-Alun Tuban',
      'status': 'Aktif',
      'questions': [
        {
          'question': 'Siapa nama Wali Songo yang makamnya berada dekat pusat Kota Tuban?',
          'options': ['A. Sunan Ampel', 'B. Sunan Bonang', 'C. Sunan Giri', 'D. Sunan Kalijaga'],
          'correctIndex': 1,
          'explanation': 'Makam Sunan Bonang berlokasi tepat di sebelah barat Alun-Alun Tuban.',
        },
        {
          'question': 'Alun-Alun Tuban pada masa kerajaan berfungsi sebagai pusat...',
          'options': ['A. Perdagangan laut', 'B. Pemerintahan & Kemasyarakatan', 'C. Pertanian', 'D. Pertahanan benteng'],
          'correctIndex': 1,
          'explanation': 'Alun-Alun merupakan pusat kegiatan pemerintahan dan sosial masyarakat Tuban sejak masa Kadipaten.',
        },
        {
          'question': 'Pohon khas yang biasa menghiasi area Alun-Alun Tuban adalah...',
          'options': ['A. Pohon Beringin', 'B. Pohon Kelapa', 'C. Pohon Jati', 'D. Pohon Mahoni'],
          'correctIndex': 0,
          'explanation': 'Pohon Beringin melambangkan pengayoman dan peneduh di area pusat tata kota tradisional Jawa.',
        },
        {
          'question': 'Acara adat tahunan apa yang sering dipusatkan di Alun-Alun Tuban?',
          'options': ['A. Festival Grebeg', 'B. Hari Jadi Tuban', 'C. Kenaikan Tahta', 'D. Upacara Laut'],
          'correctIndex': 1,
          'explanation': 'Peringatan Hari Jadi Tuban rutin menggelar event budaya di Alun-Alun Tuban.',
        },
        {
          'question': 'Seni tari tradisional Tuban yang sering dipentaskan di panggung umum adalah...',
          'options': ['A. Tari Tayub', 'B. Tari Kecak', 'C. Tari Piring', 'D. Tari Jaipong'],
          'correctIndex': 0,
          'explanation': 'Tari Tayub atau Beksan Tayub merupakan seni pertunjukan khas dari Kabupaten Tuban.',
        },
      ]
    },
    {
      'name': 'Pantai Boom',
      'status': 'Aktif',
      'questions': [
        {
          'question': 'Apa nama tempat wisata ikonik di Tuban yang terkenal dengan dermaga dan mercusuarnya?',
          'options': ['A. Pantai Boom', 'B. Goa Akbar', 'C. Masjid Agung', 'D. Alun-Alun'],
          'correctIndex': 0,
          'explanation': 'Pantai Boom merupakan pelabuhan kuno yang kini menjadi objek wisata pantai populer.',
        },
        {
          'question': 'Pada zaman Kerajaan Majapahit, Pantai Boom berfungsi sebagai...',
          'options': ['A. Benteng militer utama', 'B. Pelabuhan utama jalur perdagangan', 'C. Tempat bertani koral', 'D. Pemukiman nelayan kecil'],
          'correctIndex': 1,
          'explanation': 'Pantai Boom adalah pintu gerbang maritim terpenting bagi Kerajaan Majapahit dalam perdagangan internasional.',
        },
        {
          'question': 'Pasukan dari kerajaan luar negeri mana yang pernah berlabuh di Pelabuhan Tuban (Pantai Boom) pada abad ke-13?',
          'options': ['A. Pasukan Mongol (Kubilai Khan)', 'B. Pasukan Inggris', 'C. Pasukan Portugis', 'D. Pasukan Spanyol'],
          'correctIndex': 0,
          'explanation': 'Armada kapal perang Tartar/Mongol mendarat di Tuban pada tahun 1292 sebelum menyerang Kediri.',
        },
        {
          'question': 'Fasilitas khas yang memanjang ke arah laut di Pantai Boom adalah...',
          'options': ['A. Dermaga semen memanjang', 'B. Jembatan gantung kayu', 'C. Lintasan kereta api', 'D. Rumah apung'],
          'correctIndex': 0,
          'explanation': 'Dermaga daratan buatan memanjang ke laut memudahkan pengunjung menikmati pemandangan laut lepas.',
        },
        {
          'question': 'Komoditas ekspor utama pelabuhan Tuban tempo dulu adalah...',
          'options': ['A. Rempah-rempah dan beras', 'B. Emas dan perak', 'C. Teh dan kopi', 'D. Minyak bumi'],
          'correctIndex': 0,
          'explanation': 'Tuban merupakan titik pengiriman utama beras hasil pedalaman Jawa dan rempah-rempah nusantara.',
        },
      ]
    },
    {
      'name': 'Masjid Agung Tuban',
      'status': 'Aktif',
      'questions': [
        {
          'question': 'Masjid Agung Tuban memiliki gaya arsitektur megah yang dipengaruhi oleh budaya...',
          'options': ['A. Arab & Eropa', 'B. Jawa, Timur Tengah, & India', 'C. Cina & Jepang', 'D. Yunani Kuno'],
          'correctIndex': 1,
          'explanation': 'Gaya arsitektur Masjid Agung Tuban merupakan perpaduan khas Jawa, Timur Tengah, dan India (Ornamental).',
        },
        {
          'question': 'Tahun berapa Masjid Agung Tuban pertama kali didirikan oleh Bupati Tuban?',
          'options': ['A. 1894', 'B. 1920', 'C. 1500', 'D. 1945'],
          'correctIndex': 0,
          'explanation': 'Masjid Agung Tuban pertama kali dibangun pada tahun 1894 oleh Bupati Tuban Raden Toemenggoeng Koesoemodikoemo.',
        },
        {
          'question': 'Salah satu keunikan visual Masjid Agung Tuban pada malam hari adalah...',
          'options': ['A. Lampu hias warna-warni yang megah', 'B. Air mancur menari di dalam masjid', 'C. Kubah kaca transparan', 'D. Menara berputar'],
          'correctIndex': 0,
          'explanation': 'Tata pencahayaan warna-warni memancar megah menyinari kubah dan menara masjid pada malam hari.',
        },
        {
          'question': 'Siapa arsitek berkebangsaan Belanda yang merancang renovasi awal Masjid Agung Tuban pada tahun 1920-an?',
          'options': ['A. B.O. Lauwerier', 'B. H. Maclaine Pont', 'C. Thomas Karsten', 'D. C.P. Wolff Schoemaker'],
          'correctIndex': 0,
          'explanation': 'B.O. Lauwerier merancang pemugaran Masjid Agung Tuban pada tahun 1928.',
        },
      ]
    },
    {
      'name': 'Goa Akbar',
      'status': 'Aktif',
      'questions': [
        {
          'question': 'Di mana lokasi unik ditemukannya lorong Goa Akbar di Kota Tuban?',
          'options': ['A. Tepat di bawah Pasar Baru Tuban', 'B. Di puncak Gunung Lurus', 'C. Di dalam laut lepas', 'D. Di tengah Hutan Jati'],
          'correctIndex': 0,
          'explanation': 'Goa Akbar terletak unik tepat di bawah area perbelanjaan Pasar Baru Tuban.',
        },
        {
          'question': 'Menurut sejarah lokal, Goa Akbar pernah digunakan sebagai tempat bertapa oleh...',
          'options': ['A. Sunan Bonang & Sunan Kalijaga', 'B. Pangeran Diponegoro', 'C. Gajah Mada', 'D. Hayam Wuruk'],
          'correctIndex': 0,
          'explanation': 'Goa Akbar dipercaya sebagai lokasi pertemuan dan tempat pemusatan spiritual para Wali Songo.',
        },
        {
          'question': 'Batu menetas yang menggantung di atap goa disebut...',
          'options': ['A. Stalaktit', 'B. Stalagmit', 'C. Karst', 'D. Obsidian'],
          'correctIndex': 0,
          'explanation': 'Stalaktit adalah batuan kapur menggantung di atap goa yang terbentuk dari tetesan air kaya mineral.',
        },
        {
          'question': 'Fasilitas pendukung di dalam Goa Akbar untuk memudahkan pengunjung adalah...',
          'options': ['A. Jalur selasar paving & lampu penerangan hias', 'B. Kereta gantung', 'C. Eskalator otomatis', 'D. Sampan kayu'],
          'correctIndex': 0,
          'explanation': 'Pemerintah daerah telah membangun selasar pejalan kaki dan tata lampu hias di sepanjang goa.',
        },
      ]
    },
  ];

  // DIALOG FORM TAMBAH SOAL KUIS KAPAN PUN ADMIN INGIN MEMBUAT SOAL BARU
  void _showAddQuestionDialog(int locationIndex) {
    final questionController = TextEditingController();
    final optAController = TextEditingController();
    final optBController = TextEditingController();
    final optCController = TextEditingController();
    final optDController = TextEditingController();
    final expController = TextEditingController();
    int correctIndex = 0;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(
              'Tambah Soal: ${_locations[locationIndex]['name']}',
              style: const TextStyle(color: Color(0xFF007AFF), fontWeight: FontWeight.bold, fontSize: 16),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: questionController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: 'Pertanyaan Kuis',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: optAController,
                    decoration: InputDecoration(
                      labelText: 'Pilihan A',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: optBController,
                    decoration: InputDecoration(
                      labelText: 'Pilihan B',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: optCController,
                    decoration: InputDecoration(
                      labelText: 'Pilihan C',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: optDController,
                    decoration: InputDecoration(
                      labelText: 'Pilihan D',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<int>(
                    initialValue: correctIndex,
                    decoration: InputDecoration(
                      labelText: 'Kunci Jawaban',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    items: const [
                      DropdownMenuItem(value: 0, child: Text('A')),
                      DropdownMenuItem(value: 1, child: Text('B')),
                      DropdownMenuItem(value: 2, child: Text('C')),
                      DropdownMenuItem(value: 3, child: Text('D')),
                    ],
                    onChanged: (val) {
                      if (val != null) setDialogState(() => correctIndex = val);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: expController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: 'Penjelasan Jawaban',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Batal', style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (questionController.text.isNotEmpty &&
                      optAController.text.isNotEmpty &&
                      optBController.text.isNotEmpty) {
                    setState(() {
                      (_locations[locationIndex]['questions'] as List).add({
                        'question': questionController.text,
                        'options': [
                          'A. ${optAController.text}',
                          'B. ${optBController.text}',
                          'C. ${optCController.text}',
                          'D. ${optDController.text}'
                        ],
                        'correctIndex': correctIndex,
                        'explanation': expController.text,
                      });
                    });
                    Navigator.of(ctx).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Soal kuis baru berhasil ditambahkan!'),
                        backgroundColor: Color(0xFF007AFF),
                      ),
                    );
                  }
                },
                child: const Text('Simpan Soal', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showAddLocationDialog() {
    final titleController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Tambah Lokasi Peta', style: TextStyle(color: Color(0xFF007AFF), fontWeight: FontWeight.bold)),
        content: TextField(
          controller: titleController,
          decoration: InputDecoration(labelText: 'Nama Lokasi Peta', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Batal', style: TextStyle(color: Colors.grey))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007AFF)),
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                setState(() {
                  _locations.add({
                    'name': titleController.text,
                    'status': 'Aktif',
                    'questions': [],
                  });
                });
                Navigator.of(ctx).pop();
              }
            },
            child: const Text('Tambah', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF007AFF),
        elevation: 0,
        title: const Text('Dashboard Admin', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFF007AFF), borderRadius: BorderRadius.circular(20)),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.admin_panel_settings_rounded, color: Color(0xFF007AFF), size: 36),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Panel Kelola Kuis Peta', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 2),
                      Text('Kelola & buat soal sebanyak mungkin untuk tiap lokasi', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Lokasi Peta & Soal Kuis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007AFF)),
                onPressed: _showAddLocationDialog,
                icon: const Icon(Icons.add_rounded, size: 18, color: Colors.white),
                label: const Text('Tambah Lokasi', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...List.generate(_locations.length, (index) {
            final item = _locations[index];
            final qList = item['questions'] as List;

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: const Color(0xFFE5F0FF), borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.map_rounded, color: Color(0xFF007AFF)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${qList.length} Soal Tersedia', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007AFF)),
                        onPressed: () => _showAddQuestionDialog(index),
                        icon: const Icon(Icons.add_circle_outline, size: 16, color: Colors.white),
                        label: const Text('+ Soal', style: TextStyle(color: Colors.white, fontSize: 11)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}