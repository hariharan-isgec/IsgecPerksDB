USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDivisionsDelete]
  @Original_DivisionID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Divisions]
  WHERE
  [HRM_Divisions].[DivisionID] = @Original_DivisionID
  SET @RowCount = @@RowCount
GO
