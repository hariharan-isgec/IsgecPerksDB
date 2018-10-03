USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmTmtlStatusInsert]
  @StatusID NVarChar(1),
  @Description NVarChar(30),
  @Return_StatusID NVarChar(1) = null OUTPUT
  AS
  INSERT [DCM_TmtlStatus]
  (
   [StatusID]
  ,[Description]
  )
  VALUES
  (
   @StatusID
  ,@Description
  )
  SET @Return_StatusID = @StatusID
GO
