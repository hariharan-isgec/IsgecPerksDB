USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmProjectsInsert]
  @ProjectCode NVarChar(6),
  @Description NVarChar(30),
  @Return_ProjectCode NVarChar(6) = null OUTPUT
  AS
  INSERT [DCM_Projects]
  (
   [ProjectCode]
  ,[Description]
  )
  VALUES
  (
   @ProjectCode
  ,@Description
  )
  SET @Return_ProjectCode = @ProjectCode
GO
