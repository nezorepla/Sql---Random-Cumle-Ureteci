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
FROM tbl_fiil  -- where fiil ='kur'
-- where  left(right(fiil,2),1) in ('o','ü') 
 ORDER BY NEWID()  ;
  
SELECT    TOP 1 @kip_eki=kip_eki_v2,@kip=kip
 FROM tbl_fiil_kip  
 -- where kip_eki_v2 like '%DarSesliHarf%'
where  kip  ='istek'
-- where  kip  ='görülmüş geçmiş zaman'
  ORDER BY NEWID() ; 

 set @kural1 = case when @kip in('görülmüş geçmiş zaman','emir') then 'rivayet' else ' ' end;
 set @kural2 = case when @kip in('dilek şart','emir','gereklilik','istek') then 'şart' else ' ' end;
 set @kural3= case when @kip in('emir') then 'hikaye' else ' ' end;
 
  

SELECT   TOP 1 @zaman_eki=zaman_eki,@zaman=zaman 
FROM tbl_fiil_zaman 
 where zaman not in(@kural1,@kural2,@kural3) 
 ORDER BY NEWID()  ;

 
 
SELECT  TOP 1 @sahis_eki=sahis_eki_v2 ,@sahis=sahis
 FROM tbl_fiil_sahis
where case when @kip in('emir') and  sahis in ('ben','biz') then 1 else 0 end =0
  ORDER BY NEWID()  ;
 
 print '<fiil:'+@fiil +' - kip:'+@kip_eki +'('+@kip  /*+') - zaman:'+@zaman_eki +'('+@zaman */ +') - şahıs:'+@sahis_eki  +'('+@sahis+')>'

declare @SonSesli varchar(1);
declare @SonHarf varchar(1);
declare @DuzGenisSesliHarf varchar(1);
declare @DarSesliHarf varchar(1);
declare @SessizIleBitiyorFlg  bit=0;
declare @SertSessizIleBitiyorFlg  bit=0;

select @SonSesli= SonSesli,@SonHarf= SonHarf,@SessizIleBitiyorFlg= SessizIleBitiyorFlg,
@SertSessizIleBitiyorFlg= SertSessizIleBitiyorFlg,@DuzGenisSesliHarf= DuzGenisSesliHarf,@DarSesliHarf= DarSesliHarf
from  [fx_fiil_detay](@fiil);
 
--select * from  [fx_fiil_detay]('bilin')
 
-- sp_fiil_ekler
 

--düşme kuralı
select @kip_eki = case 
when @SessizIleBitiyorFlg=0 and dbo.fx_fiil_Split(@kip_eki,1  ) in('DarSesliHarf','DuzGenisSesliHarf') then
dbo.fx_fiil_ilkHarfDusmesi(@kip_eki)
 else @kip_eki end;
 
 /*
set @kip_eki = case when  left(right(@fiil,2),1) in ('o','ü') then replace(@kip_eki,'DarSesliHarf','DarGenisSesliHarf')
else @kip_eki
end
*/
 

set @kip_eki = replace(replace(@kip_eki,'DuzGenisSesliHarf',@DuzGenisSesliHarf),'DarSesliHarf',@DarSesliHarf);
set @kip_eki = case when @SertSessizIleBitiyorFlg =1 then replace(@kip_eki,'Benzesme(d)','t') else replace(@kip_eki,'Benzesme(d)','d') end;
set @kip_eki = case when @SessizIleBitiyorFlg =0 and  dbo.fx_fiil_Split(@kip_eki,2)  in ('i','e','ı','i','a','u','ü','o','ö')  then replace(@kip_eki,'KaynastirmaHarfi(y)','y') else replace(@kip_eki,'KaynastirmaHarfi(y)','') end;

 
set @kip_eki = case when @kip ='gereklilik' and RIGHT(@kip_eki,1) = 'u' then replace(@kip_eki,'l,u','l,ı')
					when @kip ='gereklilik' and RIGHT(@kip_eki,1) = 'ü' then replace(@kip_eki,'l,ü','l,i')
  else @kip_eki end
print @kip_eki;

set @kip_eki = replace(@kip_eki,',','');
 
 
 
 
 -- gereklilik

--print '@DarSesliHarf;'+@DarSesliHarf;
--print '@@DuzGenisSesliHarf;'+@DuzGenisSesliHarf;

set @zaman_eki = replace(replace(@zaman_eki,'DuzGenisSesliHarf',@DuzGenisSesliHarf),'DarSesliHarf',@DarSesliHarf);


set @sahis_eki = replace(replace(@sahis_eki,'DuzGenisSesliHarf',@DuzGenisSesliHarf),'DarSesliHarf',@DarSesliHarf);
set @sahis_eki = replace(@sahis_eki,',','');

 


 print @sahis+' '+@fiil +'|'+@kip_eki +'|'+@sahis_eki

 --sp_fiil_ekler

/*
biz unut|malu|KaynastirmaHarfi(y) uz
sen çık|ır|sın
ben büyü|miş|UnluTuremesim


doğru örnekler
siz gül|meli|siniz

*/
