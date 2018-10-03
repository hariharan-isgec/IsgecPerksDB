USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectsInsert]
  @ProjectID NVarChar(6),
  @Description NVarChar(30),
  @Return_ProjectID NVarChar(6) = null OUTPUT
  AS
  INSERT [DCM_Projects]
  (
   [ProjectID]
  ,[Description]
  )
  VALUES
  (
   @ProjectID
  ,@Description
  )
  SET @Return_ProjectID = @ProjectID
GO
