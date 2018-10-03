USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmPendingProblemsUpdate]
  @Original_SheetID Int, 
  @Original_SerialNo Int, 
  @ProblemClosed Bit,
  @ClosedBy NVarChar(8),
  @ClosedOn DateTime,
  @ClosingRemarks NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ServiceSheetDetails] SET 
   [ProblemClosed] = @ProblemClosed
  ,[ClosedBy] = @ClosedBy
  ,[ClosedOn] = @ClosedOn
  ,[ClosingRemarks] = @ClosingRemarks
  WHERE
  [SheetID] = @Original_SheetID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
