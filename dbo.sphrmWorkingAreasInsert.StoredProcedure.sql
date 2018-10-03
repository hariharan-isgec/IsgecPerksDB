USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWorkingAreasInsert]
  @Description NVarChar(100),
  @Return_WorkingAreaID Int = null OUTPUT
  AS
  INSERT [HRM_WorkingAreas]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_WorkingAreaID = Scope_Identity()
GO
