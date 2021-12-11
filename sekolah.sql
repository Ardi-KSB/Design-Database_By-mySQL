-- Membuat Database Sekolah --
create database sekolah;

-- Menampilkan AllDb --
show databases;

-- Masuk ke DB --
use sekolah;

-- Membuat table Kelas --
create table Kelas(id int primary key auto_increment,
 Nama_Kelas varchar(20));

-- Memasukkan data ke table Kelas --
 insert into Kelas(Nama_Kelas) values ("1"), ("2"), ("3");

-- Menampilkan data Table Kelas --
select * from Kelas;
 
--  Membuat Table Siswa --
 create table Siswa(id int primary key auto_increment,
 Nama_Siswa varchar(20),
 NIS varchar(10),
 Alamat varchar (100),
 Kelas_ID int,
 foreign key (Kelas_ID) references kelas(id));
 
-- Memasukkan Data Siswa --
 insert into Siswa(Nama_Siswa, NIS, Alamat, Kelas_ID)
 values ("Auzan", "001", "Italia", 3),
		("Ardi", "002", "Australia", 1),
        ("Dolton", "003", "Canada", 2),
        ("Dellila", "004", "France", 3),
        ("Inayat", "005", "China", 1),
        ("Lutfhi", "006", "Denmark", 2);

-- Menampilkan Data Siswa --
select * from Siswa;


-- Membuat Table Data Guru --
create table Guru(id int primary key auto_increment,
 Nama_Guru varchar(20),
 Gaji varchar(20));

-- Memasukkan Data Guru --
 insert into Guru(Nama_Guru, Gaji) values 
	("David", "100.000.000"),
    ("Thorique", "50.000.000"),
    ("Hilal", "25.000.000");

-- Menampilakan Data Guru --
select * from Guru;
    

-- Membuat Table data Jadwal_Extra --
create table Jadwal_Extra(id int primary key auto_increment,
Waktu varchar(20));

-- Memasukkan data Jadwal_Extra --
 insert into Jadwal_Extra(Waktu)
 values ("Sabtu, 16.00-18.00"), ("Minggu, 10.00-11.00");
 
-- Menampilkan Data Jadwal_Extra --
select * from Jadwal_Extra;
  
-- Membuat Table Extra --
create table Extra(id int primary key auto_increment,
Nama_Extra varchar(20),
Guru_ID int, 
Jadwal_Extra_ID int,
foreign key (Guru_ID) references Guru(id),
foreign key (Jadwal_Extra_ID) references Jadwal_Extra(id));

-- Memasukkan Data Extra --
insert into Extra(Nama_Extra, Guru_ID, Jadwal_Extra_ID)
 values ("Pencak Silat", 1, 1),
		("Menari", 2, 1),
        ("Memasak", 2, 2),
        ("Menegemen Penjualan", 3, 1);

-- Menampilkan data Extra --
select * from Extra;

-- Membuat table GetExtra --
create table GetExtra(id int primary key auto_increment,
Siswa_ID int,
Extra_ID int,
foreign key(Siswa_ID) references Siswa(id),
foreign key(Extra_ID) references Extra(id));

-- Memasukkan Data GetExtra --
insert into GetExtra (Siswa_ID, Extra_ID)
values
(1, 1), (2, 2), (3, 1), (4, 4), (5, 3), (6, 4),
(1, 2), (2, 3), (3, 4), (4, 1), (5, 2), (6, 1);

-- Menampilkan Data GetExtra --
select * from GetExtra;

-- Menampilkan data yang dipilih --
select GetExtra.id, Siswa.Nama_Siswa, Extra.Nama_Extra
from GetExtra
join Siswa on GetExtra.Siswa_ID = Siswa.id
join Extra on GetExtra.Extra_ID = Extra.id
order by GetExtra.id;