USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestAttachmentsSelectListSearch]
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
 ,RequestNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestNo, SerialNo)
  SELECT [VR_RequestAttachments].[RequestNo], [VR_RequestAttachments].[SerialNo] FROM [VR_RequestAttachments]
  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest1]
    ON [VR_RequestAttachments].[RequestNo] = [VR_VehicleRequest1].[RequestNo]
 WHERE  
   ( 
         STR(ISNULL([VR_RequestAttachments].[RequestNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestAttachments].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestAttachments].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestAttachments].[FileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestAttachments].[DiskFile],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [VR_RequestAttachments].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [VR_RequestAttachments].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_RequestAttachments].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_RequestAttachments].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_RequestAttachments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_RequestAttachments].[Description] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [VR_RequestAttachments].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [VR_RequestAttachments].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [VR_RequestAttachments].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [VR_RequestAttachments].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleRequest1_RequestDescription' THEN [VR_VehicleRequest1].[RequestDescription] END,
     CASE @OrderBy WHEN 'VR_VehicleRequest1_RequestDescription DESC' THEN [VR_VehicleRequest1].[RequestDescription] END DESC 

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
