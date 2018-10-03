USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeTypesInsert]
  @Description NVarChar(50),
  @Return_ChargeTypeID Int = null OUTPUT 
  AS
  INSERT [ELOG_ChargeTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ChargeTypeID = Scope_Identity()
GO
