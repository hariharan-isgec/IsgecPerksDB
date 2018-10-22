USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrctVehicleRequestSelectListSearch]
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
 ,VRRequestNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (VRRequestNo, SerialNo)
  SELECT [VR_CT_VehicleRequest].[VRRequestNo], [VR_CT_VehicleRequest].[SerialNo] FROM [VR_CT_VehicleRequest]
  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest1]
    ON [VR_CT_VehicleRequest].[VRRequestNo] = [VR_VehicleRequest1].[RequestNo]
 WHERE  
   ( 
         STR(ISNULL([VR_CT_VehicleRequest].[VRRequestNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_CT_VehicleRequest].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[PONumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[ItemReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[ActivityID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[ItemUnit],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[Activity2Desc],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[Activity3Desc],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[Activity4Desc],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[Handle],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_CT_VehicleRequest].[ProgressPercent], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_CT_VehicleRequest].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_CT_VehicleRequest].[PercentOfQuantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[PartialOrFull],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[NotSelectedList],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[SelectedList],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[Product],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_CT_VehicleRequest].[Project],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_CT_VehicleRequest].[GridLineStatus], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_CT_VehicleRequest].[IrefWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_CT_VehicleRequest].[ProgressWeight], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'VRRequestNo' THEN [VR_CT_VehicleRequest].[VRRequestNo] END,
     CASE @OrderBy WHEN 'VRRequestNo DESC' THEN [VR_CT_VehicleRequest].[VRRequestNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_CT_VehicleRequest].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_CT_VehicleRequest].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PONumber' THEN [VR_CT_VehicleRequest].[PONumber] END,
     CASE @OrderBy WHEN 'PONumber DESC' THEN [VR_CT_VehicleRequest].[PONumber] END DESC,
     CASE @OrderBy WHEN 'ItemReference' THEN [VR_CT_VehicleRequest].[ItemReference] END,
     CASE @OrderBy WHEN 'ItemReference DESC' THEN [VR_CT_VehicleRequest].[ItemReference] END DESC,
     CASE @OrderBy WHEN 'ActivityID' THEN [VR_CT_VehicleRequest].[ActivityID] END,
     CASE @OrderBy WHEN 'ActivityID DESC' THEN [VR_CT_VehicleRequest].[ActivityID] END DESC,
     CASE @OrderBy WHEN 'ItemUnit' THEN [VR_CT_VehicleRequest].[ItemUnit] END,
     CASE @OrderBy WHEN 'ItemUnit DESC' THEN [VR_CT_VehicleRequest].[ItemUnit] END DESC,
     CASE @OrderBy WHEN 'Activity2Desc' THEN [VR_CT_VehicleRequest].[Activity2Desc] END,
     CASE @OrderBy WHEN 'Activity2Desc DESC' THEN [VR_CT_VehicleRequest].[Activity2Desc] END DESC,
     CASE @OrderBy WHEN 'Activity3Desc' THEN [VR_CT_VehicleRequest].[Activity3Desc] END,
     CASE @OrderBy WHEN 'Activity3Desc DESC' THEN [VR_CT_VehicleRequest].[Activity3Desc] END DESC,
     CASE @OrderBy WHEN 'Activity4Desc' THEN [VR_CT_VehicleRequest].[Activity4Desc] END,
     CASE @OrderBy WHEN 'Activity4Desc DESC' THEN [VR_CT_VehicleRequest].[Activity4Desc] END DESC,
     CASE @OrderBy WHEN 'Handle' THEN [VR_CT_VehicleRequest].[Handle] END,
     CASE @OrderBy WHEN 'Handle DESC' THEN [VR_CT_VehicleRequest].[Handle] END DESC,
     CASE @OrderBy WHEN 'ProgressPercent' THEN [VR_CT_VehicleRequest].[ProgressPercent] END,
     CASE @OrderBy WHEN 'ProgressPercent DESC' THEN [VR_CT_VehicleRequest].[ProgressPercent] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [VR_CT_VehicleRequest].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [VR_CT_VehicleRequest].[Quantity] END DESC,
     CASE @OrderBy WHEN 'PercentOfQuantity' THEN [VR_CT_VehicleRequest].[PercentOfQuantity] END,
     CASE @OrderBy WHEN 'PercentOfQuantity DESC' THEN [VR_CT_VehicleRequest].[PercentOfQuantity] END DESC,
     CASE @OrderBy WHEN 'PartialOrFull' THEN [VR_CT_VehicleRequest].[PartialOrFull] END,
     CASE @OrderBy WHEN 'PartialOrFull DESC' THEN [VR_CT_VehicleRequest].[PartialOrFull] END DESC,
     CASE @OrderBy WHEN 'NotSelectedList' THEN [VR_CT_VehicleRequest].[NotSelectedList] END,
     CASE @OrderBy WHEN 'NotSelectedList DESC' THEN [VR_CT_VehicleRequest].[NotSelectedList] END DESC,
     CASE @OrderBy WHEN 'SelectedList' THEN [VR_CT_VehicleRequest].[SelectedList] END,
     CASE @OrderBy WHEN 'SelectedList DESC' THEN [VR_CT_VehicleRequest].[SelectedList] END DESC,
     CASE @OrderBy WHEN 'Product' THEN [VR_CT_VehicleRequest].[Product] END,
     CASE @OrderBy WHEN 'Product DESC' THEN [VR_CT_VehicleRequest].[Product] END DESC,
     CASE @OrderBy WHEN 'Project' THEN [VR_CT_VehicleRequest].[Project] END,
     CASE @OrderBy WHEN 'Project DESC' THEN [VR_CT_VehicleRequest].[Project] END DESC,
     CASE @OrderBy WHEN 'GridLineStatus' THEN [VR_CT_VehicleRequest].[GridLineStatus] END,
     CASE @OrderBy WHEN 'GridLineStatus DESC' THEN [VR_CT_VehicleRequest].[GridLineStatus] END DESC,
     CASE @OrderBy WHEN 'IrefWeight' THEN [VR_CT_VehicleRequest].[IrefWeight] END,
     CASE @OrderBy WHEN 'IrefWeight DESC' THEN [VR_CT_VehicleRequest].[IrefWeight] END DESC,
     CASE @OrderBy WHEN 'ProgressWeight' THEN [VR_CT_VehicleRequest].[ProgressWeight] END,
     CASE @OrderBy WHEN 'ProgressWeight DESC' THEN [VR_CT_VehicleRequest].[ProgressWeight] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleRequest1_RequestDescription' THEN [VR_VehicleRequest1].[RequestDescription] END,
     CASE @OrderBy WHEN 'VR_VehicleRequest1_RequestDescription DESC' THEN [VR_VehicleRequest1].[RequestDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [VR_CT_VehicleRequest].* ,
    [VR_VehicleRequest1].[RequestDescription] AS VR_VehicleRequest1_RequestDescription 
  FROM [VR_CT_VehicleRequest] 
      INNER JOIN #PageIndex
          ON [VR_CT_VehicleRequest].[VRRequestNo] = #PageIndex.VRRequestNo
          AND [VR_CT_VehicleRequest].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest1]
    ON [VR_CT_VehicleRequest].[VRRequestNo] = [VR_VehicleRequest1].[RequestNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
