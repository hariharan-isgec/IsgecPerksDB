USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillStatusInsert]
  @Description NVarChar(50),
  @Return_BillStatusID Int = null OUTPUT 
  AS
  INSERT [ERP_TPTBillStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_BillStatusID = Scope_Identity()
GO
