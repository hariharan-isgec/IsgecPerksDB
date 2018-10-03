USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQuartersUpdate]
  @Original_Quarter Int, 
  @Quarter Int,
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_Quarters] SET 
   [Quarter] = @Quarter
  ,[Description] = @Description
  WHERE
  [Quarter] = @Original_Quarter
  SET @RowCount = @@RowCount
GO
