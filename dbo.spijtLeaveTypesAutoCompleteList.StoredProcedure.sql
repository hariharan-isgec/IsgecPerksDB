USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtLeaveTypesAutoCompleteList]
  @Applyiable Bit,
  @ForSite Bit,
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [ATN_LeaveTypes].[Description]' 
  SET @LGSQL = @LGSQL + ',[ATN_LeaveTypes].[LeaveTypeID]' 
  SET @LGSQL = @LGSQL + ' FROM [ATN_LeaveTypes] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([ATN_LeaveTypes].[LeaveTypeID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([ATN_LeaveTypes].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [ATN_LeaveTypes].[Applyiable] = ''' + STR(@Applyiable) + '''' 
  SET @LGSQL = @LGSQL + ' AND [ATN_LeaveTypes].[ForSite] = ''' + STR(@ForSite) + '''' 
  
  EXEC (@LGSQL)
  END
GO
