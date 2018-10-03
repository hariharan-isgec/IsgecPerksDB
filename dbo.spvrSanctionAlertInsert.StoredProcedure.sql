USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrSanctionAlertInsert]
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
  @Return_ProjectID NVarChar(6) = null OUTPUT 
  AS
  INSERT [VR_SanctionAlert]
  (
   [ProjectID]
  ,[At60]
  ,[At70]
  ,[At80]
  ,[At90]
  ,[At95]
  ,[At96]
  ,[At97]
  ,[At98]
  ,[At99]
  ,[EMailIDs]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@At60
  ,@At70
  ,@At80
  ,@At90
  ,@At95
  ,@At96
  ,@At97
  ,@At98
  ,@At99
  ,@EMailIDs
  )
  SET @Return_ProjectID = @ProjectID
GO
