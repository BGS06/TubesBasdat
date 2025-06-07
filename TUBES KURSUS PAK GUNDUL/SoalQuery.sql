-- Query Sederhana 1: Menampilkan semua data peserta dengan tingkat keterampilan Lanjutan
SELECT 
    id_peserta,
    nama,
    no_telepon,
    alamat,
    tingkat_keterampilan,
    tanggal_mengikuti
FROM peserta 
WHERE tingkat_keterampilan = 'Lanjutan'
ORDER BY nama;

-- Query Sederhana 2: Menampilkan semua mobil dengan merek Honda
SELECT 
    id_mobil,
    plat_nomor,
    merek,
    model
FROM mobil 
WHERE merek = 'Honda'
ORDER BY id_mobil;

-- Query Complex 1: Menampilkan statistik pembayaran per tingkat keterampilan dengan subquery
SELECT 
    p.tingkat_keterampilan,
    COUNT(*) as jumlah_peserta,
    AVG(pb.jumlah) as rata_rata_pembayaran,
    SUM(pb.jumlah) as total_pendapatan,
    MIN(pb.jumlah) as pembayaran_minimum,
    MAX(pb.jumlah) as pembayaran_maximum
FROM peserta p
JOIN pembayaran pb ON p.id_peserta = pb.id_peserta
WHERE pb.jumlah >= (
    SELECT AVG(jumlah) * 0.8
    FROM pembayaran
)
GROUP BY p.tingkat_keterampilan
HAVING COUNT(*) > 5
ORDER BY total_pendapatan DESC;

-- Query Complex 2: Menampilkan instruktur dengan performa terbaik berdasarkan tingkat kehadiran
SELECT 
    i.nama_instruktur,
    i.pengalaman,
    COUNT(p.id_peserta) as total_peserta,
    COUNT(CASE WHEN a.status_absensi = 'Hadir' THEN 1 END) as peserta_hadir,
    COUNT(CASE WHEN a.status_absensi = 'Tidak Hadir' THEN 1 END) as peserta_tidak_hadir,
    ROUND(
        (COUNT(CASE WHEN a.status_absensi = 'Hadir' THEN 1 END) * 100.0 / COUNT(p.id_peserta)), 
        2
    ) as persentase_kehadiran,
    SUM(pb.jumlah) as total_pendapatan_yang_dihasilkan
FROM instruktur i
JOIN peserta p ON i.id_instruktur = p.id_instruktur
JOIN absensi a ON p.id_peserta = a.id_peserta
JOIN pembayaran pb ON p.id_peserta = pb.id_peserta
WHERE i.id_instruktur IN (
    SELECT DISTINCT id_instruktur 
    FROM peserta 
    GROUP BY id_instruktur 
    HAVING COUNT(*) >= 5
)
GROUP BY i.id_instruktur, i.nama_instruktur, i.pengalaman
ORDER BY persentase_kehadiran DESC, total_pendapatan_yang_dihasilkan DESC;

-- Query JOIN 1: Menggabungkan 2 table (peserta dan kursus)
SELECT 
    p.id_peserta,
    p.nama as nama_peserta,
    p.tingkat_keterampilan,
    k.nama_kursus,
    k.jadwal,
    p.tanggal_mengikuti
FROM peserta p
JOIN kursus k ON p.id_kursus = k.id_kursus
WHERE p.tingkat_keterampilan IN ('Menengah', 'Lanjutan')
ORDER BY k.nama_kursus, p.nama;

-- Query JOIN 2: Menggabungkan 5 table (peserta, kursus, instruktur, mobil, pembayaran)
SELECT 
    p.id_peserta,
    p.nama as nama_peserta,
    p.tingkat_keterampilan,
    k.nama_kursus,
    k.jadwal,
    i.nama_instruktur,
    i.pengalaman as pengalaman_instruktur,
    m.plat_nomor,
    CONCAT(m.merek, ' ', m.model) as kendaraan,
    p.tanggal_mengikuti,
    pb.tanggal_pembayaran,
    pb.jumlah as biaya_kursus,
    pb.status_pembayaran,
    DATEDIFF(pb.tanggal_pembayaran, p.tanggal_mengikuti) as selisih_hari_bayar
FROM peserta p
JOIN kursus k ON p.id_kursus = k.id_kursus
JOIN instruktur i ON p.id_instruktur = i.id_instruktur
JOIN mobil m ON p.id_mobil = m.id_mobil
JOIN pembayaran pb ON p.id_peserta = pb.id_peserta
WHERE pb.status_pembayaran = 'Lunas'
    AND p.tanggal_mengikuti >= '2025-04-01'
    AND pb.jumlah >= 600000
ORDER BY p.tanggal_mengikuti DESC, pb.jumlah DESC;


-- Query untuk Dashboard/Laporan Manajemen
SELECT 
    'Total Peserta' as metrik,
    COUNT(DISTINCT p.id_peserta) as nilai,
    NULL as kategori
FROM peserta p

UNION ALL

SELECT 
    'Total Pendapatan' as metrik,
    SUM(pb.jumlah) as nilai,
    'Rupiah' as kategori
FROM pembayaran pb

UNION ALL

SELECT 
    'Rata-rata Kehadiran' as metrik,
    ROUND(
        (COUNT(CASE WHEN a.status_absensi = 'Hadir' THEN 1 END) * 100.0 / COUNT(*)), 
        2
    ) as nilai,
    'Persen' as kategori
FROM absensi a

UNION ALL

SELECT 
    'Total Kendaraan' as metrik,
    COUNT(DISTINCT id_mobil) as nilai,
    'Unit' as kategori
FROM mobil

ORDER BY 
    CASE metrik 
        WHEN 'Total Peserta' THEN 1
        WHEN 'Total Pendapatan' THEN 2
        WHEN 'Rata-rata Kehadiran' THEN 3
        WHEN 'Total Kendaraan' THEN 4
    END;
