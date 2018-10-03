USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDivisionsDelete]
  @Original_DivisionID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_Divisions]
  WHERE
  [PAK_Divisions].[DivisionID] = @Original_DivisionID
  SET @RowCount = @@RowCount
GO
