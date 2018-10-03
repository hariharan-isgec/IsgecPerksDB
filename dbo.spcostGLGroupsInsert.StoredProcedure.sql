USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupsInsert]
  @GLNatureID Int,
  @GLGroupDescriptions NVarChar(50),
  @CostGLGroupID Int,
  @Sequence Int,
  @Return_GLGroupID Int = null OUTPUT 
  AS
  INSERT [COST_GLGroups]
  (
   [GLNatureID]
  ,[GLGroupDescriptions]
  ,[CostGLGroupID]
  ,[Sequence]
  )
  VALUES
  (
   @GLNatureID
  ,@GLGroupDescriptions
  ,@CostGLGroupID
  ,@Sequence
  )
  SET @Return_GLGroupID = Scope_Identity()
GO
