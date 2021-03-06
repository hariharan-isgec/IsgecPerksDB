USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionsAutoCompleteList]
  @ApplicationID Int,
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [SYS_VRSessions].[Description]' 
  SET @LGSQL = @LGSQL + ',[SYS_VRSessions].[VRSessionID]' 
  SET @LGSQL = @LGSQL + ' FROM [SYS_VRSessions] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([SYS_VRSessions].[VRSessionID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([SYS_VRSessions].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [SYS_VRSessions].[ApplicationID] = ''' + STR(@ApplicationID) + '''' 
  
  EXEC (@LGSQL)
  END
GO
