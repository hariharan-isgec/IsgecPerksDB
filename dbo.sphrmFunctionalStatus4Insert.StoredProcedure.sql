USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus4Insert]
  @Description NVarChar(50),
  @Return_FunctionalStatusID4 Int = null OUTPUT
  AS
  INSERT [HRM_FunctionalStatus4]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_FunctionalStatusID4 = Scope_Identity()
GO
