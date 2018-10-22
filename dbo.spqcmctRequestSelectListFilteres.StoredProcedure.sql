USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmctRequestSelectListFilteres]
  @Filter_QCRequestNo Int,
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
 ,QCRequestNo Int NOT NULL
 ,SerialNo Int NOT NULL
 ,PONumber NVarChar(9) NOT NULL
 ,ItemReference VarChar(200) NOT NULL
 ,ActivityID VarChar(9) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'QCRequestNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ', PONumber'
  SET @LGSQL = @LGSQL + ', ItemReference'
  SET @LGSQL = @LGSQL + ', ActivityID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_CT_Request].[QCRequestNo]'
  SET @LGSQL = @LGSQL + ', [QCM_CT_Request].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [QCM_CT_Request].[PONumber]'
  SET @LGSQL = @LGSQL + ', [QCM_CT_Request].[ItemReference]'
  SET @LGSQL = @LGSQL + ', [QCM_CT_Request].[ActivityID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_CT_Request] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages1]'
  SET @LGSQL = @LGSQL + '    ON [QCM_CT_Request].[InspectionStageiD] = [QCM_InspectionStages1].[InspectionStageID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_QCRequestNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_CT_Request].[QCRequestNo] = ' + STR(@Filter_QCRequestNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'QCRequestNo' THEN '[QCM_CT_Request].[QCRequestNo]'
                        WHEN 'QCRequestNo DESC' THEN '[QCM_CT_Request].[QCRequestNo] DESC'
                        WHEN 'SerialNo' THEN '[QCM_CT_Request].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[QCM_CT_Request].[SerialNo] DESC'
                        WHEN 'PONumber' THEN '[QCM_CT_Request].[PONumber]'
                        WHEN 'PONumber DESC' THEN '[QCM_CT_Request].[PONumber] DESC'
                        WHEN 'ItemReference' THEN '[QCM_CT_Request].[ItemReference]'
                        WHEN 'ItemReference DESC' THEN '[QCM_CT_Request].[ItemReference] DESC'
                        WHEN 'ActivityID' THEN '[QCM_CT_Request].[ActivityID]'
                        WHEN 'ActivityID DESC' THEN '[QCM_CT_Request].[ActivityID] DESC'
                        WHEN 'ItemUnit' THEN '[QCM_CT_Request].[ItemUnit]'
                        WHEN 'ItemUnit DESC' THEN '[QCM_CT_Request].[ItemUnit] DESC'
                        WHEN 'Activity2Desc' THEN '[QCM_CT_Request].[Activity2Desc]'
                        WHEN 'Activity2Desc DESC' THEN '[QCM_CT_Request].[Activity2Desc] DESC'
                        WHEN 'Activity3Desc' THEN '[QCM_CT_Request].[Activity3Desc]'
                        WHEN 'Activity3Desc DESC' THEN '[QCM_CT_Request].[Activity3Desc] DESC'
                        WHEN 'Activity4Desc' THEN '[QCM_CT_Request].[Activity4Desc]'
                        WHEN 'Activity4Desc DESC' THEN '[QCM_CT_Request].[Activity4Desc] DESC'
                        WHEN 'Handle' THEN '[QCM_CT_Request].[Handle]'
                        WHEN 'Handle DESC' THEN '[QCM_CT_Request].[Handle] DESC'
                        WHEN 'ProgressPercent' THEN '[QCM_CT_Request].[ProgressPercent]'
                        WHEN 'ProgressPercent DESC' THEN '[QCM_CT_Request].[ProgressPercent] DESC'
                        WHEN 'Quantity' THEN '[QCM_CT_Request].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[QCM_CT_Request].[Quantity] DESC'
                        WHEN 'PercentOfQuantity' THEN '[QCM_CT_Request].[PercentOfQuantity]'
                        WHEN 'PercentOfQuantity DESC' THEN '[QCM_CT_Request].[PercentOfQuantity] DESC'
                        WHEN 'PartialOrFull' THEN '[QCM_CT_Request].[PartialOrFull]'
                        WHEN 'PartialOrFull DESC' THEN '[QCM_CT_Request].[PartialOrFull] DESC'
                        WHEN 'NotSelectedList' THEN '[QCM_CT_Request].[NotSelectedList]'
                        WHEN 'NotSelectedList DESC' THEN '[QCM_CT_Request].[NotSelectedList] DESC'
                        WHEN 'SelectedList' THEN '[QCM_CT_Request].[SelectedList]'
                        WHEN 'SelectedList DESC' THEN '[QCM_CT_Request].[SelectedList] DESC'
                        WHEN 'Product' THEN '[QCM_CT_Request].[Product]'
                        WHEN 'Product DESC' THEN '[QCM_CT_Request].[Product] DESC'
                        WHEN 'Project' THEN '[QCM_CT_Request].[Project]'
                        WHEN 'Project DESC' THEN '[QCM_CT_Request].[Project] DESC'
                        WHEN 'GridLineStatus' THEN '[QCM_CT_Request].[GridLineStatus]'
                        WHEN 'GridLineStatus DESC' THEN '[QCM_CT_Request].[GridLineStatus] DESC'
                        WHEN 'InspectionStageiD' THEN '[QCM_CT_Request].[InspectionStageiD]'
                        WHEN 'InspectionStageiD DESC' THEN '[QCM_CT_Request].[InspectionStageiD] DESC'
                        WHEN 'IrefWeight' THEN '[QCM_CT_Request].[IrefWeight]'
                        WHEN 'IrefWeight DESC' THEN '[QCM_CT_Request].[IrefWeight] DESC'
                        WHEN 'ProgressWeight' THEN '[QCM_CT_Request].[ProgressWeight]'
                        WHEN 'ProgressWeight DESC' THEN '[QCM_CT_Request].[ProgressWeight] DESC'
                        WHEN 'QCM_InspectionStages1_Description' THEN '[QCM_InspectionStages1].[Description]'
                        WHEN 'QCM_InspectionStages1_Description DESC' THEN '[QCM_InspectionStages1].[Description] DESC'
                        ELSE '[QCM_CT_Request].[QCRequestNo],[QCM_CT_Request].[SerialNo],[QCM_CT_Request].[PONumber],[QCM_CT_Request].[ItemReference],[QCM_CT_Request].[ActivityID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [QCM_CT_Request].* ,
    [QCM_InspectionStages1].[Description] AS QCM_InspectionStages1_Description 
  FROM [QCM_CT_Request] 
      INNER JOIN #PageIndex
          ON [QCM_CT_Request].[QCRequestNo] = #PageIndex.QCRequestNo
          AND [QCM_CT_Request].[SerialNo] = #PageIndex.SerialNo
          AND [QCM_CT_Request].[PONumber] = #PageIndex.PONumber
          AND [QCM_CT_Request].[ItemReference] = #PageIndex.ItemReference
          AND [QCM_CT_Request].[ActivityID] = #PageIndex.ActivityID
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages1]
    ON [QCM_CT_Request].[InspectionStageiD] = [QCM_InspectionStages1].[InspectionStageID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
