USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlDetailsUpdate]
  @Original_TmtlID Int, 
  @Original_ProjectID NVarChar(6), 
  @Original_CustomerID NVarChar(6), 
  @Original_DocumentID NVarChar(30), 
  @Original_RevisionNo NVarChar(2), 
  @SendStatusID NVarChar(2),
  @SendRemarks NVarChar(250),
  @ReceiveStatusID NVarChar(2),
  @ReceivedRefNo NVarChar(250),
  @ReceivedRemarks NVarChar(250),
  @ReceivedOn DateTime,
  @ReceivedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_CustomerTmtlDetails] SET 
   [SendStatusID] = @SendStatusID
  ,[SendRemarks] = @SendRemarks
  ,[ReceiveStatusID] = @ReceiveStatusID
  ,[ReceivedRefNo] = @ReceivedRefNo
  ,[ReceivedRemarks] = @ReceivedRemarks
  ,[ReceivedOn] = @ReceivedOn
  ,[ReceivedBy] = @ReceivedBy
  WHERE
  [TmtlID] = @Original_TmtlID
  AND [ProjectID] = @Original_ProjectID
  AND [CustomerID] = @Original_CustomerID
  AND [DocumentID] = @Original_DocumentID
  AND [RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
