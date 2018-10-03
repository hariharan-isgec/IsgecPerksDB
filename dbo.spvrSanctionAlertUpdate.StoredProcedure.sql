USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrSanctionAlertUpdate]
  @Original_ProjectID NVarChar(6), 
  @ProjectID NVarChar(6),
  @At60 Bit,
  @At70 Bit,
  @At80 Bit,
  @At90 Bit,
  @At95 Bit,
  @At96 Bit,
  @At97 Bit,
  @At98 Bit,
  @At99 Bit,
  @EMailIDs NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_SanctionAlert] SET 
   [ProjectID] = @ProjectID
  ,[At60] = @At60
  ,[At70] = @At70
  ,[At80] = @At80
  ,[At90] = @At90
  ,[At95] = @At95
  ,[At96] = @At96
  ,[At97] = @At97
  ,[At98] = @At98
  ,[At99] = @At99
  ,[EMailIDs] = @EMailIDs
  WHERE
  [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
