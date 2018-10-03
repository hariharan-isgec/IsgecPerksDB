USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQuartersDelete]
  @Original_Quarter Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_Quarters]
  WHERE
  [COST_Quarters].[Quarter] = @Original_Quarter
  SET @RowCount = @@RowCount
GO
