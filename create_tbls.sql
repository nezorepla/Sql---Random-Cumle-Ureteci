USE [chatbot]
GO

/****** Object:  Table [dbo].[tbl_fiil]    Script Date: 5.10.2017 13:03:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_fiil](
	[fiil] [varchar](8000) NULL,
	[mastar] [varchar](8000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


-------''--

USE [chatbot]
GO

/****** Object:  Table [dbo].[tbl_fiil_kip]    Script Date: 5.10.2017 13:04:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_fiil_kip](
	[icode] [int] IDENTITY(1,1) NOT NULL,
	[kip_tip] [varchar](15) NULL,
	[kip] [varchar](35) NULL,
	[kip_eki] [varchar](15) NULL,
	[kip_eki_v2] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


--------
USE [chatbot]
GO

/****** Object:  Table [dbo].[tbl_fiil_sahis]    Script Date: 5.10.2017 13:05:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[tbl_fiil_sahis](
	[icode] [int] IDENTITY(1,1) NOT NULL,
	[sahis_tip] [varchar](15) NULL,
	[sahis] [varchar](35) NULL,
	[sahis_eki] [varchar](15) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[tbl_fiil_sahis] ADD [sahis_eki_v2] [varchar](50) NULL

GO

SET ANSI_PADDING OFF
GO

--------
USE [chatbot]
GO

/****** Object:  Table [dbo].[tbl_fiil_zaman]    Script Date: 5.10.2017 13:06:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_fiil_zaman](
	[icode] [int] IDENTITY(1,1) NOT NULL,
	[zaman_tip] [varchar](15) NULL,
	[zaman] [varchar](35) NULL,
	[zaman_eki] [varchar](15) NULL,
	[zaman_eki_v2] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into tbl_fiil values('ol','mak');
insert into tbl_fiil values('de','mek');
insert into tbl_fiil values('yap','mak');
insert into tbl_fiil values('al','mak');
insert into tbl_fiil values('gel','mek');
insert into tbl_fiil values('ver','mek');
insert into tbl_fiil values('iste','mek');
insert into tbl_fiil values('çık','mak');
insert into tbl_fiil values('gör','mek');
insert into tbl_fiil values('git','mek');
insert into tbl_fiil values('bil','mek');
insert into tbl_fiil values('bak','mak');
insert into tbl_fiil values('çalış','mak');
insert into tbl_fiil values('başla','mak');
insert into tbl_fiil values('kal','mak');
insert into tbl_fiil values('yapıl','mak');
insert into tbl_fiil values('bulun','mak');
insert into tbl_fiil values('söyle','mek');
insert into tbl_fiil values('gerek','mek');
insert into tbl_fiil values('geç','mek');
insert into tbl_fiil values('gir','mek');
insert into tbl_fiil values('ye','mek');
insert into tbl_fiil values('bul','mak');
insert into tbl_fiil values('yaşa','mak');
insert into tbl_fiil values('düşün','mek');
insert into tbl_fiil values('göster','mek');
insert into tbl_fiil values('et','mek');
insert into tbl_fiil values('getir','mek');
insert into tbl_fiil values('kullan','mak');
insert into tbl_fiil values('dur','mak');
insert into tbl_fiil values('çek','mek');
insert into tbl_fiil values('konuş','mak');
insert into tbl_fiil values('anla','mak');
insert into tbl_fiil values('sor','mak');
insert into tbl_fiil values('sağla','mak');
insert into tbl_fiil values('kullanıl','mak');
insert into tbl_fiil values('dön','mek');
insert into tbl_fiil values('aç','mak');
insert into tbl_fiil values('otur','mak');
insert into tbl_fiil values('anlat','mak');
insert into tbl_fiil values('bırak','mak');
insert into tbl_fiil values('yaz','mak');
insert into tbl_fiil values('at','mak');
insert into tbl_fiil values('tut','mak');
insert into tbl_fiil values('düş','mek');
insert into tbl_fiil values('duy','mak');
insert into tbl_fiil values('sev','mek');
insert into tbl_fiil values('çıkar','mak');
insert into tbl_fiil values('koy','mak');
insert into tbl_fiil values('veril','mek');
insert into tbl_fiil values('alın','mak');
insert into tbl_fiil values('bekle','mek');
insert into tbl_fiil values('oku','mak');
insert into tbl_fiil values('ara','mak');
insert into tbl_fiil values('taşı','mak');
insert into tbl_fiil values('görül','mek');
insert into tbl_fiil values('oluş','mak');
insert into tbl_fiil values('kazan','mak');
insert into tbl_fiil values('öğren','mek');
insert into tbl_fiil values('sür','mek');
insert into tbl_fiil values('bit','mek');
insert into tbl_fiil values('devam et','mek');
insert into tbl_fiil values('açıl','mak');
insert into tbl_fiil values('inan','mak');
insert into tbl_fiil values('oluştur','mak');
insert into tbl_fiil values('tanı','mak');
insert into tbl_fiil values('kalk','mak');
insert into tbl_fiil values('geliş','mek');
insert into tbl_fiil values('oyna','mak');
insert into tbl_fiil values('değiş','mek');
insert into tbl_fiil values('yarat','mak');
insert into tbl_fiil values('ulaş','mak');
insert into tbl_fiil values('san','mak');
insert into tbl_fiil values('geçir','mek');
insert into tbl_fiil values('kur','mak');
insert into tbl_fiil values('iç','mek');
insert into tbl_fiil values('art','mak');
insert into tbl_fiil values('kabul et','mek');
insert into tbl_fiil values('görün','mek');
insert into tbl_fiil values('dinle','mek');
insert into tbl_fiil values('unut','mak');
insert into tbl_fiil values('yürü','mek');
insert into tbl_fiil values('uygula','mak');
insert into tbl_fiil values('izle','mek');
insert into tbl_fiil values('öl','mek');
insert into tbl_fiil values('ayrıl','mak');
insert into tbl_fiil values('hisset','mek');
insert into tbl_fiil values('yat','mak');
insert into tbl_fiil values('götür','mek');
insert into tbl_fiil values('katıl','mak');
insert into tbl_fiil values('kurul','mak');
insert into tbl_fiil values('öde','mek');
insert into tbl_fiil values('in','mek');
insert into tbl_fiil values('sun','mak');
insert into tbl_fiil values('bilin','mek');
insert into tbl_fiil values('kaldır','mak');
insert into tbl_fiil values('hazırla','mak');
insert into tbl_fiil values('sahip ol','mak');
insert into tbl_fiil values('koru','mak');
insert into tbl_fiil values('belirt','mek');
insert into tbl_fiil values('kaybet','mek');
insert into tbl_fiil values('değiştir','mek');
insert into tbl_fiil values('sürdür','mek');
insert into tbl_fiil values('doğ','mak');
insert into tbl_fiil values('kaç','mak');
insert into tbl_fiil values('anlaşıl','mak');
insert into tbl_fiil values('var','mak');
insert into tbl_fiil values('gül','mek');
insert into tbl_fiil values('sat','mak');
insert into tbl_fiil values('gönder','mek');
insert into tbl_fiil values('kes','mek');
insert into tbl_fiil values('vur','mak');
insert into tbl_fiil values('hazırlan','mak');
insert into tbl_fiil values('seç','mek');
insert into tbl_fiil values('uygulan','mak');
insert into tbl_fiil values('koş','mak');
insert into tbl_fiil values('kork','mak');
insert into tbl_fiil values('karşılaş','mak');
insert into tbl_fiil values('büyü','mek');
insert into tbl_fiil values('dolaş','mak');
insert into tbl_fiil values('yaşan','mak');
insert into tbl_fiil values('den','mek');
insert into tbl_fiil values('çekil','mek');
insert into tbl_fiil values('çal','mak');
insert into tbl_fiil values('açıkla','mak');
insert into tbl_fiil values('uğraş','mak');
insert into tbl_fiil values('yet','mek');
insert into tbl_fiil values('üret','mek');
insert into tbl_fiil values('dayan','mak');
insert into tbl_fiil values('kurtul','mak');
insert into tbl_fiil values('edil','mek');
insert into tbl_fiil values('fark et','mek');
insert into tbl_fiil values('uyu','mak');
insert into tbl_fiil values('yan','mak');
insert into tbl_fiil values('bas','mak');
insert into tbl_fiil values('çevir','mek');
insert into tbl_fiil values('sağlan','mak');
insert into tbl_fiil values('söylen','mek');
insert into tbl_fiil values('yaklaş','mak');
insert into tbl_fiil values('hatırla','mak');
insert into tbl_fiil values('kapat','mak');
insert into tbl_fiil values('etkile','mek');
insert into tbl_fiil values('ağla','mak');
insert into tbl_fiil values('artır','mak');
insert into tbl_fiil values('kesil','mek');
insert into tbl_fiil values('seyret','mek');
insert into tbl_fiil values('içer','mek');
insert into tbl_fiil values('sayıl','mak');
insert into tbl_fiil values('topla','mak');
insert into tbl_fiil values('aş','mak');
insert into tbl_fiil values('bağır','mak');
insert into tbl_fiil values('davran','mak');
insert into tbl_fiil values('yararlan','mak');
insert into tbl_fiil values('getiril','mek');
insert into tbl_fiil values('tutul','mak');
insert into tbl_fiil values('incele','mek');
insert into tbl_fiil values('doldur','mak');
insert into tbl_fiil values('uy','mak');
insert into tbl_fiil values('yazıl','mak');
insert into tbl_fiil values('say','mak');
insert into tbl_fiil values('atıl','mak');
insert into tbl_fiil values('belirle','mek');
insert into tbl_fiil values('benze','mek');
insert into tbl_fiil values('sok','mak');
insert into tbl_fiil values('kurtar','mak');
insert into tbl_fiil values('tercih et','mek');
insert into tbl_fiil values('uzan','mak');
insert into tbl_fiil values('ekle','mek');
insert into tbl_fiil values('ayır','mak');
insert into tbl_fiil values('yak','mak');
insert into tbl_fiil values('giy','mek');
insert into tbl_fiil values('karşıla','mak');
insert into tbl_fiil values('yüksel','mek');
insert into tbl_fiil values('bitir','mek');
insert into tbl_fiil values('gerçekleş','mek');
insert into tbl_fiil values('dönüş','mek');
insert into tbl_fiil values('dile','mek');
insert into tbl_fiil values('belirlen','mek');
insert into tbl_fiil values('değerlendir','mek');
insert into tbl_fiil values('yakala','mak');
insert into tbl_fiil values('dikkat et','mek');
insert into tbl_fiil values('toplan','mak');
insert into tbl_fiil values('karış','mak');
insert into tbl_fiil values('işle','mek');
insert into tbl_fiil values('karıştır','mak');
insert into tbl_fiil values('evlen','mek');
insert into tbl_fiil values('çıkarıl','mak');
insert into tbl_fiil values('ifade et','mek');
insert into tbl_fiil values('söz et','mek');
insert into tbl_fiil values('öldür','mek');
insert into tbl_fiil values('bozul','mak');
insert into tbl_fiil values('ilgilen','mek');
insert into tbl_fiil values('takıl','mak');
insert into tbl_fiil values('geliştir','mek');
insert into tbl_fiil values('azal','mak');
insert into tbl_fiil values('bağla','mak');
insert into tbl_fiil values('yayımlan','mak');
insert into tbl_fiil values('bin','mek');
insert into tbl_fiil values('kıl','mak');
insert into tbl_fiil values('denil','mek');
insert into tbl_fiil values('üretil','mek');
insert into tbl_fiil values('görüş','mek');
insert into tbl_fiil values('uzat','mak');
insert into tbl_fiil values('bağlan','mak');
insert into tbl_fiil values('yardımcı ol','mak');
insert into tbl_fiil values('paylaş','mak');
insert into tbl_fiil values('yaptır','mak');
insert into tbl_fiil values('uğraş','mak');
insert into tbl_fiil values('belirtil','mek');
insert into tbl_fiil values('yayıl','mak');
insert into tbl_fiil values('ak','m');
insert into tbl_fiil values('çiz','mek');
insert into tbl_fiil values('düşünül','mek');
insert into tbl_fiil values('ilerle','mek');
insert into tbl_fiil values('düzenle','mek');
insert into tbl_fiil values('satın al','mak');
insert into tbl_fiil values('sunul','mak');
insert into tbl_fiil values('hareket et','mek');
insert into tbl_fiil values('isten','mek');
insert into tbl_fiil values('kapan','mak');

 

insert into tbl_fiil_kip   values('dilek kipi','dilek şart','s*','s,DuzGenisSesliHarf');
insert into tbl_fiil_kip   values('dilek kipi','emir',' ','');
insert into tbl_fiil_kip   values('dilek kipi','gereklilik','m*l%','m,DuzGenisSesliHarf,l,DarSesliHarf');
insert into tbl_fiil_kip   values('dilek kipi','istek','*','DuzGenisSesliHarf');
insert into tbl_fiil_kip   values('haber kipi','gelecek zaman','*c*k','DuzGenisSesliHarf,c,DuzGenisSesliHarf,k');
insert into tbl_fiil_kip   values('haber kipi','geniş zaman','?r','DarSesliHarf,r');
insert into tbl_fiil_kip   values('haber kipi','görülmüş geçmiş zaman','d?','KaynastirmaHarfi(y),Benzesme(d),DarSesliHarf');
insert into tbl_fiil_kip   values('haber kipi','öğrenilmiş geçmiş zaman','m?ş','KaynastirmaHarfi(y),m,DarSesliHarf,ş');
insert into tbl_fiil_kip   values('haber kipi','şimdiki zaman','?yor','DarSesliHarf,y,o,r');
insert into tbl_fiil_kip   values('haber kipi','şimdiki zaman','m*kt*','m,DuzGenisSesliHarf,k,t,DuzGenisSesliHarf');


insert into tbl_fiil_zaman   values('basit zaman','basit zaman','','');
insert into tbl_fiil_zaman   values('bileşik zaman','hikaye','d?','');
insert into tbl_fiil_zaman   values('bileşik zaman','rivayet','m?ş','');
insert into tbl_fiil_zaman   values('bileşik zaman','şart','s*','');

insert into tbl_fiil_sahis   values('tekil','ben','?m','UnluTuremesi,m');
insert into tbl_fiil_sahis   values('tekil','sen','s?n','s,DarSesliHarf,n');
insert into tbl_fiil_sahis   values('tekil','o',' ',' ');
insert into tbl_fiil_sahis   values('çoğul','biz','?z','KaynastirmaHarfi, DarSesliHarf,z');
insert into tbl_fiil_sahis   values('çoğul','siz','s?n?z','s,DarSesliHarf,n,DarSesliHarf,z');
insert into tbl_fiil_sahis   values('çoğul','onlar','l*r','l,DuzGenisSesliHarf,r');
