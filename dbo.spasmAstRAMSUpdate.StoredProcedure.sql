USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstRAMSUpdate]
  @Original_RAMID NVarChar(10), 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstRAMS] SET 
   [Description] = @Description
  WHERE
  [RAMID] = @Original_RAMID
  SET @RowCount = @@RowCount
GO
