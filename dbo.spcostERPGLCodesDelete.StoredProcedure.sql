USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostERPGLCodesDelete]
  @Original_GLCode NVarChar(7),
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_ERPGLCodes]
  WHERE
  [COST_ERPGLCodes].[GLCode] = @Original_GLCode
  SET @RowCount = @@RowCount
GO
