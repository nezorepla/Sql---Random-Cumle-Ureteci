USE [chatbot]
GO
/****** Object:  UserDefinedFunction [dbo].[fx_fiil_kipler]    Script Date: 04/16/2018 20:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter  FUNCTION [dbo].[fx_fiil_zamanlar]
(
  @fiil varchar(50) ,
  @zaman varchar(50) ,
  @sahis varchar(50) ,
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
--	fiil varchar(50) ,
	zaman varchar(50) ,
	zaman_eki varchar(10) 
) --  with schemabinding
AS
BEGIN
 

declare @zaman_eki varchar(10)='';
  
  -- select * from dbo.tbl_fiil_zaman  
  
  -- select * from dbo.tbl_fiil_kip
  
  
 /*when  @SonSesli  ='e' then 'i' 
 when  @SonSesli  ='a' then 'ı' 
 when  @SonSesli  ='o' then  'u' 
 when  @SonSesli  ='ö' then 'ü'   
 
select * from  [fx_fiil_detay]('biz gezdi')
 */
 
  
 
 
 set @zaman_eki=case 
 when @zaman= 'basit zaman' then ''
 when @zaman= 'hikaye' and @kip in('görülmüş geçmiş zaman','') then 'yd'+@DarSesliHarf
 when @zaman= 'hikaye' and @kip in('istek','dilek şart','gereklilik') then 'yd'+@DarSesliHarf
 when @zaman= 'hikaye' and @kip in('şimdiki zaman','geniş zaman') then 'd'+@DarSesliHarf
 when @zaman= 'hikaye' and @kip in('öğrenilmiş geçmiş zaman','gelecek zaman','') then 't'+@DarSesliHarf
 when @zaman= 'rivayet' and  @SessizIleBitiyorFlg=1 then 'm'+@DarSesliHarf+'ş'
 when @zaman= 'rivayet' and  @SessizIleBitiyorFlg=0 then 'ym'+@DarSesliHarf+'ş'
 when @zaman= 'şart'  and  @SessizIleBitiyorFlg=0    then 'ys' +@DuzGenisSesliHarf
 when @zaman= 'şart'  and  @SessizIleBitiyorFlg=1  then 's' +@DuzGenisSesliHarf
  else ''
end
/* 







  
  */
 
 insert into @Table_Var values (@zaman,@zaman_eki)	
	RETURN  
 end 