USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSoftwaresDelete]
  @Original_SoftwareID NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstSoftwares]
  WHERE
  [ASM_AstSoftwares].[SoftwareID] = @Original_SoftwareID
  SET @RowCount = @@RowCount
GO
