USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostDivisionsUpdate]
  @Original_DivisionID Int, 
  @DivisionName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_Divisions] SET 
   [DivisionName] = @DivisionName
  WHERE
  [DivisionID] = @Original_DivisionID
  SET @RowCount = @@RowCount
GO
