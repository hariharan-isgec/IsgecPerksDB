USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMobileBillPlansInsert]
  @Description NVarChar(50),
  @Return_MobileBillPlanID Int = null OUTPUT 
  AS
  INSERT [PRK_MobileBillPlans]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_MobileBillPlanID = Scope_Identity()
GO
