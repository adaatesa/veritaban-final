
CREATE TABLE Kullanici (
    KullaniciID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(100),
    Soyad NVARCHAR(100),
    Telefon NVARCHAR(15),
    Email NVARCHAR(100)
);
CREATE TABLE Durum (
    DurumID INT PRIMARY KEY IDENTITY(1,1),
    DurumAd NVARCHAR(50)
);
CREATE TABLE Kargo (
    KargoID INT PRIMARY KEY IDENTITY(1,1),
    TakipNumarasi NVARCHAR(50) UNIQUE,
    GonderenKullaniciID INT,
    AliciKullaniciID INT,
    GonderenAdresi NVARCHAR(255),
    AliciAdresi NVARCHAR(255),
    GonderimTarihi DATETIME,
    TeslimatTarihi DATETIME,
    DurumID INT,
    FOREIGN KEY (GonderenKullaniciID) REFERENCES Kullanici(KullaniciID),
    FOREIGN KEY (AliciKullaniciID) REFERENCES Kullanici(KullaniciID),
    FOREIGN KEY (DurumID) REFERENCES Durum(DurumID)
);

CREATE TABLE KargoHareketleri (
    HareketID INT PRIMARY KEY IDENTITY(1,1),
    KargoID INT,
    HareketTarihi DATETIME,
    Aciklama NVARCHAR(255),
    FOREIGN KEY (KargoID) REFERENCES Kargo(KargoID)
);CREATE TABLE KargoTeslimat (
    TeslimatID INT PRIMARY KEY IDENTITY(1,1),
    KargoID INT,
    TeslimatTarihi DATETIME,
    TeslimatDurumu NVARCHAR(50),  -- Örneğin: "Teslim Edildi", "Dağıtımda" vb.
    TeslimatYeri NVARCHAR(255),   -- Teslimat yapılan yer
    TeslimatPersoneli NVARCHAR(100),  -- Teslimat yapan personelin adı
    FOREIGN KEY (KargoID) REFERENCES Kargo(KargoID)
);
CREATE TABLE TeslimatAdresi (
    AdresID INT PRIMARY KEY IDENTITY(1,1),
    KargoID INT,
    Adres NVARCHAR(255),
    Sehir NVARCHAR(100),
    Ilce NVARCHAR(100),
    PostaKodu NVARCHAR(20),
    Ulke NVARCHAR(100),
    FOREIGN KEY (KargoID) REFERENCES Kargo(KargoID)
);
CREATE TABLE Odeme (
    OdemeID INT PRIMARY KEY IDENTITY(1,1),
    KargoID INT,
    OdemeTarihi DATETIME,
    OdemeTutarı DECIMAL(10, 2),
    OdemeDurumu NVARCHAR(50),   -- Örneğin: "Ödendi", "Beklemede"
    OdemeYöntemi NVARCHAR(50),  -- Örneğin: "Kredi Kartı", "Nakit" vb.
    FOREIGN KEY (KargoID) REFERENCES Kargo(KargoID)
);
CREATE TABLE KargoSigorta (
    SigortaID INT PRIMARY KEY IDENTITY(1,1),
    KargoID INT,
    SigortaTutarı DECIMAL(10, 2),
    SigortaDurumu NVARCHAR(50),  -- Örneğin: "Aktif", "Sona Erdi"
    SigortaFirma NVARCHAR(100),  -- Sigorta şirketi adı
    FOREIGN KEY (KargoID) REFERENCES Kargo(KargoID)
);
