create database Education
block comment(*//*) */
-- use Education --> line comment (--)


create table Egitmenler (
	EgitmenID int IDENTITY(1,1) PRIMARY KEY,
	EgitmenAdi nvarchar(100),
	EgitmenSoyadi nvarchar(100),
)



create table Egitimler (
	EgitimID int identity(100,1) PRIMARY KEY,
	EgitimAdi nvarchar(100) NOT NULL,
	EgitimTarihi DATE,
)



create table Ogrenciler (
	OgrenciID int IDENTITY(1,1) PRIMARY KEY,
	OgrenciAdi nvarchar(100),
	OgrenciSoyadi nvarchar(100),
)



alter table Ogrenciler
add OgrenciTelefonNumarasi nvarchar(15)



drop table Egitmenler



truncate table Ogrenciler where OgrenciID = 2



exec sp_rename 'Egitimler', 'Bootcampler'



create table Egitmenler(
	EgitmenID int IDENTITY(1,1) PRIMARY KEY,
	EgitmenAdi nvarchar(100),
	EgitmenSoyadi nvarchar(100),
)



select * from egitmenler

select EgitmenID, EgitmenSoyadi from egitmenler

select EgitmenAdi as Ad from egitmenler

select EgitimAdi from Bootcampler

select EgitimTarihi as BootcampDersTarihi from Bootcampler
