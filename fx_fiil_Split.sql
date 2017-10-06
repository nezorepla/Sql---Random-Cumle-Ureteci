 
/****** Object:  UserDefinedFunction [dbo].[fx_fiil_Split]    Script Date: 10/06/2017 17:41:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fx_fiil_Split] (  @stringToSplit VARCHAR(MAX) ,  @POSITION INT )
 returns VARCHAR(20)
AS
BEGIN
      DECLARE @RESULT   VARCHAR(20)='';
 DECLARE @name NVARCHAR(255);
 DECLARE @pos INT;
  DECLARE @posx INT=0;
  declare  @tempList TABLE (pos int,[Name] [nvarchar] (500));

 WHILE CHARINDEX(',', @stringToSplit) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(',', @stringToSplit)  
  SELECT @name = SUBSTRING(@stringToSplit, 1, @pos-1)
set @posx=@posx+1;

  INSERT INTO @tempList 
  SELECT @posx,@name

  SELECT @stringToSplit = SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)
 END
set @posx=@posx+1;
 INSERT INTO @tempList
 SELECT @posx,@stringToSplit;
 
 --insert into @returnList
select @RESULT= [Name] from  @tempList where pos = @POSITION;




 RETURN @RESULT
END

 
GO

