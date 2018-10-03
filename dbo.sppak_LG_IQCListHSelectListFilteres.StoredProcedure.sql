USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sppak_LG_IQCListHSelectListFilteres]
  @Filter_SerialNo Int,
  @Filter_QCLNo Int,
  @Filter_StatusID Int,
  @Filter_ClearedBy NVarChar(8),
  @Filter_CreatedBy NVarChar(8),
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
 ,QCLNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', QCLNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_QCListH].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_QCListH].[QCLNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_QCListH] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListH].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListH].[SerialNo] = [PAK_PO2].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_QCListStatus] AS [PAK_QCListStatus3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListH].[StatusID] = [PAK_QCListStatus3].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListH].[UOMTotalWeight] = [PAK_Units4].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListH].[ClearedBy] = [aspnet_users5].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE [PAK_QCListH].[StatusID] IN (3,4,5)'
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_QCListH].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_QCLNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_QCListH].[QCLNo] = ' + STR(@Filter_QCLNo)
  IF (@Filter_StatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_QCListH].[StatusID] = ' + STR(@Filter_StatusID)
  IF (@Filter_ClearedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_QCListH].[ClearedBy] = ''' + @Filter_ClearedBy + ''''
  IF (@Filter_CreatedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_QCListH].[CreatedBy] = ''' + @Filter_CreatedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_QCListH].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_QCListH].[SerialNo] DESC'
                        WHEN 'QCLNo' THEN '[PAK_QCListH].[QCLNo]'
                        WHEN 'QCLNo DESC' THEN '[PAK_QCListH].[QCLNo] DESC'
                        WHEN 'SupplierRef' THEN '[PAK_QCListH].[SupplierRef]'
                        WHEN 'SupplierRef DESC' THEN '[PAK_QCListH].[SupplierRef] DESC'
                        WHEN 'Remarks' THEN '[PAK_QCListH].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_QCListH].[Remarks] DESC'
                        WHEN 'StatusID' THEN '[PAK_QCListH].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PAK_QCListH].[StatusID] DESC'
                        WHEN 'ClearedBy' THEN '[PAK_QCListH].[ClearedBy]'
                        WHEN 'ClearedBy DESC' THEN '[PAK_QCListH].[ClearedBy] DESC'
                        WHEN 'ClearedOn' THEN '[PAK_QCListH].[ClearedOn]'
                        WHEN 'ClearedOn DESC' THEN '[PAK_QCListH].[ClearedOn] DESC'
                        WHEN 'CreatedBy' THEN '[PAK_QCListH].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[PAK_QCListH].[CreatedBy] DESC'
                        WHEN 'TotalWeight' THEN '[PAK_QCListH].[TotalWeight]'
                        WHEN 'TotalWeight DESC' THEN '[PAK_QCListH].[TotalWeight] DESC'
                        WHEN 'UOMTotalWeight' THEN '[PAK_QCListH].[UOMTotalWeight]'
                        WHEN 'UOMTotalWeight DESC' THEN '[PAK_QCListH].[UOMTotalWeight] DESC'
                        WHEN 'CreatedOn' THEN '[PAK_QCListH].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[PAK_QCListH].[CreatedOn] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'PAK_PO2_PODescription' THEN '[PAK_PO2].[PODescription]'
                        WHEN 'PAK_PO2_PODescription DESC' THEN '[PAK_PO2].[PODescription] DESC'
                        WHEN 'PAK_QCListStatus3_Description' THEN '[PAK_QCListStatus3].[Description]'
                        WHEN 'PAK_QCListStatus3_Description DESC' THEN '[PAK_QCListStatus3].[Description] DESC'
                        WHEN 'PAK_Units4_Description' THEN '[PAK_Units4].[Description]'
                        WHEN 'PAK_Units4_Description DESC' THEN '[PAK_Units4].[Description] DESC'
                        WHEN 'aspnet_Users5_UserFullName' THEN '[aspnet_Users5].[UserFullName]'
                        WHEN 'aspnet_Users5_UserFullName DESC' THEN '[aspnet_Users5].[UserFullName] DESC'
                        ELSE '[PAK_QCListH].[SerialNo],[PAK_QCListH].[QCLNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_QCListH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_QCListStatus3].[Description] AS PAK_QCListStatus3_Description,
    [PAK_Units4].[Description] AS PAK_Units4_Description,
    [aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName 
  FROM [PAK_QCListH] 
      INNER JOIN #PageIndex
          ON [PAK_QCListH].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_QCListH].[QCLNo] = #PageIndex.QCLNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_QCListH].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_QCListH].[SerialNo] = [PAK_PO2].[SerialNo]
  LEFT OUTER JOIN [PAK_QCListStatus] AS [PAK_QCListStatus3]
    ON [PAK_QCListH].[StatusID] = [PAK_QCListStatus3].[StatusID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units4]
    ON [PAK_QCListH].[UOMTotalWeight] = [PAK_Units4].[UnitID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]
    ON [PAK_QCListH].[ClearedBy] = [aspnet_users5].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
