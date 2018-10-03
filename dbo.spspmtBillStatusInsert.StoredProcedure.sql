USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillStatusInsert]
  @Description NVarChar(30),
  @NextStatusID Int,
  @Return_BillStatusID Int = null OUTPUT 
  AS
  INSERT [SPMT_BillStatus]
  (
   [Description]
  ,[NextStatusID]
  )
  VALUES
  (
   @Description
  ,@NextStatusID
  )
  SET @Return_BillStatusID = Scope_Identity()
GO
