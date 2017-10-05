 

/****** Object:  UserDefinedFunction [dbo].[fx_fiil_Split]    Script Date: 10/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fx_fiil_Split](@str      VARCHAR(5000),
                                         @POSITION INT,@delimiter varchar(1)=null)
returns VARCHAR(20)
AS
  BEGIN
 
  
  
      DECLARE @TEMP   VARCHAR(2),
      @DELM   VARCHAR(1),
              @CNTR   INT =1,
              @RESULT VARCHAR(5000),
              @INTR   INT =0,
              @LEN    INT
              
              set @DELM= CAse when @delimiter IS not null then @delimiter else ',' end ;

      SET @LEN =Len(@str)
      WHILE @CNTR <= @LEN
        BEGIN
            SET @TEMP = Substring(@STR, @CNTR, 1)
            IF @TEMP = @DELM
              BEGIN
                  SET @INTR += 1
                  IF @INTR = @POSITION
                    BEGIN
                        SET @RESULT = Substring(@STR, @CNTR + 1, CASE
                                                                   WHEN Charindex(@DELM, @STR, @CNTR + 1) - @CNTR < 1 THEN Len(@str)
                                                                   ELSE Charindex(@DELM, @STR, @CNTR + 1) - @CNTR
                                                                 END - 1)

                        BREAK
                    END
              END
            SET @CNTR+=1
        END
      RETURN @RESULT
  END
GO

