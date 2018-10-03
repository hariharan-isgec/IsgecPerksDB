USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus3Insert]
  @Description NVarChar(50),
  @Return_FunctionalStatusID3 Int = null OUTPUT
  AS
  INSERT [HRM_FunctionalStatus3]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_FunctionalStatusID3 = Scope_Identity()
GO
