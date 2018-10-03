USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkClaimStatusInsert]
  @Description NVarChar(50),
  @Return_ClaimStatusID Int = null OUTPUT 
  AS
  INSERT [PRK_ClaimStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ClaimStatusID = Scope_Identity()
GO
