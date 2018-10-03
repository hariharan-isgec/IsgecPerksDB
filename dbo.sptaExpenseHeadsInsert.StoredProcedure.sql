USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaExpenseHeadsInsert]
  @Description NVarChar(50),
  @OneTimeInTour Bit,
  @RequiresMDApproval Bit,
  @Return_ExpenseHeadID Int = null OUTPUT 
  AS
  INSERT [TA_ExpenseHeads]
  (
   [Description]
  ,[OneTimeInTour]
  ,[RequiresMDApproval]
  )
  VALUES
  (
   @Description
  ,@OneTimeInTour
  ,@RequiresMDApproval
  )
  SET @Return_ExpenseHeadID = Scope_Identity()
GO
