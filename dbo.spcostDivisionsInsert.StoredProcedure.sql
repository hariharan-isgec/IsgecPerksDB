USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostDivisionsInsert]
  @DivisionName NVarChar(50),
  @Return_DivisionID Int = null OUTPUT 
  AS
  INSERT [COST_Divisions]
  (
   [DivisionName]
  )
  VALUES
  (
   @DivisionName
  )
  SET @Return_DivisionID = Scope_Identity()
GO
