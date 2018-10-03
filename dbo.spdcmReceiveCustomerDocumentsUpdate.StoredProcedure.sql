USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmReceiveCustomerDocumentsUpdate]
  @Original_TmtlID Int, 
  @Original_ProjectID NVarChar(6), 
  @Original_CustomerID NVarChar(6), 
  @Original_DocumentID NVarChar(30), 
  @Original_RevisionNo NVarChar(2), 
  @ReceiveStatusID NVarChar(2),
  @ReceivedRefNo NVarChar(250),
  @ReceivedRemarks NVarChar(250),
  @ReceivedOn DateTime,
  @ReceivedBy NVarChar(8),
  @TempDetailStatus Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_CustomerTmtlDetails] SET 
   [ReceiveStatusID] = @ReceiveStatusID
  ,[ReceivedRefNo] = @ReceivedRefNo
  ,[ReceivedRemarks] = @ReceivedRemarks
  ,[ReceivedOn] = @ReceivedOn
  ,[ReceivedBy] = @ReceivedBy
  ,[TempDetailStatus] = @TempDetailStatus
  WHERE
  [TmtlID] = @Original_TmtlID
  AND [ProjectID] = @Original_ProjectID
  AND [CustomerID] = @Original_CustomerID
  AND [DocumentID] = @Original_DocumentID
  AND [RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
