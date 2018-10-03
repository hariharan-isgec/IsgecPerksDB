USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlIssuedPOSelectListFilteres]
  @Filter_SupplierID NVarChar(9),
  @Filter_ProjectID NVarChar(6),
  @Filter_BuyerID NVarChar(8),
  @Filter_POStatusID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[EITL_POList].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_POList] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POList].[BuyerID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POList].[ClosedBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POList].[IssuedBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_POStatus] AS [EITL_POStatus4]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POList].[POStatusID] = [EITL_POStatus4].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers5]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POList].[SupplierID] = [EITL_Suppliers5].[SupplierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POList].[ProjectID] = [IDM_Projects6].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [EITL_POList].[SupplierID] = ''' + @Filter_SupplierID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [EITL_POList].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_BuyerID > '') 
    SET @LGSQL = @LGSQL + ' AND [EITL_POList].[BuyerID] = ''' + @Filter_BuyerID + ''''
  IF (@Filter_POStatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [EITL_POList].[POStatusID] = ' + STR(@Filter_POStatusID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[EITL_POList].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[EITL_POList].[SerialNo] DESC'
                        WHEN 'PONumber' THEN '[EITL_POList].[PONumber]'
                        WHEN 'PONumber DESC' THEN '[EITL_POList].[PONumber] DESC'
                        WHEN 'PORevision' THEN '[EITL_POList].[PORevision]'
                        WHEN 'PORevision DESC' THEN '[EITL_POList].[PORevision] DESC'
                        WHEN 'PODate' THEN '[EITL_POList].[PODate]'
                        WHEN 'PODate DESC' THEN '[EITL_POList].[PODate] DESC'
                        WHEN 'SupplierID' THEN '[EITL_POList].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[EITL_POList].[SupplierID] DESC'
                        WHEN 'ProjectID' THEN '[EITL_POList].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[EITL_POList].[ProjectID] DESC'
                        WHEN 'DivisionID' THEN '[EITL_POList].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[EITL_POList].[DivisionID] DESC'
                        WHEN 'BuyerID' THEN '[EITL_POList].[BuyerID]'
                        WHEN 'BuyerID DESC' THEN '[EITL_POList].[BuyerID] DESC'
                        WHEN 'POStatusID' THEN '[EITL_POList].[POStatusID]'
                        WHEN 'POStatusID DESC' THEN '[EITL_POList].[POStatusID] DESC'
                        WHEN 'IssuedBy' THEN '[EITL_POList].[IssuedBy]'
                        WHEN 'IssuedBy DESC' THEN '[EITL_POList].[IssuedBy] DESC'
                        WHEN 'IssuedOn' THEN '[EITL_POList].[IssuedOn]'
                        WHEN 'IssuedOn DESC' THEN '[EITL_POList].[IssuedOn] DESC'
                        WHEN 'ClosedBy' THEN '[EITL_POList].[ClosedBy]'
                        WHEN 'ClosedBy DESC' THEN '[EITL_POList].[ClosedBy] DESC'
                        WHEN 'ClosedOn' THEN '[EITL_POList].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[EITL_POList].[ClosedOn] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'EITL_POStatus4_Description' THEN '[EITL_POStatus4].[Description]'
                        WHEN 'EITL_POStatus4_Description DESC' THEN '[EITL_POStatus4].[Description] DESC'
                        WHEN 'EITL_Suppliers5_SupplierName' THEN '[EITL_Suppliers5].[SupplierName]'
                        WHEN 'EITL_Suppliers5_SupplierName DESC' THEN '[EITL_Suppliers5].[SupplierName] DESC'
                        WHEN 'IDM_Projects6_Description' THEN '[IDM_Projects6].[Description]'
                        WHEN 'IDM_Projects6_Description DESC' THEN '[IDM_Projects6].[Description] DESC'
                        ELSE '[EITL_POList].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[EITL_POList].[SerialNo] ,
		[EITL_POList].[PONumber] ,
		[EITL_POList].[PORevision] ,
		[EITL_POList].[PODate] ,
		[EITL_POList].[SupplierID] ,
		[EITL_POList].[ProjectID] ,
		[EITL_POList].[DivisionID] ,
		[EITL_POList].[BuyerID] ,
		[EITL_POList].[POStatusID] ,
		[EITL_POList].[IssuedBy] ,
		[EITL_POList].[IssuedOn] ,
		[EITL_POList].[ClosedBy] ,
		[EITL_POList].[ClosedOn] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[EITL_POStatus4].[Description] AS EITL_POStatus4_Description,
		[EITL_Suppliers5].[SupplierName] AS EITL_Suppliers5_SupplierName,
		[IDM_Projects6].[Description] AS IDM_Projects6_Description 
  FROM [EITL_POList] 
    	INNER JOIN #PageIndex
          ON [EITL_POList].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POList].[BuyerID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [EITL_POList].[ClosedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [EITL_POList].[IssuedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [EITL_POStatus] AS [EITL_POStatus4]
    ON [EITL_POList].[POStatusID] = [EITL_POStatus4].[StatusID]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers5]
    ON [EITL_POList].[SupplierID] = [EITL_Suppliers5].[SupplierID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [EITL_POList].[ProjectID] = [IDM_Projects6].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
