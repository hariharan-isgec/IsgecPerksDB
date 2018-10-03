USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillTypesInsert]
  @Description NVarChar(50),
  @Return_BillType Int = null OUTPUT 
  AS
  INSERT [SPMT_BillTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_BillType = Scope_Identity()
GO
