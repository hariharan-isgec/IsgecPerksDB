USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListDSelectListFilteres]
  @Filter_SerialNo Int,
  @Filter_QCLNo Int,
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
 ,BOMNo Int NOT NULL
 ,ItemNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', QCLNo'
  SET @LGSQL = @LGSQL + ', BOMNo'
  SET @LGSQL = @LGSQL + ', ItemNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_QCListD].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_QCListD].[QCLNo]'
  SET @LGSQL = @LGSQL + ', [PAK_QCListD].[BOMNo]'
  SET @LGSQL = @LGSQL + ', [PAK_QCListD].[ItemNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_QCListD] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListD].[ClearedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListD].[SerialNo] = [PAK_PO2].[SerialNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POBItems] AS [PAK_POBItems3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListD].[SerialNo] = [PAK_POBItems3].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_QCListD].[BOMNo] = [PAK_POBItems3].[BOMNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_QCListD].[ItemNo] = [PAK_POBItems3].[ItemNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POBOM] AS [PAK_POBOM4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListD].[SerialNo] = [PAK_POBOM4].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_QCListD].[BOMNo] = [PAK_POBOM4].[BOMNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_QCListH] AS [PAK_QCListH5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListD].[SerialNo] = [PAK_QCListH5].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_QCListD].[QCLNo] = [PAK_QCListH5].[QCLNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListD].[UOMQuantity] = [PAK_Units6].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_QCListD].[UOMWeight] = [PAK_Units7].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_QCListD].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_QCLNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_QCListD].[QCLNo] = ' + STR(@Filter_QCLNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_QCListD].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_QCListD].[SerialNo] DESC'
                        WHEN 'QCLNo' THEN '[PAK_QCListD].[QCLNo]'
                        WHEN 'QCLNo DESC' THEN '[PAK_QCListD].[QCLNo] DESC'
                        WHEN 'BOMNo' THEN '[PAK_QCListD].[BOMNo]'
                        WHEN 'BOMNo DESC' THEN '[PAK_QCListD].[BOMNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_QCListD].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_QCListD].[ItemNo] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_QCListD].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_QCListD].[UOMQuantity] DESC'
                        WHEN 'Quantity' THEN '[PAK_QCListD].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_QCListD].[Quantity] DESC'
                        WHEN 'UOMWeight' THEN '[PAK_QCListD].[UOMWeight]'
                        WHEN 'UOMWeight DESC' THEN '[PAK_QCListD].[UOMWeight] DESC'
                        WHEN 'WeightPerUnit' THEN '[PAK_QCListD].[WeightPerUnit]'
                        WHEN 'WeightPerUnit DESC' THEN '[PAK_QCListD].[WeightPerUnit] DESC'
                        WHEN 'QualityClearedQty' THEN '[PAK_QCListD].[QualityClearedQty]'
                        WHEN 'QualityClearedQty DESC' THEN '[PAK_QCListD].[QualityClearedQty] DESC'
                        WHEN 'Remarks' THEN '[PAK_QCListD].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_QCListD].[Remarks] DESC'
                        WHEN 'ClearedBy' THEN '[PAK_QCListD].[ClearedBy]'
                        WHEN 'ClearedBy DESC' THEN '[PAK_QCListD].[ClearedBy] DESC'
                        WHEN 'ClearedOn' THEN '[PAK_QCListD].[ClearedOn]'
                        WHEN 'ClearedOn DESC' THEN '[PAK_QCListD].[ClearedOn] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'PAK_PO2_PODescription' THEN '[PAK_PO2].[PODescription]'
                        WHEN 'PAK_PO2_PODescription DESC' THEN '[PAK_PO2].[PODescription] DESC'
                        WHEN 'PAK_POBItems3_ItemDescription' THEN '[PAK_POBItems3].[ItemDescription]'
                        WHEN 'PAK_POBItems3_ItemDescription DESC' THEN '[PAK_POBItems3].[ItemDescription] DESC'
                        WHEN 'PAK_POBOM4_ItemDescription' THEN '[PAK_POBOM4].[ItemDescription]'
                        WHEN 'PAK_POBOM4_ItemDescription DESC' THEN '[PAK_POBOM4].[ItemDescription] DESC'
                        WHEN 'PAK_QCListH5_SupplierRef' THEN '[PAK_QCListH5].[SupplierRef]'
                        WHEN 'PAK_QCListH5_SupplierRef DESC' THEN '[PAK_QCListH5].[SupplierRef] DESC'
                        WHEN 'PAK_Units6_Description' THEN '[PAK_Units6].[Description]'
                        WHEN 'PAK_Units6_Description DESC' THEN '[PAK_Units6].[Description] DESC'
                        WHEN 'PAK_Units7_Description' THEN '[PAK_Units7].[Description]'
                        WHEN 'PAK_Units7_Description DESC' THEN '[PAK_Units7].[Description] DESC'
                        ELSE '[PAK_QCListD].[SerialNo],[PAK_QCListD].[QCLNo],[PAK_QCListD].[BOMNo],[PAK_QCListD].[ItemNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_QCListD].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_POBItems3].[ItemDescription] AS PAK_POBItems3_ItemDescription,
    [PAK_POBOM4].[ItemDescription] AS PAK_POBOM4_ItemDescription,
    [PAK_QCListH5].[SupplierRef] AS PAK_QCListH5_SupplierRef,
    [PAK_Units6].[Description] AS PAK_Units6_Description,
    [PAK_Units7].[Description] AS PAK_Units7_Description 
  FROM [PAK_QCListD] 
      INNER JOIN #PageIndex
          ON [PAK_QCListD].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_QCListD].[QCLNo] = #PageIndex.QCLNo
          AND [PAK_QCListD].[BOMNo] = #PageIndex.BOMNo
          AND [PAK_QCListD].[ItemNo] = #PageIndex.ItemNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_QCListD].[ClearedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_QCListD].[SerialNo] = [PAK_PO2].[SerialNo]
  INNER JOIN [PAK_POBItems] AS [PAK_POBItems3]
    ON [PAK_QCListD].[SerialNo] = [PAK_POBItems3].[SerialNo]
    AND [PAK_QCListD].[BOMNo] = [PAK_POBItems3].[BOMNo]
    AND [PAK_QCListD].[ItemNo] = [PAK_POBItems3].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM4]
    ON [PAK_QCListD].[SerialNo] = [PAK_POBOM4].[SerialNo]
    AND [PAK_QCListD].[BOMNo] = [PAK_POBOM4].[BOMNo]
  INNER JOIN [PAK_QCListH] AS [PAK_QCListH5]
    ON [PAK_QCListD].[SerialNo] = [PAK_QCListH5].[SerialNo]
    AND [PAK_QCListD].[QCLNo] = [PAK_QCListH5].[QCLNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_QCListD].[UOMQuantity] = [PAK_Units6].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units7]
    ON [PAK_QCListD].[UOMWeight] = [PAK_Units7].[UnitID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
