USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestAttachmentsSelectByRequestNo]
  @RequestNo Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_RequestAttachments].[RequestNo] ,
		[VR_RequestAttachments].[SerialNo] ,
		[VR_RequestAttachments].[Description] ,
		[VR_RequestAttachments].[FileName] ,
		[VR_RequestAttachments].[DiskFile] ,
		[VR_VehicleRequest1].[RequestDescription] AS VR_VehicleRequest1_RequestDescription 
  FROM [VR_RequestAttachments] 
  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest1]
    ON [VR_RequestAttachments].[RequestNo] = [VR_VehicleRequest1].[RequestNo]
  WHERE
  [VR_RequestAttachments].[RequestNo] = @RequestNo
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
GO
