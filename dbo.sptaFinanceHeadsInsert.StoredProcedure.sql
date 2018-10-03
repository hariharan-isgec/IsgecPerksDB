USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaFinanceHeadsInsert]
  @Description NVarChar(50),
  @Return_FinanceHeadID Int = null OUTPUT 
  AS
  INSERT [TA_FinanceHeads]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_FinanceHeadID = Scope_Identity()
GO
