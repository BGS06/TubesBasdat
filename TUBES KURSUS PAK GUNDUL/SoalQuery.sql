SELECT 
    p.ID_Peserta,
    p.Nama,
    p.No_Telepon,
    p.Alamat,
    p.Tingkat_Keterampilan,
    k.Tanggal as Tanggal_Kursus,
    i.Nama_Instruktur,
    kend.Plat_Nomor,
    kend.Merek,
    kend.Model,
    pay.Jumlah as Biaya_Kursus,
    pay.Status_Pembayaran,
    a.Status_Absensi
FROM Peserta p
LEFT JOIN Kursus k ON p.ID_Peserta = k.ID_Peserta
LEFT JOIN Instruktur i ON k.ID_Instruktur = i.ID_Instruktur
LEFT JOIN Kendaraan kend ON k.ID_Kendaraan = kend.ID_Kendaraan
LEFT JOIN Pembayaran pay ON k.ID_Pembayaran = pay.ID_Pembayaran
LEFT JOIN Absensi a ON p.ID_Peserta = a.ID_Peserta
ORDER BY p.ID_Peserta;

-- Query 2: Menampilkan statistik tingkat keterampilan peserta
SELECT 
    Tingkat_Keterampilan,
    COUNT(*) as Jumlah_Peserta,
    AVG(pay.Jumlah) as Rata_Rata_Biaya
FROM Peserta p
JOIN Pembayaran pay ON p.ID_Peserta = pay.ID_Peserta
GROUP BY Tingkat_Keterampilan
ORDER BY Jumlah_Peserta DESC;

-- Query 3: Menampilkan laporan kehadiran peserta
SELECT 
    p.ID_Peserta,
    p.Nama,
    COUNT(a.ID_Absensi) as Total_Pertemuan,
    SUM(CASE WHEN a.Status_Absensi = 'Hadir' THEN 1 ELSE 0 END) as Hadir,
    SUM(CASE WHEN a.Status_Absensi = 'Tidak Hadir' THEN 1 ELSE 0 END) as Tidak_Hadir,
    ROUND((SUM(CASE WHEN a.Status_Absensi = 'Hadir' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.ID_Absensi)), 2) as Persentase_Kehadiran
FROM Peserta p
LEFT JOIN Absensi a ON p.ID_Peserta = a.ID_Peserta
GROUP BY p.ID_Peserta, p.Nama
ORDER BY Persentase_Kehadiran DESC;

-- Query 4: Menampilkan laporan kinerja instruktur
SELECT 
    i.ID_Instruktur,
    i.Nama_Instruktur,
    i.No_Telepon_Instruktur,
    COUNT(k.ID_Kursus) as Total_Kursus_Diajar,
    COUNT(DISTINCT k.ID_Peserta) as Jumlah_Peserta_Unik
FROM Instruktur i
LEFT JOIN Kursus k ON i.ID_Instruktur = k.ID_Instruktur
GROUP BY i.ID_Instruktur, i.Nama_Instruktur, i.No_Telepon_Instruktur
ORDER BY Total_Kursus_Diajar DESC;

-- Query 5: Menampilkan laporan penggunaan kendaraan
SELECT 
    kend.ID_Kendaraan,
    kend.Plat_Nomor,
    kend.Merek,
    kend.Model,
    COUNT(k.ID_Kursus) as Frekuensi_Penggunaan
FROM Kendaraan kend
LEFT JOIN Kursus k ON kend.ID_Kendaraan = k.ID_Kendaraan
GROUP BY kend.ID_Kendaraan, kend.Plat_Nomor, kend.Merek, kend.Model
ORDER BY Frekuensi_Penggunaan DESC;

-- Query 6: Menampilkan laporan pembayaran bulanan
SELECT 
    MONTH(Tanggal) as Bulan,
    YEAR(Tanggal) as Tahun,
    COUNT(*) as Jumlah_Pembayaran,
    SUM(Jumlah) as Total_Pendapatan,
    AVG(Jumlah) as Rata_Rata_Pembayaran
FROM Pembayaran
GROUP BY YEAR(Tanggal), MONTH(Tanggal)
ORDER BY Tahun, Bulan;