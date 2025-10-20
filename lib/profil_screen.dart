import 'package:flutter/material.dart';
import 'edit_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  String nama = "Fauzan Teza Saputra";
  String alamat = "Jakarta";
  String hobi = "Otomotif & Memasak";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Profil Mahasiswa",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Hero(
              tag: 'profile-pic',
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.green.shade100,
                backgroundImage: const AssetImage('asseets/profil.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              nama,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 5,
              color: Colors.green.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    profilItem(Icons.person, "Nama", nama),
                    const Divider(height: 25, thickness: 1, color: Colors.greenAccent),
                    profilItem(Icons.home, "Alamat", alamat),
                    const Divider(height: 25, thickness: 1, color: Colors.greenAccent),
                    profilItem(Icons.favorite, "Hobi", hobi),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton.icon(
              onPressed: () async {
                final hasil = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditScreen(
                      nama: nama,
                      alamat: alamat,
                      hobi: hobi,
                    ),
                  ),
                );

                if (hasil != null && hasil is Map<String, String>) {
                  setState(() {
                    nama = hasil['nama'] ?? nama;
                    alamat = hasil['alamat'] ?? alamat;
                    hobi = hasil['hobi'] ?? hobi;
                  });

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Profil berhasil diperbarui 🎓"),
                      backgroundColor: Colors.green.shade600,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 3,
              ),
              icon: const Icon(Icons.edit, size: 22),
              label: const Text(
                "Edit Profil",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profilItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.green.shade700, size: 28),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              const SizedBox(height: 3),
              Text(value,
                  style: const TextStyle(
                      fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }
}
