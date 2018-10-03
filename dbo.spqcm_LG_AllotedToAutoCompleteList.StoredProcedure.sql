USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcm_LG_AllotedToAutoCompleteList]
  @ActiveState Bit,
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
  SET @LGSQL = @LGSQL + ' [HRM_Employees].[EmployeeName]' 
  SET @LGSQL = @LGSQL + ',[HRM_Employees].[CardNo]' 
  SET @LGSQL = @LGSQL + ' FROM [HRM_Employees] ' 
  SET @LGSQL = @LGSQL + ' WHERE [HRM_Employees].[CardNo] IN (SELECT QCM_InspectorGroupUsers.CardNo
												FROM         QCM_EmployeeGroupUsers INNER JOIN
																							QCM_InspectorGroupEmployeeGroup ON 
																							QCM_EmployeeGroupUsers.GroupiD = QCM_InspectorGroupEmployeeGroup.EmployeeGroupID INNER JOIN
																							QCM_InspectorGroupUsers ON QCM_InspectorGroupEmployeeGroup.InspectorGroupID = QCM_InspectorGroupUsers.GroupID
												WHERE     (QCM_EmployeeGroupUsers.CardNo = ''' + @LOGINID + ''') )' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([HRM_Employees].[CardNo],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  
  EXEC (@LGSQL)
  END
GO
