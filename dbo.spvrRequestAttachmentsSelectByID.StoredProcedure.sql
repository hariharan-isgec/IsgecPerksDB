USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestAttachmentsSelectByID]
  @LoginID NVarChar(8),
  @RequestNo Int,
  @SerialNo Int 
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
  AND [VR_RequestAttachments].[SerialNo] = @SerialNo
GO
