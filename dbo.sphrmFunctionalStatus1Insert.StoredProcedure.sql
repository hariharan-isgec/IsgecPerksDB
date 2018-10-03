USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus1Insert]
  @Description NVarChar(50),
  @Return_FunctionalStatusID1 Int = null OUTPUT
  AS
  INSERT [HRM_FunctionalStatus1]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_FunctionalStatusID1 = Scope_Identity()
GO
