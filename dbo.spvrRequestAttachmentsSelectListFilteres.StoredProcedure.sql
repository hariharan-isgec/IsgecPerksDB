USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestAttachmentsSelectListFilteres]
  @Filter_RequestNo Int,
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_RequestAttachments].[RequestNo]'
  SET @LGSQL = @LGSQL + ', [VR_RequestAttachments].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_RequestAttachments] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest1]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestAttachments].[RequestNo] = [VR_VehicleRequest1].[RequestNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_RequestAttachments].[RequestNo] = ' + STR(@Filter_RequestNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestNo' THEN '[VR_RequestAttachments].[RequestNo]'
                        WHEN 'RequestNo DESC' THEN '[VR_RequestAttachments].[RequestNo] DESC'
                        WHEN 'SerialNo' THEN '[VR_RequestAttachments].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_RequestAttachments].[SerialNo] DESC'
                        WHEN 'Description' THEN '[VR_RequestAttachments].[Description]'
                        WHEN 'Description DESC' THEN '[VR_RequestAttachments].[Description] DESC'
                        WHEN 'FileName' THEN '[VR_RequestAttachments].[FileName]'
                        WHEN 'FileName DESC' THEN '[VR_RequestAttachments].[FileName] DESC'
                        WHEN 'DiskFile' THEN '[VR_RequestAttachments].[DiskFile]'
                        WHEN 'DiskFile DESC' THEN '[VR_RequestAttachments].[DiskFile] DESC'
                        WHEN 'VR_VehicleRequest1_RequestDescription' THEN '[VR_VehicleRequest1].[RequestDescription]'
                        WHEN 'VR_VehicleRequest1_RequestDescription DESC' THEN '[VR_VehicleRequest1].[RequestDescription] DESC'
                        ELSE '[VR_RequestAttachments].[RequestNo],[VR_RequestAttachments].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_RequestAttachments].[RequestNo] ,
		[VR_RequestAttachments].[SerialNo] ,
		[VR_RequestAttachments].[Description] ,
		[VR_RequestAttachments].[FileName] ,
		[VR_RequestAttachments].[DiskFile] ,
		[VR_VehicleRequest1].[RequestDescription] AS VR_VehicleRequest1_RequestDescription 
  FROM [VR_RequestAttachments] 
    	INNER JOIN #PageIndex
          ON [VR_RequestAttachments].[RequestNo] = #PageIndex.RequestNo
          AND [VR_RequestAttachments].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest1]
    ON [VR_RequestAttachments].[RequestNo] = [VR_VehicleRequest1].[RequestNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
