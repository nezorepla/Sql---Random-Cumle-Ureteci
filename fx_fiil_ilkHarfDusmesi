 

/****** Object:  UserDefinedFunction [dbo].[fx_fiil_ilkHarfDusmesi]    Script Date: 10/06/2017 17:40:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fx_fiil_ilkHarfDusmesi] (  @ek VARCHAR(50)  )
 returns VARCHAR(20)
AS
BEGIN
   
 DECLARE @cnt INT = 1;
 DECLARE @cnt2 INT = 0;
   DECLARE  @ek2 VARCHAR(50)=''; 
   
select @cnt2= len(@ek) - len(replace(@ek, ',', '')) -1



WHILE @cnt < @cnt2+2
BEGIN
 
 set  @ek2 =  @ek2+','+ dbo.fx_fiil_Split( @ek,@cnt+1)
 
   SET @cnt = @cnt + 1;
END;


 RETURN  @ek2
END

  
GO

 
