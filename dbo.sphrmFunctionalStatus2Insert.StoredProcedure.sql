USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus2Insert]
  @Description NVarChar(50),
  @Return_FunctionalStatusID2 Int = null OUTPUT
  AS
  INSERT [HRM_FunctionalStatus2]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_FunctionalStatusID2 = Scope_Identity()
GO
