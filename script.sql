USE [KargoTakip]
GO
/****** Object:  Table [dbo].[Durum]    Script Date: 9.01.2025 03:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Durum](
	[DurumID] [int] IDENTITY(1,1) NOT NULL,
	[DurumAd] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DurumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kargo]    Script Date: 9.01.2025 03:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargo](
	[KargoID] [int] IDENTITY(1,1) NOT NULL,
	[TakipNumarasi] [nvarchar](50) NULL,
	[GonderenKullaniciID] [int] NULL,
	[AliciKullaniciID] [int] NULL,
	[GonderenAdresi] [nvarchar](255) NULL,
	[AliciAdresi] [nvarchar](255) NULL,
	[GonderimTarihi] [datetime] NULL,
	[TeslimatTarihi] [datetime] NULL,
	[DurumID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KargoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TakipNumarasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KargoHareketleri]    Script Date: 9.01.2025 03:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoHareketleri](
	[HareketID] [int] IDENTITY(1,1) NOT NULL,
	[KargoID] [int] NULL,
	[HareketTarihi] [datetime] NULL,
	[Aciklama] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[HareketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KargoSigorta]    Script Date: 9.01.2025 03:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoSigorta](
	[SigortaID] [int] IDENTITY(1,1) NOT NULL,
	[KargoID] [int] NULL,
	[SigortaTutarı] [decimal](10, 2) NULL,
	[SigortaDurumu] [nvarchar](50) NULL,
	[SigortaFirma] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SigortaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KargoTeslimat]    Script Date: 9.01.2025 03:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoTeslimat](
	[TeslimatID] [int] IDENTITY(1,1) NOT NULL,
	[KargoID] [int] NULL,
	[TeslimatTarihi] [datetime] NULL,
	[TeslimatDurumu] [nvarchar](50) NULL,
	[TeslimatYeri] [nvarchar](255) NULL,
	[TeslimatPersoneli] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeslimatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 9.01.2025 03:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](100) NULL,
	[Soyad] [nvarchar](100) NULL,
	[Telefon] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odeme]    Script Date: 9.01.2025 03:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odeme](
	[OdemeID] [int] IDENTITY(1,1) NOT NULL,
	[KargoID] [int] NULL,
	[OdemeTarihi] [datetime] NULL,
	[OdemeTutarı] [decimal](10, 2) NULL,
	[OdemeDurumu] [nvarchar](50) NULL,
	[OdemeYöntemi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OdemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeslimatAdresi]    Script Date: 9.01.2025 03:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeslimatAdresi](
	[AdresID] [int] IDENTITY(1,1) NOT NULL,
	[KargoID] [int] NULL,
	[Adres] [nvarchar](255) NULL,
	[Sehir] [nvarchar](100) NULL,
	[Ilce] [nvarchar](100) NULL,
	[PostaKodu] [nvarchar](20) NULL,
	[Ulke] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kargo]  WITH CHECK ADD FOREIGN KEY([AliciKullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[Kargo]  WITH CHECK ADD FOREIGN KEY([DurumID])
REFERENCES [dbo].[Durum] ([DurumID])
GO
ALTER TABLE [dbo].[Kargo]  WITH CHECK ADD FOREIGN KEY([GonderenKullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[KargoHareketleri]  WITH CHECK ADD FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargo] ([KargoID])
GO
ALTER TABLE [dbo].[KargoSigorta]  WITH CHECK ADD FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargo] ([KargoID])
GO
ALTER TABLE [dbo].[KargoTeslimat]  WITH CHECK ADD FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargo] ([KargoID])
GO
ALTER TABLE [dbo].[Odeme]  WITH CHECK ADD FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargo] ([KargoID])
GO
ALTER TABLE [dbo].[TeslimatAdresi]  WITH CHECK ADD FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargo] ([KargoID])
GO
