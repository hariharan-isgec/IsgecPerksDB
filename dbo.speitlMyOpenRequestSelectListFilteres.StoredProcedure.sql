USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlMyOpenRequestSelectListFilteres]
  @Filter_SerialNo Int,
  @Filter_ExecutedBy NVarChar(8),
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
 ,RequestNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[EITL_POOpenRequest].[RequestNo]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_POOpenRequest] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POOpenRequest].[ExecutedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_POList] AS [EITL_POList2]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POOpenRequest].[SerialNo] = [EITL_POList2].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers3]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POOpenRequest].[SupplierID] = [EITL_Suppliers3].[SupplierID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [EITL_POOpenRequest].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_ExecutedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [EITL_POOpenRequest].[ExecutedBy] = ''' + @Filter_ExecutedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestNo' THEN '[EITL_POOpenRequest].[RequestNo]'
                        WHEN 'RequestNo DESC' THEN '[EITL_POOpenRequest].[RequestNo] DESC'
                        WHEN 'SerialNo' THEN '[EITL_POOpenRequest].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[EITL_POOpenRequest].[SerialNo] DESC'
                        WHEN 'PORevision' THEN '[EITL_POOpenRequest].[PORevision]'
                        WHEN 'PORevision DESC' THEN '[EITL_POOpenRequest].[PORevision] DESC'
                        WHEN 'SupplierID' THEN '[EITL_POOpenRequest].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[EITL_POOpenRequest].[SupplierID] DESC'
                        WHEN 'Remarks' THEN '[EITL_POOpenRequest].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[EITL_POOpenRequest].[Remarks] DESC'
                        WHEN 'RequestedOn' THEN '[EITL_POOpenRequest].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[EITL_POOpenRequest].[RequestedOn] DESC'
                        WHEN 'ExecutedBy' THEN '[EITL_POOpenRequest].[ExecutedBy]'
                        WHEN 'ExecutedBy DESC' THEN '[EITL_POOpenRequest].[ExecutedBy] DESC'
                        WHEN 'ExecutedOn' THEN '[EITL_POOpenRequest].[ExecutedOn]'
                        WHEN 'ExecutedOn DESC' THEN '[EITL_POOpenRequest].[ExecutedOn] DESC'
                        WHEN 'ExecuterRemarks' THEN '[EITL_POOpenRequest].[ExecuterRemarks]'
                        WHEN 'ExecuterRemarks DESC' THEN '[EITL_POOpenRequest].[ExecuterRemarks] DESC'
                        WHEN 'ExecutedToOpen' THEN '[EITL_POOpenRequest].[ExecutedToOpen]'
                        WHEN 'ExecutedToOpen DESC' THEN '[EITL_POOpenRequest].[ExecutedToOpen] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'EITL_POList2_PONumber' THEN '[EITL_POList2].[PONumber]'
                        WHEN 'EITL_POList2_PONumber DESC' THEN '[EITL_POList2].[PONumber] DESC'
                        WHEN 'EITL_Suppliers3_SupplierName' THEN '[EITL_Suppliers3].[SupplierName]'
                        WHEN 'EITL_Suppliers3_SupplierName DESC' THEN '[EITL_Suppliers3].[SupplierName] DESC'
                        ELSE '[EITL_POOpenRequest].[RequestNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[EITL_POOpenRequest].[RequestNo] ,
		[EITL_POOpenRequest].[SerialNo] ,
		[EITL_POOpenRequest].[PORevision] ,
		[EITL_POOpenRequest].[SupplierID] ,
		[EITL_POOpenRequest].[Remarks] ,
		[EITL_POOpenRequest].[RequestedOn] ,
		[EITL_POOpenRequest].[ExecutedBy] ,
		[EITL_POOpenRequest].[ExecutedOn] ,
		[EITL_POOpenRequest].[ExecuterRemarks] ,
		[EITL_POOpenRequest].[ExecutedToOpen] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[EITL_POList2].[PONumber] AS EITL_POList2_PONumber,
		[EITL_Suppliers3].[SupplierName] AS EITL_Suppliers3_SupplierName 
  FROM [EITL_POOpenRequest] 
    	INNER JOIN #PageIndex
          ON [EITL_POOpenRequest].[RequestNo] = #PageIndex.RequestNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POOpenRequest].[ExecutedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [EITL_POList] AS [EITL_POList2]
    ON [EITL_POOpenRequest].[SerialNo] = [EITL_POList2].[SerialNo]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers3]
    ON [EITL_POOpenRequest].[SupplierID] = [EITL_Suppliers3].[SupplierID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
