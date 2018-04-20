USE [chatbot]
GO
/****** Object:  UserDefinedFunction [dbo].[fx_fiil_kipler]    Script Date: 04/16/2018 20:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter  FUNCTION [dbo].[fx_fiil_sahislar]
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
	sahis  varchar(50) ,
	sahis_eki varchar(10) 
) --  with schemabinding
AS
BEGIN
 --a e ý i o ö u ü sesli b, c, ç, d, f, g, ð, h, j, k, I, m, n, p, r, s, þ, t, v, y, z ise sesizdir.


declare @sahis_eki varchar(10)='';
 set @sahis_eki=case 
 when @sahis= 'ben'  and @kip in('istek','gereklilik')  and  @SessizIleBitiyorFlg=0  then 'y'+ @DarSesliHarf+'m'
 --when @sahis= 'ben'  and @kip in('istek','gereklilik')  and  @SessizIleBitiyorFlg=1  then   @DarSesliHarf+'m'
 when @sahis= 'ben' and  @SessizIleBitiyorFlg=1 then @DarSesliHarf+'m'
 when @sahis= 'ben'  and @kip not in('istek','gereklilik')  and  @SessizIleBitiyorFlg=0  then 'm'
 when @sahis= 'sen' and @zaman  in ('þart','basit zaman','rivayet' ) and   @SessizIleBitiyorFlg=1 then 's'+@DarSesliHarf+'n'
 when @sahis= 'sen' and @zaman  in ('þart','basit zaman','rivayet' )and  @SessizIleBitiyorFlg=0 then 'n'
 when @sahis= 'sen' and @zaman  in ('hikaye' )and  @kip not in('görülmüþ geçmiþ zaman','dilek þart') and   @SessizIleBitiyorFlg=1 then 's'+@DarSesliHarf+'n'
 when @sahis= 'sen' and @zaman  in ('hikaye' )and  @kip in('görülmüþ geçmiþ zaman','dilek þart') and @SessizIleBitiyorFlg=0 then 'yd'+@DarSesliHarf+'n'
 when @sahis= 'o' and  @kip='emir' then 's'+@DarSesliHarf+'n'
 when @sahis= 'biz' and @zaman in('þart','hikaye' ) then 'k'
 when @sahis= 'biz' and @zaman not in ('þart','hikaye'  ) and  @SessizIleBitiyorFlg=0 then @DarSesliHarf+'z'
 when @sahis= 'biz' and @zaman not in ('þart' ,'hikaye' ) and  @SessizIleBitiyorFlg=1 then 'z'
 when @sahis= 'biz' and @zaman  in ('basit zaman' ) and @kip in('görülmüþ geçmiþ zaman','dilek þart')   then 'k'
 when @sahis= 'biz' and @zaman  in ('basit zaman' ) and @kip in('istek')   then 'l'+ @DarSesliHarf+'m'
 
 when @sahis= 'siz' and  @kip<>'emir' and   @SessizIleBitiyorFlg=0   then 'n'+ @DarSesliHarf+'z'
 when @sahis= 'siz' and  @kip<>'emir' and   @SessizIleBitiyorFlg= 1   then 's'+ @DarSesliHarf+'n'+ @DarSesliHarf+'z'
 when @sahis= 'siz' and  @kip<>'emir' and   @SessizIleBitiyorFlg= 0   and @zaman in('þart','hikaye' ) then 'n'+ @DarSesliHarf+'z'
 when @sahis= 'siz' and @zaman  in ('basit zaman' ) and  @kip='emir' and   @SessizIleBitiyorFlg= 0   then 'y'+ @DarSesliHarf+'n'+ @DarSesliHarf+'z'
 when @sahis= 'siz' and @zaman  in ('basit zaman' ) and  @kip='emir' and   @SessizIleBitiyorFlg= 1   then @DarSesliHarf+ 'n'+ @DarSesliHarf+'z'
 when @sahis= 'onlar' then 'l'+ @DuzGenisSesliHarf+'r'
   else ''
end
/* 



SELECT * FROM dbo.tbl_fiil_sahis


  
  */
 
 insert into @Table_Var values (@sahis,@sahis_eki)	
	RETURN  
 end 