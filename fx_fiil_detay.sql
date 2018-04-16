USE [chatbot]
GO
/****** Object:  UserDefinedFunction [dbo].[fx_fiil_detay]    Script Date: 04/15/2018 15:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  FUNCTION [dbo].[fx_fiil_detay]
(
  @gelen varchar(50) 
)
RETURNS 
  @Table_Var  TABLE
(
	gelen varchar(50) ,
	SonSesli varchar(1),
	SonHarf varchar(1),
	SessizIleBitiyorFlg bit,
	SertSessizIleBitiyorFlg bit,
	DuzGenisSesliHarf varchar(1),
	DarSesliHarf varchar(1)
	 
)   with schemabinding
AS
BEGIN
 

 declare @SonSesli varchar(1)=null;
declare @SonHarf varchar(1)=null;
declare @DuzGenisSesliHarf varchar(1)=null;

declare @DarSesliHarf varchar(1)=null;
declare @SessizIleBitiyorFlg  bit=0;
declare @SertSessizIleBitiyorFlg  bit=0;

set @SonSesli =  case when RIGHT(@gelen,1) in ('i','e','ı','i','a','u','ü','o','ö') then RIGHT(@gelen,1) else @SonSesli end;
set @SonSesli =  case when @SonSesli is null and LEFT(RIGHT(@gelen,2),1)  in ('i','e','ı','i','a','u','ü','o','ö') then LEFT(RIGHT(@gelen,2),1)  else @SonSesli end;
set @SonSesli =  case when @SonSesli is null and LEFT(RIGHT(@gelen,3),1)  in ('i','e','ı','i','a','u','ü','o','ö') then LEFT(RIGHT(@gelen,3),1)  else @SonSesli end;
set @SonSesli =  case when @SonSesli is null and LEFT(RIGHT(@gelen,4),1)  in ('i','e','ı','i','a','u','ü','o','ö') then LEFT(RIGHT(@gelen,4),1)  else @SonSesli end;

set @SonHarf =RIGHT(@gelen,1) ;

set @SessizIleBitiyorFlg= case when @SonHarf in ('i','e','ı','i','a','u','ü','o','ö') then 0 else 1 end ;
set @SertSessizIleBitiyorFlg= case when @SonHarf in ('f','s','t','k','ç','ş','h','p') then 1 else 0 end ;
 
 set @DuzGenisSesliHarf = case when @SonSesli in ('a','ı','o','u') then 'a' else 'e' end;

 set @DarSesliHarf= case
 when  @SonSesli  ='e' then 'i' 
 when  @SonSesli  ='a' then 'ı' 
 when  @SonSesli  ='o' then  'u' 
 when  @SonSesli  ='ö' then 'ü'   
--when @SonSesli  = 'ü' then 'i' 
--when @SonSesli  = 'u' then 'ı' 
 --when @SonSesli  = 'i' then '' 
 -- when  'u' then 'x' 
 else @SonSesli
  end;

 insert into @Table_Var values (@gelen,@SonSesli,@SonHarf,@SessizIleBitiyorFlg,@SertSessizIleBitiyorFlg,@DuzGenisSesliHarf,@DarSesliHarf)	
	RETURN  
END
