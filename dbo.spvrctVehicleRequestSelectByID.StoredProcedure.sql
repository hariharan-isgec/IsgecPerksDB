USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrctVehicleRequestSelectByID]
  @LoginID NVarChar(8),
  @VRRequestNo Int,
  @SerialNo Int 
  AS
  SELECT
    [VR_CT_VehicleRequest].* ,
    [VR_VehicleRequest1].[RequestDescription] AS VR_VehicleRequest1_RequestDescription 
  FROM [VR_CT_VehicleRequest] 
  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest1]
    ON [VR_CT_VehicleRequest].[VRRequestNo] = [VR_VehicleRequest1].[RequestNo]
  WHERE
  [VR_CT_VehicleRequest].[VRRequestNo] = @VRRequestNo
  AND [VR_CT_VehicleRequest].[SerialNo] = @SerialNo
GO
