USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillStatesInsert]
  @Description NVarChar(50),
  @Return_BillStatusID Int = null OUTPUT 
  AS
  INSERT [TA_BillStates]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_BillStatusID = Scope_Identity()
GO
