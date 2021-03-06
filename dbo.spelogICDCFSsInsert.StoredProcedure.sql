USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogICDCFSsInsert]
  @StuffingPointID Int,
  @Description NVarChar(100),
  @Return_ICDCFSID Int = null OUTPUT 
  AS
  INSERT [ELOG_ICDCFSs]
  (
   [StuffingPointID]
  ,[Description]
  )
  VALUES
  (
   @StuffingPointID
  ,@Description
  )
  SET @Return_ICDCFSID = Scope_Identity()
GO
