alter proc  sp_fiil_ekler as

declare @fiil varchar(50)
declare @kip_eki varchar(50)
declare @kip  varchar(50)
declare @zaman_eki varchar(50)
declare @zaman varchar(50)
declare @sahis_eki varchar(50)
declare @sahis varchar(50)
declare @kural1 varchar(150)
declare @kural2 varchar(150)
declare @kural3 varchar(150)
 

SELECT TOP 1 @fiil=fiil 
FROM tbl_fiil  --  where  fiil like'sahip ol%' 
--where left(right(fiil,2),1) =  'ı'
 ORDER BY NEWID()  ;
  
SELECT    TOP 1 @kip_eki=kip_eki_v2,@kip=kip
 FROM tbl_fiil_kip --  where kip ='şimdiki zaman'
 ORDER BY NEWID() ; 

 set @kural1 = case when @kip in('görülmüş geçmiş zaman','emir') then 'rivayet' else ' ' end;
 set @kural2 = case when @kip in('dilek şart','emir','gereklilik','istek') then 'şart' else ' ' end;
 set @kural3= case when @kip in('emir') then 'hikaye' else ' ' end;
 
  

SELECT   TOP 1 @zaman_eki=zaman_eki,@zaman=zaman 
FROM tbl_fiil_zaman 
 where zaman not in(@kural1,@kural2,@kural3) 
 --and zaman ='basit zaman'
 ORDER BY NEWID()  ;

 
 
SELECT  TOP 1 @sahis_eki=sahis_eki_v2 ,@sahis=sahis
 FROM tbl_fiil_sahis
where case when @kip in('emir') and  sahis in ('ben','biz') then 1 else 0 end =0
  ORDER BY NEWID()  ;
 
 print '<fiil:'+@fiil +' - kip:'+@kip_eki +'('+@kip  +') - zaman:'+@zaman_eki +'('+@zaman  +') - şahıs:'+@sahis_eki  +'('+@sahis+')>'

declare @SonSesli varchar(1);
declare @SonHarf varchar(1);
declare @DuzGenisSesliHarf varchar(1);
declare @DarSesliHarf varchar(1);
declare @SessizIleBitiyorFlg  bit=0;
declare @SertSessizIleBitiyorFlg  bit=0;

select @SonSesli=c1,@SonHarf=c2,@SessizIleBitiyorFlg=c3,@SertSessizIleBitiyorFlg=c4,@DuzGenisSesliHarf=c5,@DarSesliHarf=c6 from  [fx_fiil_detay](@fiil);
 print '<fiil:'+@fiil +' - kip:'+@kip_eki +'("'+@kip  +'") !'
set @kip_eki = replace(replace(@kip_eki,'DuzGenisSesliHarf',@DuzGenisSesliHarf),'DarSesliHarf',@DarSesliHarf);
 
-- ilk sıçış : <fiil:dön - kip:m,e,l,ü("gereklilik") !

 print @sahis+'<fiil:'+@fiil +' - kip:'+@kip_eki +'("'+@kip  +'") !'

 --sp_fiil_ekler
