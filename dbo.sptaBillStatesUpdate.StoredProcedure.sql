USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillStatesUpdate]
  @Original_BillStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_BillStates] SET 
   [Description] = @Description
  WHERE
  [BillStatusID] = @Original_BillStatusID
  SET @RowCount = @@RowCount
GO
