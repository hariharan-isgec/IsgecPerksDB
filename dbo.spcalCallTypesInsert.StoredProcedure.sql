USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalCallTypesInsert]
  @Description NVarChar(30),
  @Priority NVarChar(1),
  @ResponseTime Decimal(6,2),
  @Return_CallTypeID Int = null OUTPUT
  AS
  INSERT [CAL_CallTypes]
  (
   [Description]
  ,[Priority]
  ,[ResponseTime]
  )
  VALUES
  (
   @Description
  ,@Priority
  ,@ResponseTime
  )
  SET @Return_CallTypeID = Scope_Identity()
GO
