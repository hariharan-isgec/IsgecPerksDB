USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupProjectsInsert]
  @ProjectGroupID Int,
  @ProjectID NVarChar(6),
  @Return_ProjectGroupID Int = null OUTPUT, 
  @Return_ProjectID NVarChar(6) = null OUTPUT 
  AS
  INSERT [COST_ProjectGroupProjects]
  (
   [ProjectGroupID]
  ,[ProjectID]
  )
  VALUES
  (
   @ProjectGroupID
  ,UPPER(@ProjectID)
  )
  SET @Return_ProjectGroupID = @ProjectGroupID
  SET @Return_ProjectID = @ProjectID
GO
