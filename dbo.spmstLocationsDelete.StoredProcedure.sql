USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstLocationsDelete]
  @Original_LocationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_Locations]
  WHERE
  [AST_Locations].[LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
