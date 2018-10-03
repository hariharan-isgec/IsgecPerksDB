USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmInitiatorSheetDetailsUpdate]
  @Original_SheetID Int, 
  @Original_SerialNo Int, 
  @Initiated Bit,
  @InitiatedBy NVarChar(8),
  @InitiatedOn DateTime,
  @ProblemIdentified Bit,
  @InitiatorRemarks NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ServiceSheetDetails] SET 
   [Initiated] = @Initiated
  ,[InitiatedBy] = @InitiatedBy
  ,[InitiatedOn] = @InitiatedOn
  ,[ProblemIdentified] = @ProblemIdentified
  ,[InitiatorRemarks] = @InitiatorRemarks
  WHERE
  [SheetID] = @Original_SheetID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
