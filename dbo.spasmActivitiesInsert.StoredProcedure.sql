USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmActivitiesInsert]
  @ActivityID NVarChar(20),
  @Description NVarChar(50),
  @Return_ActivityID NVarChar(20) = null OUTPUT
  AS
  INSERT [ASM_Activities]
  (
   [ActivityID]
  ,[Description]
  )
  VALUES
  (
   @ActivityID
  ,@Description
  )
  SET @Return_ActivityID = @ActivityID
GO
