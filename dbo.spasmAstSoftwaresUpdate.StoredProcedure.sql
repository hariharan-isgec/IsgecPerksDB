USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSoftwaresUpdate]
  @Original_SoftwareID NVarChar(15), 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstSoftwares] SET 
   [Description] = @Description
  WHERE
  [SoftwareID] = @Original_SoftwareID
  SET @RowCount = @@RowCount
GO
