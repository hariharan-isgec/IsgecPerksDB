USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBPGSTINAutoCompleteList]
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @BPID NVarChar(9),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [VR_BPGSTIN].[Description]' 
  SET @LGSQL = @LGSQL + ',[VR_BPGSTIN].[BPID]' 
  SET @LGSQL = @LGSQL + ',[VR_BPGSTIN].[GSTIN]' 
  SET @LGSQL = @LGSQL + ' FROM [VR_BPGSTIN] ' 
  SET @LGSQL = @LGSQL + ' WHERE [VR_BPGSTIN].[BPID] = ''' + @BPID + '''' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([VR_BPGSTIN].[BPID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([VR_BPGSTIN].[GSTIN],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([VR_BPGSTIN].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
