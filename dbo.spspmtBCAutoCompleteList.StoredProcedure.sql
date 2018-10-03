USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBCAutoCompleteList]
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [SPMT_BC].[BCID]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users1].[UserFullName]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users1].[LoginID]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users2].[UserFullName]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users2].[LoginID]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users3].[UserFullName]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users3].[LoginID]' 
  SET @LGSQL = @LGSQL + ',[HRM_Employees4].[EmployeeName]' 
  SET @LGSQL = @LGSQL + ',[HRM_Employees4].[CardNo]' 
  SET @LGSQL = @LGSQL + ',[SPMT_Places5].[Description]' 
  SET @LGSQL = @LGSQL + ',[SPMT_Places5].[PlaceID]' 
  SET @LGSQL = @LGSQL + ',[SPMT_Places6].[Description]' 
  SET @LGSQL = @LGSQL + ',[SPMT_Places6].[PlaceID]' 
  SET @LGSQL = @LGSQL + ',[SPMT_Vendors7].[Description]' 
  SET @LGSQL = @LGSQL + ',[SPMT_Vendors7].[VendorID]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users8].[UserFullName]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users8].[LoginID]' 
  SET @LGSQL = @LGSQL + ' FROM [SPMT_BC] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([SPMT_BC].[BCID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users1].[LoginID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users1].[UserFullName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users2].[LoginID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users2].[UserFullName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users3].[LoginID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users3].[UserFullName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([HRM_Employees4].[CardNo],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([HRM_Employees4].[EmployeeName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([SPMT_Places5].[PlaceID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([SPMT_Places5].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([SPMT_Places6].[PlaceID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([SPMT_Places6].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([SPMT_Vendors7].[VendorID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([SPMT_Vendors7].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users8].[LoginID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users8].[UserFullName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
