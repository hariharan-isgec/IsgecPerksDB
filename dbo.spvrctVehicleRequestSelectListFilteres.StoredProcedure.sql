USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrctVehicleRequestSelectListFilteres]
  @Filter_VRRequestNo Int,
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
 ,VRRequestNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VRRequestNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_CT_VehicleRequest].[VRRequestNo]'
  SET @LGSQL = @LGSQL + ', [VR_CT_VehicleRequest].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_CT_VehicleRequest] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest1]'
  SET @LGSQL = @LGSQL + '    ON [VR_CT_VehicleRequest].[VRRequestNo] = [VR_VehicleRequest1].[RequestNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VRRequestNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_CT_VehicleRequest].[VRRequestNo] = ' + STR(@Filter_VRRequestNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VRRequestNo' THEN '[VR_CT_VehicleRequest].[VRRequestNo]'
                        WHEN 'VRRequestNo DESC' THEN '[VR_CT_VehicleRequest].[VRRequestNo] DESC'
                        WHEN 'SerialNo' THEN '[VR_CT_VehicleRequest].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_CT_VehicleRequest].[SerialNo] DESC'
                        WHEN 'PONumber' THEN '[VR_CT_VehicleRequest].[PONumber]'
                        WHEN 'PONumber DESC' THEN '[VR_CT_VehicleRequest].[PONumber] DESC'
                        WHEN 'ItemReference' THEN '[VR_CT_VehicleRequest].[ItemReference]'
                        WHEN 'ItemReference DESC' THEN '[VR_CT_VehicleRequest].[ItemReference] DESC'
                        WHEN 'ActivityID' THEN '[VR_CT_VehicleRequest].[ActivityID]'
                        WHEN 'ActivityID DESC' THEN '[VR_CT_VehicleRequest].[ActivityID] DESC'
                        WHEN 'ItemUnit' THEN '[VR_CT_VehicleRequest].[ItemUnit]'
                        WHEN 'ItemUnit DESC' THEN '[VR_CT_VehicleRequest].[ItemUnit] DESC'
                        WHEN 'Activity2Desc' THEN '[VR_CT_VehicleRequest].[Activity2Desc]'
                        WHEN 'Activity2Desc DESC' THEN '[VR_CT_VehicleRequest].[Activity2Desc] DESC'
                        WHEN 'Activity3Desc' THEN '[VR_CT_VehicleRequest].[Activity3Desc]'
                        WHEN 'Activity3Desc DESC' THEN '[VR_CT_VehicleRequest].[Activity3Desc] DESC'
                        WHEN 'Activity4Desc' THEN '[VR_CT_VehicleRequest].[Activity4Desc]'
                        WHEN 'Activity4Desc DESC' THEN '[VR_CT_VehicleRequest].[Activity4Desc] DESC'
                        WHEN 'Handle' THEN '[VR_CT_VehicleRequest].[Handle]'
                        WHEN 'Handle DESC' THEN '[VR_CT_VehicleRequest].[Handle] DESC'
                        WHEN 'ProgressPercent' THEN '[VR_CT_VehicleRequest].[ProgressPercent]'
                        WHEN 'ProgressPercent DESC' THEN '[VR_CT_VehicleRequest].[ProgressPercent] DESC'
                        WHEN 'Quantity' THEN '[VR_CT_VehicleRequest].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[VR_CT_VehicleRequest].[Quantity] DESC'
                        WHEN 'PercentOfQuantity' THEN '[VR_CT_VehicleRequest].[PercentOfQuantity]'
                        WHEN 'PercentOfQuantity DESC' THEN '[VR_CT_VehicleRequest].[PercentOfQuantity] DESC'
                        WHEN 'PartialOrFull' THEN '[VR_CT_VehicleRequest].[PartialOrFull]'
                        WHEN 'PartialOrFull DESC' THEN '[VR_CT_VehicleRequest].[PartialOrFull] DESC'
                        WHEN 'NotSelectedList' THEN '[VR_CT_VehicleRequest].[NotSelectedList]'
                        WHEN 'NotSelectedList DESC' THEN '[VR_CT_VehicleRequest].[NotSelectedList] DESC'
                        WHEN 'SelectedList' THEN '[VR_CT_VehicleRequest].[SelectedList]'
                        WHEN 'SelectedList DESC' THEN '[VR_CT_VehicleRequest].[SelectedList] DESC'
                        WHEN 'Product' THEN '[VR_CT_VehicleRequest].[Product]'
                        WHEN 'Product DESC' THEN '[VR_CT_VehicleRequest].[Product] DESC'
                        WHEN 'Project' THEN '[VR_CT_VehicleRequest].[Project]'
                        WHEN 'Project DESC' THEN '[VR_CT_VehicleRequest].[Project] DESC'
                        WHEN 'GridLineStatus' THEN '[VR_CT_VehicleRequest].[GridLineStatus]'
                        WHEN 'GridLineStatus DESC' THEN '[VR_CT_VehicleRequest].[GridLineStatus] DESC'
                        WHEN 'IrefWeight' THEN '[VR_CT_VehicleRequest].[IrefWeight]'
                        WHEN 'IrefWeight DESC' THEN '[VR_CT_VehicleRequest].[IrefWeight] DESC'
                        WHEN 'ProgressWeight' THEN '[VR_CT_VehicleRequest].[ProgressWeight]'
                        WHEN 'ProgressWeight DESC' THEN '[VR_CT_VehicleRequest].[ProgressWeight] DESC'
                        WHEN 'VR_VehicleRequest1_RequestDescription' THEN '[VR_VehicleRequest1].[RequestDescription]'
                        WHEN 'VR_VehicleRequest1_RequestDescription DESC' THEN '[VR_VehicleRequest1].[RequestDescription] DESC'
                        ELSE '[VR_CT_VehicleRequest].[VRRequestNo],[VR_CT_VehicleRequest].[SerialNo]'
                    END
  EXEC (@LGSQL)

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
