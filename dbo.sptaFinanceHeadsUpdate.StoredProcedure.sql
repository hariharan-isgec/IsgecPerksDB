USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaFinanceHeadsUpdate]
  @Original_FinanceHeadID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_FinanceHeads] SET 
   [Description] = @Description
  WHERE
  [FinanceHeadID] = @Original_FinanceHeadID
  SET @RowCount = @@RowCount
GO
