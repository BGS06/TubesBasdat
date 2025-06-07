-- SOLUSI SEDERHANA: Perbaiki hanya foreign key constraint
-- Hapus tabel yang sudah ada
DROP TABLE IF EXISTS Absensi;
DROP TABLE IF EXISTS Kursus;
DROP TABLE IF EXISTS Pembayaran;
DROP TABLE IF EXISTS Kendaraan;
DROP TABLE IF EXISTS Instruktur;
DROP TABLE IF EXISTS Peserta;

-- Buat ulang dengan struktur yang benar
CREATE TABLE Peserta (
    ID_Peserta VARCHAR(10) PRIMARY KEY,
    Nama VARCHAR(100),
    No_Telepon VARCHAR(15),
    Alamat VARCHAR(255),
    Tingkat_Keterampilan VARCHAR(20)
);

CREATE TABLE Instruktur (
    ID_Instruktur INT PRIMARY KEY,
    Nama_Instruktur VARCHAR(100),
    No_Telepon_Instruktur VARCHAR(15)
);

CREATE TABLE Kendaraan (
    ID_Kendaraan INT PRIMARY KEY,
    Plat_Nomor VARCHAR(20) UNIQUE,
    Merek VARCHAR(50),
    Model VARCHAR(50)
);

-- Yang diperbaiki: ID_Peserta diganti dari INT ke VARCHAR(10)
CREATE TABLE Pembayaran (
    ID_Pembayaran INT PRIMARY KEY,
    ID_Peserta VARCHAR(10),
    Tanggal DATE,
    Pembayaran VARCHAR(100),
    Jumlah DECIMAL(10, 2),
    Status_Pembayaran VARCHAR(50),
    FOREIGN KEY (ID_Peserta) REFERENCES Peserta(ID_Peserta)
);

CREATE TABLE Kursus (
    ID_Kursus INT PRIMARY KEY,
    Tanggal DATE,
    ID_Peserta VARCHAR(10),
    ID_Instruktur INT,
    ID_Kendaraan INT,
    ID_Pembayaran INT,
    FOREIGN KEY (ID_Peserta) REFERENCES Peserta(ID_Peserta),
    FOREIGN KEY (ID_Instruktur) REFERENCES Instruktur(ID_Instruktur),
    FOREIGN KEY (ID_Kendaraan) REFERENCES Kendaraan(ID_Kendaraan),
    FOREIGN KEY (ID_Pembayaran) REFERENCES Pembayaran(ID_Pembayaran)
);

CREATE TABLE Absensi (
    ID_Absensi INT PRIMARY KEY,
    ID_Peserta VARCHAR(10),
    Tanggal_Absensi DATE,
    Status_Absensi VARCHAR(50),
    FOREIGN KEY (ID_Peserta) REFERENCES Peserta(ID_Peserta)
);

-- Insert semua data
INSERT INTO Peserta (ID_Peserta, Nama, No_Telepon, Alamat, Tingkat_Keterampilan) VALUES
('P001', 'Andi Wijaya', '081234567890', 'Jl. Merdeka 1', 'Menengah'),
('P002', 'Sari Lestari', '082233445566', 'Jl. Melati 10', 'Dasar'),
('P003', 'Doni Saputra', '081345678901', 'Jl. Kenanga 5', 'Dasar'),
('P004', 'Lina Marlina', '082145672334', 'Jl. Anggrek 2', 'Lanjutan'),
('P005', 'Bayu Prasetyo', '081987654321', 'Jl. Mawar 7', 'Menengah'),
('P006', 'Rita Anggraini', '082278945612', 'Jl. Melur 8', 'Dasar'),
('P007', 'Yoga Permana', '083298112345', 'Jl. Kamboja 3', 'Lanjutan'),
('P009', 'Roni Wijaya', '081267894561', 'Jl. Cemara 9', 'Menengah');

INSERT INTO Instruktur (ID_Instruktur, Nama_Instruktur, No_Telepon_Instruktur) VALUES
(1, 'Rina Kurniawan', '3 tahun'),
(2, 'Dedi Haris', '4 tahun'),
(3, 'Budi Santoso', '5 tahun'),
(4, 'Tina Melati', '1 tahun'),
(5, 'Eko Prabowo', '6 tahun');

INSERT INTO Kendaraan (ID_Kendaraan, Plat_Nomor, Merek, Model) VALUES
(1, 'B 1234 XY', 'Toyota', 'Avanza'),
(2, 'B 5678 ABC', 'Honda', 'Mobilio'),
(3, 'B 9988 RT', 'Suzuki', 'Ertiga'),
(4, 'B 5588 ST', 'Suzuki', 'Ertiga'),
(5, 'B 1234 XYZ', 'Toyota', 'Avanza'),
(6, 'B 5566 TV', 'Nissan', 'Livina'),
(7, 'F 5566 YY', 'Nissan', 'Livina'),
(8, 'G 7788 QQ', 'Daihatsu', 'Sigra');

INSERT INTO Pembayaran (ID_Pembayaran, ID_Peserta, Tanggal, Pembayaran, Jumlah, Status_Pembayaran) VALUES
(1, 'P001', '2025-04-25', 'Lunas', 600000, 'Lunas'),
(2, 'P002', '2025-04-27', 'Lunas', 500000, 'Lunas'),
(3, 'P003', '2025-04-28', 'Lunas', 500000, 'Lunas'),
(4, 'P004', '2025-04-29', 'Lunas', 500000, 'Lunas'),
(5, 'P005', '2025-04-30', 'Lunas', 600000, 'Lunas'),
(6, 'P006', '2025-04-30', 'Lunas', 500000, 'Lunas'),
(7, 'P007', '2025-04-29', 'Lunas', 600000, 'Lunas'),
(8, 'P009', '2025-04-10', 'Lunas', 600000, 'Lunas');

INSERT INTO Kursus (ID_Kursus, Tanggal, ID_Peserta, ID_Instruktur, ID_Kendaraan, ID_Pembayaran) VALUES
(1, '2025-05-02', 'P001', 1, 2, 1),
(2, '2025-05-02', 'P002', 1, 2, 2),
(3, '2025-05-03', 'P003', 2, 3, 3),
(4, '2025-05-04', 'P004', 2, 3, 4),
(5, '2025-05-01', 'P005', 3, 1, 5),
(6, '2025-05-04', 'P006', 4, 4, 6),
(7, '2025-05-04', 'P007', 4, 6, 7),
(8, '2025-05-05', 'P009', 5, 8, 8);

INSERT INTO Absensi (ID_Absensi, ID_Peserta, Tanggal_Absensi, Status_Absensi) VALUES
(1, 'P001', '2025-05-02', 'Hadir'),
(2, 'P002', '2025-05-02', 'Hadir'),
(3, 'P003', '2025-05-03', 'Tidak Hadir'),
(4, 'P004', '2025-05-04', 'Hadir'),
(5, 'P005', '2025-05-01', 'Hadir'),
(6, 'P006', '2025-05-04', 'Tidak Hadir'),
(7, 'P007', '2025-05-04', 'Hadir'),
(8, 'P009', '2025-05-05', 'Tidak Hadir');