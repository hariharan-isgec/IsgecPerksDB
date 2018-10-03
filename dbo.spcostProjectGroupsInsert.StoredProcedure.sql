USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupsInsert]
  @ProjectGroupDescription NVarChar(50),
  @ProjectTypeID NVarChar(10),
  @Return_ProjectGroupID Int = null OUTPUT 
  AS
  INSERT [COST_ProjectGroups]
  (
   [ProjectGroupDescription]
  ,[ProjectTypeID]
  )
  VALUES
  (
   @ProjectGroupDescription
  ,@ProjectTypeID
  )
  SET @Return_ProjectGroupID = Scope_Identity()
GO
