USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstRAMSDelete]
  @Original_RAMID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstRAMS]
  WHERE
  [ASM_AstRAMS].[RAMID] = @Original_RAMID
  SET @RowCount = @@RowCount
GO
