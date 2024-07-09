-- create tabel nasabah

create table Nasabah(
id BIGSERIAL primary key, 
nama VARCHAR(100) not null,
alamat TEXT,
no_telepon VARCHAR(20),
tgl_lahir DATE,
email VARCHAR(100)
);

-- read tabel nasabah

select * from nasabah;

-- create tabel akun

create table Akun(
id BIGSERIAL primary key,
nasabah_id BIGINT,
no_rekening VARCHAR(100) not null,
tgl_buka DATE,
saldo DECIMAL(18,2) default 0,
level_akun VARCHAR(50),
foreign key (nasabah_id) references Nasabah(id)
);	

-- read tabel akun
select * from Akun;

-- create table transaksi

create table Transaksi(
id BIGSERIAL primary key,
akun_id BIGINT,
tgl_transaksi TIMESTAMP not null,
jumlah DECIMAL(18,2) not null,
keterangan text,
jenis VARCHAR(20) not null,
foreign key (akun_id) references akun(id)
);

-- read tabel transaksi

select * from Transaksi;


-- create/insert data untuk tabel Nasabah

insert into Nasabah (nama,alamat,no_telepon,tgl_lahir,email)values
('alex','jl.anggur no.1','081371823912','1990-01-20','alexgunawan20@gmail.com'),
('john','jl.belimbing no.21','083182901239','1972-06-19','johndoee12@gmail.com'),
('matthew','jl.pemuda no.5','087743721956','2000-07-02','matthewalxndr@gmail.com'),
('derrick','jl.nusa indah no.19','088281034901','1992-01-18','derrickmch12@gmail.com'),
('joseph','jl.almond no.102','085382910993','1987-08-17','josephdnr23@gmail.com');

-- update data untuk tabel nasabah

update nasabah 
set nama='albert', alamat = 'jl.indah permai no.98', no_telepon = '087372223819', tgl_lahir = '2001-10-28' , email = 'albertsbstn12@mail.com'
where id = 1;

-- delete data dari tabel nasabah

delete from nasabah where id = 5;

select nama,alamat,no_telepon,tgl_lahir,email from nasabah;


-- create/insert data untuk tabel akun

insert into Akun (nasabah_id,no_rekening,tgl_buka,saldo,level_akun)values
(1,'2910381722','2019-10-27','2000000','platinum'),
(2,'2033942192','2023-01-12','25000000','gold'),
(3,'2033339102','2015-07-07','1800000','diamond'),
(4,'21030129991','2024-02-23','17000000','silver');

-- update data untuk tabel akun

update akun 
set saldo = '22500000', level_akun = 'platinum'
where id = 2;

-- delete data dari tabel akun

delete from akun where id = 4;

select nasabah_id,no_rekening,tgl_buka,saldo,level_akun from akun;

-- create/insert data untuk tabel transaksi

insert into transaksi (akun_id,tgl_transaksi,jumlah,keterangan,jenis)values
(1, now(),'100000', 'deposit' , 'debit'),
(2, now(),'2000000', 'withdraw' , 'kredit'),
(3, now(),'1200000', 'deposit', 'debit');

-- update data untuk tabel transaksi

update transaksi
set keterangan = 'withdraw', jenis = 'kredit'
where id = 4;

select akun_id,tgl_transaksi,jumlah,keterangan,jenis from transaksi;