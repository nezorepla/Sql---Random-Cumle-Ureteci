use chatbot 
go
alter proc  [dbo].[sp_fiil_ekler_v3] as

declare @fiil varchar(50)='';
declare @mastar varchar(50)='';
declare @kip_eki varchar(100)='';
declare @kip  varchar(50)='şimdiki zaman'--'random';
declare @zaman_eki varchar(50)='';
declare @zaman varchar(50)='';
declare @sahis_eki varchar(100)='';
declare @sahis varchar(50)='';
declare @kural1 varchar(150)='';
declare @kural2 varchar(150)='';
declare @kural3 varchar(150)='';
 
 
SELECT  TOP 1 @fiil=fiil ,@mastar=mastar
FROM tbl_fiil  
 where 1=1
-- and fiil like '%o%'
and  right(fiil,2 ) ='et'
and  left(right(fiil,1),1) ='t'-- in ('ç','f','t','h','s','k','p','ş') 
 --and  left(right(fiil,1),1) not in ('i','e','ı','i','a','u','ü','o','ö') 
 ORDER BY NEWID()  ;
    
   

declare @SonSesli varchar(1);
declare @SonHarf varchar(1);
declare @DuzGenisSesliHarf varchar(1);
declare @DarSesliHarf varchar(1); 
declare @SessizIleBitiyorFlg  bit=0;
declare @SertSessizIleBitiyorFlg  bit=0;
  
select @SonSesli= SonSesli,@SonHarf= SonHarf,@SessizIleBitiyorFlg= SessizIleBitiyorFlg,@SertSessizIleBitiyorFlg= SertSessizIleBitiyorFlg,
@DuzGenisSesliHarf= DuzGenisSesliHarf,@DarSesliHarf= DarSesliHarf
 from  [fx_fiil_detay](@fiil  );


 print ' @fiil  = '''+@fiil+''
print ' @mastar  = '''+@mastar+''
print '@SonSesli= '''+ @SonSesli+''
print '@SonHarf= ''' +@SonHarf +''
print '@DuzGenisSesliHarf= '''+ @DuzGenisSesliHarf+'' ;
print '@DarSesliHarf= '''+ @DarSesliHarf +'' ;
print '@SessizIleBitiyorFlg= '''+ cast(@SessizIleBitiyorFlg  as varchar(10)) +'';
print '@SertSessizIleBitiyorFlg= '''+ cast(@SertSessizIleBitiyorFlg   as varchar(10))+'' ;
 
 if @kip='random'   
begin 
SELECT    TOP 1  @kip=kip
 FROM  CHATBOT.DBO.tbl_fiil_kip  
   ORDER BY NEWID() ;-- Invalid use of a side-effecting operator 'newid' within a function.
end 
else
begin 
SELECT    TOP 1 @kip=kip
 FROM CHATBOT.DBO.tbl_fiil_kip  
 where kip =@kip
 ORDER BY NEWID() ; -- Invalid use of a side-effecting operator 'newid' within a function.
  end

 select  @fiil=fiil,@kip=kip,@kip_eki=kip_eki 
 from [dbo].[fx_fiil_kipler](  @fiil  ,   @kip ,  @SonSesli ,	@SonHarf  ,	@SessizIleBitiyorFlg ,	@SertSessizIleBitiyorFlg ,	@DuzGenisSesliHarf,	@DarSesliHarf)
	
if @kip= 'şimdiki zaman' and @SonHarf in('a','e') 	
	begin
	set @fiil =LEFT(@fiil,len(@fiil)-1)
	
	select @SonSesli= SonSesli,@SonHarf= SonHarf,@SessizIleBitiyorFlg= SessizIleBitiyorFlg,@SertSessizIleBitiyorFlg= SertSessizIleBitiyorFlg,
@DuzGenisSesliHarf= DuzGenisSesliHarf,@DarSesliHarf= DarSesliHarf
 from  [fx_fiil_detay](@fiil  );

  select @fiil=fiil,@kip=kip,@kip_eki=kip_eki 
 from [dbo].[fx_fiil_kipler](  @fiil  ,   @kip ,  @SonSesli ,	@SonHarf  ,	@SessizIleBitiyorFlg ,	@SertSessizIleBitiyorFlg ,	@DuzGenisSesliHarf,	@DarSesliHarf)
end 

	
	
	print '@kip= '''+ @kip +'' ;
	print '@kip_eki= '''+ @kip_eki+'' ;
	
	
 print @sahis+' '+@fiil +'|'+@kip_eki  +'|'+@zaman_eki+'|'+@sahis_eki
