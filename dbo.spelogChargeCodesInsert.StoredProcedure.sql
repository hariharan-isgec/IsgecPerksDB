USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCodesInsert]
  @ChargeCategoryID Int,
  @Description NVarChar(100),
  @Return_ChargeCategoryID Int = null OUTPUT, 
  @Return_ChargeCodeID Int = null OUTPUT 
  AS
  INSERT [ELOG_ChargeCodes]
  (
   [ChargeCategoryID]
  ,[Description]
  )
  VALUES
  (
   @ChargeCategoryID
  ,@Description
  )
  SET @Return_ChargeCategoryID = @ChargeCategoryID
  SET @Return_ChargeCodeID = Scope_Identity()
GO
