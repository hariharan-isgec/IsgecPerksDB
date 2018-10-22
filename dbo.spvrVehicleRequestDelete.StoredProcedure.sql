USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestDelete]
  @Original_RequestNo Int,
  @RowCount int = null OUTPUT
  AS
  update PAK_PkgListH set VRRequestNo = NULL, VRConverted=0 where VRRequestNo=@Original_RequestNo
  delete VR_RequestAttachments where [RequestNo] = @Original_RequestNo
  delete VR_CT_VehicleRequest where VRRequestNo =@Original_RequestNo
  DELETE [VR_VehicleRequest]
  WHERE
  [VR_VehicleRequest].[RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount
GO
