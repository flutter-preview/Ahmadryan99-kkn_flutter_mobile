import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AnggotaKelompok {
  final String nama;
  final String status;
  final IconData avatarIcon;

  AnggotaKelompok({
    required this.nama,
    required this.status,
    required this.avatarIcon,
  });
}

class InformasiKelompokPage extends StatelessWidget {
  final List<AnggotaKelompok> anggotaKelompokList = [
    AnggotaKelompok(
      nama: 'Nama Mahasiswa ',
      status: 'Prodi Mahasiswa',
      avatarIcon: MdiIcons.accountCircleOutline,
    ),
    AnggotaKelompok(
      nama: 'Nama Mahasiswa ',
      status: 'Prodi Mahasiswa',
      avatarIcon: MdiIcons.accountCircleOutline,
    ),
    AnggotaKelompok(
      nama: 'Nama Mahasiswa ',
      status: 'Prodi Mahasiswa',
      avatarIcon: MdiIcons.accountCircleOutline,
    ),
    AnggotaKelompok(
      nama: 'Nama Mahasiswa ',
      status: 'Prodi Mahasiswa',
      avatarIcon: MdiIcons.accountCircleOutline,
    ),
    AnggotaKelompok(
      nama: 'Nama Mahasiswa ',
      status: 'Prodi Mahasiswa',
      avatarIcon: MdiIcons.accountCircleOutline,
    ),
    AnggotaKelompok(
      nama: 'Nama Mahasiswa ',
      status: 'Prodi Mahasiswa',
      avatarIcon: MdiIcons.accountCircleOutline,
    ),
    AnggotaKelompok(
      nama: 'Nama Mahasiswa ',
      status: 'Prodi Mahasiswa',
      avatarIcon: MdiIcons.accountCircleOutline,
    ),
    AnggotaKelompok(
      nama: 'Nama Mahasiswa ',
      status: 'Prodi Mahasiswa',
      avatarIcon: MdiIcons.accountCircleOutline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Kelompok'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Kelompok', // Ganti dengan nama kelompok yang sesuai
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Anggota Kelompok',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: anggotaKelompokList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 36, // Ubah ukuran ikon di sini
                            child: Icon(
                              anggotaKelompokList[index].avatarIcon,
                              color: Colors.black,
                              size: 40, // Ubah ukuran ikon di sini
                            ),
                            backgroundColor: Colors.white,
                          ),
                          title: Text(
                            anggotaKelompokList[index].nama,
                          ),
                          subtitle: Text(
                            anggotaKelompokList[index].status,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dosen Pembimbing Lapangan: ', // Ganti dengan dosen pembimbing lapangan yang sesuai
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Lokasi: ', // Ganti dengan lokasi yang sesuai
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
