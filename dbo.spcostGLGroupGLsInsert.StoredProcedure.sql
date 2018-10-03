USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupGLsInsert]
  @GLGroupID Int,
  @GLCode NVarChar(10),
  @EffectiveStartDate DateTime,
  @EffectiveEndDate DateTime,
  @Return_GLGroupID Int = null OUTPUT, 
  @Return_GLCode NVarChar(10) = null OUTPUT 
  AS
  INSERT [COST_GLGroupGLs]
  (
   [GLGroupID]
  ,[GLCode]
  ,[EffectiveStartDate]
  ,[EffectiveEndDate]
  )
  VALUES
  (
   @GLGroupID
  ,UPPER(@GLCode)
  ,@EffectiveStartDate
  ,@EffectiveEndDate
  )
  SET @Return_GLGroupID = @GLGroupID
  SET @Return_GLCode = @GLCode
GO
