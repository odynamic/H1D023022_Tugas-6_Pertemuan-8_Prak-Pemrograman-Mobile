import 'package:flutter/material.dart';
import 'tampil_data.dart';

class FormDataPage extends StatefulWidget {
  const FormDataPage({super.key});

  @override
  _FormDataPageState createState() => _FormDataPageState();
}

class _FormDataPageState extends State<FormDataPage> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF9E2F60);
    const backgroundColor = Color(0xFFF9EEF1);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'Perkenalan',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle, size: 95, color: primaryColor),
              const SizedBox(height: 16),
              const Text(
                'Masukkan Data Diri Mahasiswa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 28),
              _buildField('Nama Lengkap', _namaController, Icons.person_outline),
              const SizedBox(height: 16),
              _buildField('NIM', _nimController, Icons.badge_outlined),
              const SizedBox(height: 16),
              _buildField('Tahun Lahir', _tahunController, Icons.cake_outlined,
                  isNumber: true),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final nama = _namaController.text.trim();
                    final nim = _nimController.text.trim();
                    final tahun =
                        int.tryParse(_tahunController.text.trim()) ?? 0;
                    final umur = DateTime.now().year - tahun;

                    if (nama.isNotEmpty && nim.isNotEmpty && tahun > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TampilDataPage(
                            nama: nama,
                            nim: nim,
                            umur: umur,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Isi semua data dengan benar!'),
                          backgroundColor: primaryColor,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller,
    IconData icon, {
    bool isNumber = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF9E2F60), size: 22),
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFF9E2F60),
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEADBE2)),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF9E2F60), width: 1.5),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
