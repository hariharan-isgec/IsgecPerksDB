USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStatusInsert]
  @Description NVarChar(50),
  @Return_InspectionStatusID Int = null OUTPUT 
  AS
  INSERT [QCM_InspectionStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_InspectionStatusID = Scope_Identity()
GO
