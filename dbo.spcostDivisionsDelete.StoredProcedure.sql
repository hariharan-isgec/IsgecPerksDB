USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostDivisionsDelete]
  @Original_DivisionID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_Divisions]
  WHERE
  [COST_Divisions].[DivisionID] = @Original_DivisionID
  SET @RowCount = @@RowCount
GO
