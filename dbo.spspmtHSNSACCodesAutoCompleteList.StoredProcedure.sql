USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtHSNSACCodesAutoCompleteList]
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @BillType Int,
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' LEFT([SPMT_HSNSACCodes].[Description],50) As [Dsca]' 
  SET @LGSQL = @LGSQL + ',[SPMT_HSNSACCodes].[HSNSACCode]' 
  SET @LGSQL = @LGSQL + ',[SPMT_HSNSACCodes].[BillType]' 
  SET @LGSQL = @LGSQL + ' FROM [SPMT_HSNSACCodes] ' 
  SET @LGSQL = @LGSQL + ' WHERE [SPMT_HSNSACCodes].[BillType] = '  + str(@BillType,1,0)
  --SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([SPMT_HSNSACCodes].[BillType],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' AND LOWER(ISNULL([SPMT_HSNSACCodes].[HSNSACCode],'''')) LIKE ''' + @Prefix1 + ''''
  --SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
