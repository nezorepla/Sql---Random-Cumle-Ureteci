USE [chatbot]
GO
/****** Object:  StoredProcedure [dbo].[sp_fiil_ekler_v2]    Script Date: 04/16/2018 19:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc  [dbo].[sp_fiil_cekim](@sahis varchar(50), @fiil varchar(50) ,@kip  varchar(50), @zaman  varchar(50) ) as
 
declare @sahis_eki varchar(100)='';
declare @zaman_eki varchar(50)='';
declare @kip_eki varchar(100)='';
declare @SonSesli varchar(1);
declare @SonHarf varchar(1);
declare @DuzGenisSesliHarf varchar(1);
declare @DarSesliHarf varchar(1); 
declare @SessizIleBitiyorFlg  bit=0;
declare @SertSessizIleBitiyorFlg  bit=0;


set @fiil =case 
when @kip= 'şimdiki zaman' and right(@fiil,1)  in('a','e') 		then	LEFT(@fiil,len(@fiil)-1) 
when @kip in( 'geniş zaman','şimdiki zaman') and  (@fiil  in('git','et','kaybet') 	or right(@fiil,3)=' et' )	then	LEFT(@fiil,len(@fiil)-1) +'d'
else @fiil end;

		print '---------------@fiil:'+@fiil




  
select @SonSesli= SonSesli,@SonHarf= SonHarf,@SessizIleBitiyorFlg= SessizIleBitiyorFlg,@SertSessizIleBitiyorFlg= SertSessizIleBitiyorFlg,
@DuzGenisSesliHarf= DuzGenisSesliHarf,@DarSesliHarf= DarSesliHarf
 from  [fx_fiil_detay](@fiil  );






 
  select  @kip=kip,@kip_eki=kip_eki 
 from [dbo].[fx_fiil_kipler](  @fiil  ,   @kip ,  @SonSesli ,	@SonHarf  ,	@SessizIleBitiyorFlg ,	@SertSessizIleBitiyorFlg ,	@DuzGenisSesliHarf,	@DarSesliHarf)
 
		print '---------------@kip_eki:'+@kip_eki
 
 
 select @SonSesli= SonSesli,@SonHarf= SonHarf,@SessizIleBitiyorFlg= SessizIleBitiyorFlg,@SertSessizIleBitiyorFlg= SertSessizIleBitiyorFlg,
@DuzGenisSesliHarf= DuzGenisSesliHarf,@DarSesliHarf= DarSesliHarf
 from  [fx_fiil_detay](@fiil+@kip_eki  );

	  select  @zaman= zaman,@zaman_eki= zaman_eki 
 from [dbo].[fx_fiil_zamanlar](   @fiil  ,   @zaman ,@sahis, @kip, @SonSesli ,	@SonHarf  ,	@SessizIleBitiyorFlg ,	@SertSessizIleBitiyorFlg ,	@DuzGenisSesliHarf,	@DarSesliHarf)
 
 
  
		print '---------------@zaman_eki:'+@zaman_eki
 
	
select @SonSesli= SonSesli,@SonHarf= SonHarf,@SessizIleBitiyorFlg= SessizIleBitiyorFlg,@SertSessizIleBitiyorFlg= SertSessizIleBitiyorFlg,
@DuzGenisSesliHarf= DuzGenisSesliHarf,@DarSesliHarf= DarSesliHarf
 from  [fx_fiil_detay](@fiil+@kip_eki+@zaman_eki  );

	print '@kip= '''+ @kip +'' ;
	print '@kip_eki= '''+ @kip_eki+'' ;
	print '@zaman_eki= '''+ @zaman_eki+'' ;
	 print ' @fiil  = '''+@fiil+''
 print '@SonSesli= '''+ @SonSesli+''
print '@SonHarf= ''' +@SonHarf +''
print '@DuzGenisSesliHarf= '''+ @DuzGenisSesliHarf+'' ;
print '@DarSesliHarf= '''+ @DarSesliHarf +'' ;
print '@SessizIleBitiyorFlg= '''+ cast(@SessizIleBitiyorFlg  as varchar(10)) +'';
print '@SertSessizIleBitiyorFlg= '''+ cast(@SertSessizIleBitiyorFlg   as varchar(10))+'' ;

	  select  @sahis= sahis,@sahis_eki=  sahis_eki 
 from [dbo].[fx_fiil_sahislar](   @fiil  ,   @zaman ,@sahis, @kip, @SonSesli ,	@SonHarf  ,	@SessizIleBitiyorFlg ,	@SertSessizIleBitiyorFlg ,	@DuzGenisSesliHarf,	@DarSesliHarf)
 
		print '---------------@sahis_eki:'+@sahis_eki

	
 print @sahis+' '+@fiil +''+@kip_eki  +''+@zaman_eki+''+@sahis_eki

 
  --sp_fiil
--exec sp_fiil_cekim @sahis,@fiil,@kip,@zaman  

