USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTypesUpdate]
  @Original_AssetTypeID NVarChar(10), 
  @Description NVarChar(50),
  @IssueToLocation Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstTypes] SET 
   [Description] = @Description
  ,[IssueToLocation] = @IssueToLocation
  WHERE
  [AssetTypeID] = @Original_AssetTypeID
  SET @RowCount = @@RowCount
GO
