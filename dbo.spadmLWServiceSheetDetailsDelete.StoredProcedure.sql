USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWServiceSheetDetailsDelete]
  @Original_SheetID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ServiceSheetDetails]
  WHERE
  [ADM_ServiceSheetDetails].[SheetID] = @Original_SheetID
  AND [ADM_ServiceSheetDetails].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
