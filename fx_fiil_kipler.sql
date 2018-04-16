USE [chatbot]
GO
/****** Object:  UserDefinedFunction [dbo].[fx_fiil_detay]    Script Date: 04/15/2018 14:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter  FUNCTION [dbo].[fx_fiil_kipler]
(
  @fiil varchar(50) ,
  @kip varchar(50) ,
  @SonSesli varchar(1),
	@SonHarf varchar(1),
	@SessizIleBitiyorFlg bit,
	@SertSessizIleBitiyorFlg bit,
	@DuzGenisSesliHarf varchar(1),
	@DarSesliHarf varchar(1)
)
RETURNS 
  @Table_Var  TABLE
( 
	fiil varchar(50) ,
	kip varchar(50) ,
	kip_eki varchar(10) 
) --  with schemabinding
AS
BEGIN
 

declare @kip_eki varchar(10)='';
  
  -- select * from dbo.tbl_fiil_kip
 /*when  @SonSesli  ='e' then 'i' 
 when  @SonSesli  ='a' then 'ı' 
 when  @SonSesli  ='o' then  'u' 
 when  @SonSesli  ='ö' then 'ü'   
 
select * from  [fx_fiil_detay]('oku')
 */
 
set @fiil = case when @kip= 'şimdiki zaman' and @fiil='git' then LEFT(@fiil,len(@fiil)-1)+'d' else @fiil end
 --set @SessizIleBitiyorFlg = case when @kip= 'şimdiki zaman' and @SonHarf='e' then 1 else @SessizIleBitiyorFlg end
 
 
 
 set @kip_eki=case 
 when @kip= 'görülmüş geçmiş zaman' then 'd'+@DarSesliHarf
 when @kip= 'öğrenilmiş geçmiş zaman' then 'm'+@DarSesliHarf+'ş'
 when @kip= 'şimdiki zaman' and @SessizIleBitiyorFlg= 1 then @DarSesliHarf+'yor'
 when @kip= 'şimdiki zaman' and @SessizIleBitiyorFlg= 0 then 'yor'
  when @kip='gelecek zaman' and @SessizIleBitiyorFlg= 1  then @DuzGenisSesliHarf+'c'+@DuzGenisSesliHarf+'k'
  when @kip='gelecek zaman' and @SessizIleBitiyorFlg= 0  then 'y'+@DuzGenisSesliHarf+'c'+@DuzGenisSesliHarf+'k'
  when @kip='geniş zaman' and @SessizIleBitiyorFlg= 1 then @DuzGenisSesliHarf+'r'
  when @kip='geniş zaman' and @SessizIleBitiyorFlg= 0 then 'r'
  when @kip='gereklilik' then 'm'+@DuzGenisSesliHarf+'l'+case
   when @DuzGenisSesliHarf ='a' then 'ı' 
   when @DuzGenisSesliHarf ='e' then 'i' 
   else @DarSesliHarf end
  when @kip='dilek şart' then 's'+@DuzGenisSesliHarf
 when @kip='istek' and @SessizIleBitiyorFlg= 0 then 'y'+@DuzGenisSesliHarf
 when @kip='istek' and @SessizIleBitiyorFlg= 1 then @DuzGenisSesliHarf
end
 
 insert into @Table_Var values (@fiil, @kip,@kip_eki)	
	RETURN  
 end 
