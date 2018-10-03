USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitsInsert]
  @Description NVarChar(50),
  @UnitSetID Int,
  @ConversionFactor Decimal(18,8),
  @Return_UnitID Int = null OUTPUT 
  AS
  INSERT [PAK_Units]
  (
   [Description]
  ,[UnitSetID]
  ,[ConversionFactor]
  )
  VALUES
  (
   @Description
  ,@UnitSetID
  ,@ConversionFactor
  )
  SET @Return_UnitID = Scope_Identity()
GO
