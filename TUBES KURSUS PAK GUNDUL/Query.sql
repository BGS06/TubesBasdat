CREATE DATABASE kursus_pak_gundul;
CREATE TABLE instruktur (
    id_instruktur VARCHAR(10) PRIMARY KEY,
    nama_instruktur VARCHAR(100) NOT NULL,
    pengalaman VARCHAR(20),
    telepon VARCHAR(15)
);

CREATE TABLE kursus (
    id_kursus VARCHAR(10) PRIMARY KEY,
    nama_kursus VARCHAR(50) NOT NULL,
    jadwal VARCHAR(20)
);

CREATE TABLE mobil (
    id_mobil VARCHAR(10) PRIMARY KEY,
    plat_nomor VARCHAR(15) NOT NULL,
    merek VARCHAR(20),
    model VARCHAR(20)
);

CREATE TABLE peserta (
    id_peserta VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(15),
    alamat VARCHAR(100),
    tingkat_keterampilan VARCHAR(20),
    id_kursus VARCHAR(10),
    id_instruktur VARCHAR(10),
    id_mobil VARCHAR(10),
    tanggal_mengikuti DATE,
    FOREIGN KEY (id_kursus) REFERENCES kursus(id_kursus),
    FOREIGN KEY (id_instruktur) REFERENCES instruktur(id_instruktur),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil)
);

CREATE TABLE pembayaran (
    id_pembayaran VARCHAR(10) PRIMARY KEY,
    id_peserta VARCHAR(10),
    tanggal_pembayaran DATE,
    jumlah DECIMAL(10,2),
    status_pembayaran VARCHAR(20),
    FOREIGN KEY (id_peserta) REFERENCES peserta(id_peserta)
);

CREATE TABLE absensi (
    id_absensi VARCHAR(10) PRIMARY KEY,
    id_peserta VARCHAR(10),
    tanggal_absensi DATE,
    status_absensi VARCHAR(20),
    FOREIGN KEY (id_peserta) REFERENCES peserta(id_peserta)
);


INSERT INTO instruktur (id_instruktur, nama_instruktur, pengalaman, telepon) VALUES
('I001', 'Budi Santoso', '2 tahun', '08234567890'),
('I002', 'Rina Kurniawan', '5 tahun', '08345678901'),
('I003', 'Dedi Haris', '3 tahun', '08123456789');



INSERT INTO kursus (id_kursus, nama_kursus, jadwal) VALUES
('K001', 'Mengemudi A', 'Jumat, 13:00'),
('K002', 'Mengemudi B', 'Rabu, 10:00'),
('K003', 'Mengemudi C', 'Senin, 08:00');



INSERT INTO mobil (id_mobil, plat_nomor, merek, model) VALUES
('M100', 'B 9029 ABC', 'Suzuki', 'Ertiga'),
('M101', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M102', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M103', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M104', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M105', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M106', 'B 6471 XYZ', 'Daihatsu', 'Xenia'),
('M107', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M108', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M109', 'B 9644 ACD', 'Mitsubishi', 'Xpander'),
('M110', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M111', 'B 9029 ABC', 'Suzuki', 'Ertiga'),
('M112', 'B 9644 ACD', 'Mitsubishi', 'Xpander'),
('M113', 'B 9644 ACD', 'Mitsubishi', 'Xpander'),
('M114', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M115', 'B 3431 FSG', 'Toyota', 'Avanza'),
('M116', 'B 6471 XYZ', 'Daihatsu', 'Xenia'),
('M117', 'B 3431 FSG', 'Toyota', 'Avanza'),
('M118', 'B 3431 FSG', 'Toyota', 'Avanza'),
('M119', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M120', 'B 9644 ACD', 'Mitsubishi', 'Xpander'),
('M121', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M122', 'B 3431 FSG', 'Toyota', 'Avanza'),
('M123', 'B 6471 XYZ', 'Daihatsu', 'Xenia'),
('M124', 'B 3431 FSG', 'Toyota', 'Avanza'),
('M125', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M126', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M127', 'B 3431 FSG', 'Toyota', 'Avanza'),
('M128', 'B 9029 ABC', 'Suzuki', 'Ertiga'),
('M129', 'B 6471 XYZ', 'Daihatsu', 'Xenia'),
('M130', 'B 9644 ACD', 'Mitsubishi', 'Xpander'),
('M131', 'B 4918 DEF', 'Honda', 'Mobilio'),
('M132', 'B 6471 XYZ', 'Daihatsu', 'Xenia'),
('M133', 'B 9644 ACD', 'Mitsubishi', 'Xpander'),
('M134', 'B 6471 XYZ', 'Daihatsu', 'Xenia'),
('M135', 'B 9644 ACD', 'Mitsubishi', 'Xpander'),
('M136', 'B 9644 ACD', 'Mitsubishi', 'Xpander'),
('M137', 'B 3431 FSG', 'Toyota', 'Avanza'),
('M138', 'B 6471 XYZ', 'Daihatsu', 'Xenia'),
('M139', 'B 4918 DEF', 'Honda', 'Mobilio');



INSERT INTO peserta (id_peserta, nama, no_telepon, alamat, tingkat_keterampilan, id_kursus, id_instruktur, id_mobil, tanggal_mengikuti) VALUES
('P100', 'Rina Prasetyo', '8179152007', 'Jl. Cempaka 3', 'Menengah', 'K002', 'I003', 'M100', '2025-04-01'),
('P101', 'Andi Marlina', '8121480917', 'Jl. Merdeka 5', 'Dasar', 'K001', 'I002', 'M101', '2025-04-06'),
('P102', 'Siti Suryani', '8880203117', 'Jl. Kenanga 1', 'Menengah', 'K002', 'I003', 'M102', '2025-04-09'),
('P103', 'Lina Kurniawan', '8296724078', 'Jl. Kenanga 5', 'Dasar', 'K003', 'I001', 'M103', '2025-04-08'),
('P104', 'Dewi Suryani', '8358575328', 'Jl. Cempaka 1', 'Menengah', 'K003', 'I003', 'M104', '2025-04-15'),
('P105', 'Joko Marlina', '8542447243', 'Jl. Melati 2', 'Menengah', 'K003', 'I003', 'M105', '2025-04-12'),
('P106', 'Dewi Suryani', '8497902645', 'Jl. Melati 1', 'Dasar', 'K003', 'I001', 'M106', '2025-04-04'),
('P107', 'Dewi Kurniawan', '8435480497', 'Jl. Kenanga 3', 'Menengah', 'K001', 'I002', 'M107', '2025-04-15'),
('P108', 'Joko Kurniawan', '8621760690', 'Jl. Merdeka 5', 'Dasar', 'K003', 'I001', 'M108', '2025-04-09'),
('P109', 'Andi Wijaya', '8874603269', 'Jl. Merdeka 6', 'Menengah', 'K003', 'I002', 'M109', '2025-04-14'),
('P110', 'Tina Santoso', '8835722361', 'Jl. Melati 5', 'Dasar', 'K002', 'I001', 'M110', '2025-04-08'),
('P111', 'Siti Wibowo', '8167185980', 'Jl. Melati 6', 'Lanjutan', 'K001', 'I003', 'M111', '2025-04-08'),
('P112', 'Agus Marlina', '8189880640', 'Jl. Kamboja 6', 'Dasar', 'K002', 'I003', 'M112', '2025-04-12'),
('P113', 'Rina Santoso', '8155260790', 'Jl. Melati 2', 'Dasar', 'K001', 'I001', 'M113', '2025-04-12'),
('P114', 'Siti Kurniawan', '8874051590', 'Jl. Kamboja 4', 'Lanjutan', 'K003', 'I001', 'M114', '2025-04-09'),
('P115', 'Rina Saputra', '8203888198', 'Jl. Kamboja 4', 'Lanjutan', 'K003', 'I002', 'M115', '2025-04-15'),
('P116', 'Lina Santoso', '8394072305', 'Jl. Kamboja 1', 'Menengah', 'K003', 'I003', 'M116', '2025-04-14'),
('P117', 'Dewi Wijaya', '8141092714', 'Jl. Merdeka 1', 'Dasar', 'K002', 'I003', 'M117', '2025-04-08'),
('P118', 'Andi Saputra', '8644226840', 'Jl. Cempaka 4', 'Lanjutan', 'K003', 'I002', 'M118', '2025-04-07'),
('P119', 'Dewi Haris', '8167133168', 'Jl. Melati 1', 'Dasar', 'K001', 'I003', 'M119', '2025-04-01'),
('P120', 'Joko Saputra', '8885796731', 'Jl. Merdeka 2', 'Lanjutan', 'K003', 'I003', 'M120', '2025-04-02'),
('P121', 'Lina Wijaya', '8417634553', 'Jl. Anggrek 6', 'Menengah', 'K001', 'I001', 'M121', '2025-04-11'),
('P122', 'Lina Prasetyo', '8918116979', 'Jl. Anggrek 5', 'Dasar', 'K001', 'I003', 'M122', '2025-04-02'),
('P123', 'Dewi Haris', '8611213527', 'Jl. Merdeka 3', 'Lanjutan', 'K001', 'I001', 'M123', '2025-04-11'),
('P124', 'Joko Marlina', '8651184364', 'Jl. Melati 5', 'Lanjutan', 'K002', 'I002', 'M124', '2025-04-02'),
('P125', 'Rudi Suryani', '8495855304', 'Jl. Melati 5', 'Lanjutan', 'K003', 'I003', 'M125', '2025-04-03'),
('P126', 'Siti Wijaya', '8866133505', 'Jl. Anggrek 2', 'Lanjutan', 'K001', 'I001', 'M126', '2025-04-02'),
('P127', 'Tina Lestari', '8738299826', 'Jl. Anggrek 6', 'Lanjutan', 'K001', 'I001', 'M127', '2025-04-10'),
('P128', 'Lina Kurniawan', '8890450778', 'Jl. Anggrek 4', 'Menengah', 'K003', 'I003', 'M128', '2025-04-10'),
('P129', 'Agus Saputra', '8780207918', 'Jl. Cempaka 1', 'Lanjutan', 'K001', 'I003', 'M129', '2025-04-01'),
('P130', 'Agus Marlina', '8129101441', 'Jl. Melati 4', 'Lanjutan', 'K003', 'I003', 'M130', '2025-04-11'),
('P131', 'Budi Suryani', '8157757737', 'Jl. Kamboja 1', 'Dasar', 'K003', 'I002', 'M131', '2025-04-05'),
('P132', 'Agus Marlina', '8451386122', 'Jl. Merdeka 1', 'Menengah', 'K002', 'I003', 'M132', '2025-04-14'),
('P133', 'Lina Wijaya', '8917699177', 'Jl. Merdeka 2', 'Menengah', 'K003', 'I001', 'M133', '2025-04-04'),
('P134', 'Agus Prasetyo', '8560013722', 'Jl. Merdeka 4', 'Lanjutan', 'K001', 'I003', 'M134', '2025-04-05'),
('P135', 'Rudi Wijaya', '8753611646', 'Jl. Kamboja 4', 'Lanjutan', 'K001', 'I003', 'M135', '2025-04-04'),
('P136', 'Dewi Wibowo', '8819346150', 'Jl. Anggrek 1', 'Dasar', 'K002', 'I003', 'M136', '2025-04-08'),
('P137', 'Tina Wijaya', '8387451855', 'Jl. Merdeka 4', 'Menengah', 'K001', 'I002', 'M137', '2025-04-04'),
('P138', 'Joko Prasetyo', '8766727379', 'Jl. Kenanga 3', 'Lanjutan', 'K003', 'I003', 'M138', '2025-04-07'),
('P139', 'Joko Saputra', '8293096655', 'Jl. Melati 1', 'Lanjutan', 'K001', 'I001', 'M139', '2025-04-08');



INSERT INTO pembayaran (id_pembayaran, id_peserta, tanggal_pembayaran, jumlah, status_pembayaran) VALUES
('PB100', 'P100', '2025-04-06', 700000, 'Lunas'),
('PB101', 'P101', '2025-04-07', 800000, 'Lunas'),
('PB102', 'P102', '2025-04-12', 800000, 'Lunas'),
('PB103', 'P103', '2025-04-11', 700000, 'Lunas'),
('PB104', 'P104', '2025-04-17', 800000, 'Lunas'),
('PB105', 'P105', '2025-04-17', 500000, 'Lunas'),
('PB106', 'P106', '2025-04-08', 800000, 'Lunas'),
('PB107', 'P107', '2025-04-16', 500000, 'Lunas'),
('PB108', 'P108', '2025-04-10', 700000, 'Lunas'),
('PB109', 'P109', '2025-04-15', 800000, 'Lunas'),
('PB110', 'P110', '2025-04-09', 500000, 'Lunas'),
('PB111', 'P111', '2025-04-09', 500000, 'Lunas'),
('PB112', 'P112', '2025-04-13', 800000, 'Lunas'),
('PB113', 'P113', '2025-04-16', 800000, 'Lunas'),
('PB114', 'P114', '2025-04-10', 500000, 'Lunas'),
('PB115', 'P115', '2025-04-19', 600000, 'Lunas'),
('PB116', 'P116', '2025-04-16', 800000, 'Lunas'),
('PB117', 'P117', '2025-04-09', 700000, 'Lunas'),
('PB118', 'P118', '2025-04-11', 600000, 'Lunas'),
('PB119', 'P119', '2025-04-06', 800000, 'Lunas'),
('PB120', 'P120', '2025-04-05', 500000, 'Lunas'),
('PB121', 'P121', '2025-04-12', 600000, 'Lunas'),
('PB122', 'P122', '2025-04-05', 500000, 'Lunas'),
('PB123', 'P123', '2025-04-13', 700000, 'Lunas'),
('PB124', 'P124', '2025-04-03', 600000, 'Lunas'),
('PB125', 'P125', '2025-04-07', 800000, 'Lunas'),
('PB126', 'P126', '2025-04-03', 700000, 'Lunas'),
('PB127', 'P127', '2025-04-14', 500000, 'Lunas'),
('PB128', 'P128', '2025-04-14', 600000, 'Lunas'),
('PB129', 'P129', '2025-04-06', 700000, 'Lunas'),
('PB130', 'P130', '2025-04-12', 800000, 'Lunas'),
('PB131', 'P131', '2025-04-10', 700000, 'Lunas'),
('PB132', 'P132', '2025-04-15', 700000, 'Lunas'),
('PB133', 'P133', '2025-04-09', 800000, 'Lunas'),
('PB134', 'P134', '2025-04-09', 500000, 'Lunas'),
('PB135', 'P135', '2025-04-09', 600000, 'Lunas'),
('PB136', 'P136', '2025-04-09', 800000, 'Lunas'),
('PB137', 'P137', '2025-04-06', 500000, 'Lunas'),
('PB138', 'P138', '2025-04-09', 500000, 'Lunas'),
('PB139', 'P139', '2025-04-11', 700000, 'Lunas');



INSERT INTO absensi (id_absensi, id_peserta, tanggal_absensi, status_absensi) VALUES
('A100', 'P100', '2025-04-07', 'Tidak Hadir'),
('A101', 'P101', '2025-04-10', 'Tidak Hadir'),
('A102', 'P102', '2025-04-15', 'Tidak Hadir'),
('A103', 'P103', '2025-04-12', 'Tidak Hadir'),
('A104', 'P104', '2025-04-20', 'Hadir'),
('A105', 'P105', '2025-04-19', 'Tidak Hadir'),
('A106', 'P106', '2025-04-09', 'Tidak Hadir'),
('A107', 'P107', '2025-04-17', 'Tidak Hadir'),
('A108', 'P108', '2025-04-13', 'Hadir'),
('A109', 'P109', '2025-04-18', 'Tidak Hadir'),
('A110', 'P110', '2025-04-11', 'Hadir'),
('A111', 'P111', '2025-04-10', 'Hadir'),
('A112', 'P112', '2025-04-16', 'Tidak Hadir'),
('A113', 'P113', '2025-04-17', 'Hadir'),
('A114', 'P114', '2025-04-12', 'Hadir'),
('A115', 'P115', '2025-04-20', 'Hadir'),
('A116', 'P116', '2025-04-19', 'Tidak Hadir'),
('A117', 'P117', '2025-04-11', 'Tidak Hadir'),
('A118', 'P118', '2025-04-13', 'Tidak Hadir'),
('A119', 'P119', '2025-04-08', 'Tidak Hadir'),
('A120', 'P120', '2025-04-08', 'Hadir'),
('A121', 'P121', '2025-04-13', 'Hadir'),
('A122', 'P122', '2025-04-08', 'Hadir'),
('A123', 'P123', '2025-04-14', 'Hadir'),
('A124', 'P124', '2025-04-06', 'Hadir'),
('A125', 'P125', '2025-04-10', 'Hadir'),
('A126', 'P126', '2025-04-05', 'Hadir'),
('A127', 'P127', '2025-04-17', 'Tidak Hadir'),
('A128', 'P128', '2025-04-16', 'Tidak Hadir'),
('A129', 'P129', '2025-04-09', 'Hadir'),
('A130', 'P130', '2025-04-13', 'Hadir'),
('A131', 'P131', '2025-04-12', 'Tidak Hadir'),
('A132', 'P132', '2025-04-16', 'Hadir'),
('A133', 'P133', '2025-04-11', 'Tidak Hadir'),
('A134', 'P134', '2025-04-10', 'Tidak Hadir'),
('A135', 'P135', '2025-04-10', 'Hadir'),
('A136', 'P136', '2025-04-12', 'Tidak Hadir'),
('A137', 'P137', '2025-04-09', 'Hadir'),
('A138', 'P138', '2025-04-12', 'Tidak Hadir'),
('A139', 'P139', '2025-04-13', 'Hadir');
