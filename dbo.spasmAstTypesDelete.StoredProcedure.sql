USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTypesDelete]
  @Original_AssetTypeID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstTypes]
  WHERE
  [ASM_AstTypes].[AssetTypeID] = @Original_AssetTypeID
  SET @RowCount = @@RowCount
GO
