USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStagesInsert]
  @Description NVarChar(50),
  @Return_InspectionStageID Int = null OUTPUT 
  AS
  INSERT [QCM_InspectionStages]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_InspectionStageID = Scope_Identity()
GO
