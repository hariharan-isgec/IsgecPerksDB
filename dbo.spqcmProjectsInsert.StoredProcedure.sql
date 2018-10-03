USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmProjectsInsert]
  @ProjectID NVarChar(6),
  @Description NVarChar(50),
  @Return_ProjectID NVarChar(6) = null OUTPUT
  AS
  INSERT [IDM_Projects]
  (
   [ProjectID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@Description
  )
  SET @Return_ProjectID = @ProjectID
GO
