USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmctRequestSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,QCRequestNo Int NOT NULL
 ,SerialNo Int NOT NULL
 ,PONumber NVarChar(9) NOT NULL
 ,ItemReference VarChar(200) NOT NULL
 ,ActivityID VarChar(9) NOT NULL
  )
  INSERT INTO #PageIndex (QCRequestNo, SerialNo, PONumber, ItemReference, ActivityID)
  SELECT [QCM_CT_Request].[QCRequestNo], [QCM_CT_Request].[SerialNo], [QCM_CT_Request].[PONumber], [QCM_CT_Request].[ItemReference], [QCM_CT_Request].[ActivityID] FROM [QCM_CT_Request]
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages1]
    ON [QCM_CT_Request].[InspectionStageiD] = [QCM_InspectionStages1].[InspectionStageID]
 WHERE  
   ( 
         STR(ISNULL([QCM_CT_Request].[QCRequestNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_CT_Request].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[PONumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[ItemReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[ActivityID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[ItemUnit],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[Activity2Desc],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[Activity3Desc],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[Activity4Desc],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[Handle],'')) LIKE @KeyWord1
     OR STR(ISNULL([QCM_CT_Request].[ProgressPercent], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_CT_Request].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_CT_Request].[PercentOfQuantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[PartialOrFull],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[NotSelectedList],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[SelectedList],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[Product],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_CT_Request].[Project],'')) LIKE @KeyWord1
     OR STR(ISNULL([QCM_CT_Request].[GridLineStatus], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_CT_Request].[InspectionStageiD], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_CT_Request].[IrefWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_CT_Request].[ProgressWeight], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'QCRequestNo' THEN [QCM_CT_Request].[QCRequestNo] END,
     CASE @OrderBy WHEN 'QCRequestNo DESC' THEN [QCM_CT_Request].[QCRequestNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [QCM_CT_Request].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [QCM_CT_Request].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PONumber' THEN [QCM_CT_Request].[PONumber] END,
     CASE @OrderBy WHEN 'PONumber DESC' THEN [QCM_CT_Request].[PONumber] END DESC,
     CASE @OrderBy WHEN 'ItemReference' THEN [QCM_CT_Request].[ItemReference] END,
     CASE @OrderBy WHEN 'ItemReference DESC' THEN [QCM_CT_Request].[ItemReference] END DESC,
     CASE @OrderBy WHEN 'ActivityID' THEN [QCM_CT_Request].[ActivityID] END,
     CASE @OrderBy WHEN 'ActivityID DESC' THEN [QCM_CT_Request].[ActivityID] END DESC,
     CASE @OrderBy WHEN 'ItemUnit' THEN [QCM_CT_Request].[ItemUnit] END,
     CASE @OrderBy WHEN 'ItemUnit DESC' THEN [QCM_CT_Request].[ItemUnit] END DESC,
     CASE @OrderBy WHEN 'Activity2Desc' THEN [QCM_CT_Request].[Activity2Desc] END,
     CASE @OrderBy WHEN 'Activity2Desc DESC' THEN [QCM_CT_Request].[Activity2Desc] END DESC,
     CASE @OrderBy WHEN 'Activity3Desc' THEN [QCM_CT_Request].[Activity3Desc] END,
     CASE @OrderBy WHEN 'Activity3Desc DESC' THEN [QCM_CT_Request].[Activity3Desc] END DESC,
     CASE @OrderBy WHEN 'Activity4Desc' THEN [QCM_CT_Request].[Activity4Desc] END,
     CASE @OrderBy WHEN 'Activity4Desc DESC' THEN [QCM_CT_Request].[Activity4Desc] END DESC,
     CASE @OrderBy WHEN 'Handle' THEN [QCM_CT_Request].[Handle] END,
     CASE @OrderBy WHEN 'Handle DESC' THEN [QCM_CT_Request].[Handle] END DESC,
     CASE @OrderBy WHEN 'ProgressPercent' THEN [QCM_CT_Request].[ProgressPercent] END,
     CASE @OrderBy WHEN 'ProgressPercent DESC' THEN [QCM_CT_Request].[ProgressPercent] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [QCM_CT_Request].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [QCM_CT_Request].[Quantity] END DESC,
     CASE @OrderBy WHEN 'PercentOfQuantity' THEN [QCM_CT_Request].[PercentOfQuantity] END,
     CASE @OrderBy WHEN 'PercentOfQuantity DESC' THEN [QCM_CT_Request].[PercentOfQuantity] END DESC,
     CASE @OrderBy WHEN 'PartialOrFull' THEN [QCM_CT_Request].[PartialOrFull] END,
     CASE @OrderBy WHEN 'PartialOrFull DESC' THEN [QCM_CT_Request].[PartialOrFull] END DESC,
     CASE @OrderBy WHEN 'NotSelectedList' THEN [QCM_CT_Request].[NotSelectedList] END,
     CASE @OrderBy WHEN 'NotSelectedList DESC' THEN [QCM_CT_Request].[NotSelectedList] END DESC,
     CASE @OrderBy WHEN 'SelectedList' THEN [QCM_CT_Request].[SelectedList] END,
     CASE @OrderBy WHEN 'SelectedList DESC' THEN [QCM_CT_Request].[SelectedList] END DESC,
     CASE @OrderBy WHEN 'Product' THEN [QCM_CT_Request].[Product] END,
     CASE @OrderBy WHEN 'Product DESC' THEN [QCM_CT_Request].[Product] END DESC,
     CASE @OrderBy WHEN 'Project' THEN [QCM_CT_Request].[Project] END,
     CASE @OrderBy WHEN 'Project DESC' THEN [QCM_CT_Request].[Project] END DESC,
     CASE @OrderBy WHEN 'GridLineStatus' THEN [QCM_CT_Request].[GridLineStatus] END,
     CASE @OrderBy WHEN 'GridLineStatus DESC' THEN [QCM_CT_Request].[GridLineStatus] END DESC,
     CASE @OrderBy WHEN 'InspectionStageiD' THEN [QCM_CT_Request].[InspectionStageiD] END,
     CASE @OrderBy WHEN 'InspectionStageiD DESC' THEN [QCM_CT_Request].[InspectionStageiD] END DESC,
     CASE @OrderBy WHEN 'IrefWeight' THEN [QCM_CT_Request].[IrefWeight] END,
     CASE @OrderBy WHEN 'IrefWeight DESC' THEN [QCM_CT_Request].[IrefWeight] END DESC,
     CASE @OrderBy WHEN 'ProgressWeight' THEN [QCM_CT_Request].[ProgressWeight] END,
     CASE @OrderBy WHEN 'ProgressWeight DESC' THEN [QCM_CT_Request].[ProgressWeight] END DESC,
     CASE @OrderBy WHEN 'QCM_InspectionStages1_Description' THEN [QCM_InspectionStages1].[Description] END,
     CASE @OrderBy WHEN 'QCM_InspectionStages1_Description DESC' THEN [QCM_InspectionStages1].[Description] END DESC 

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
