USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUnitsInsert]
  @Description NVarChar(50),
  @ConversionFactor Decimal(18,6),
  @Return_UnitID Int = null OUTPUT 
  AS
  INSERT [VR_Units]
  (
   [Description]
  ,[ConversionFactor]
  )
  VALUES
  (
   @Description
  ,@ConversionFactor
  )
  SET @Return_UnitID = Scope_Identity()
GO
