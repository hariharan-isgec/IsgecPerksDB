USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTDUpdate]
  @Original_TmtlID Int, 
  @Original_ProjectID NVarChar(6), 
  @Original_DocumentID NVarChar(30), 
  @Original_RevisionNo NVarChar(2), 
  @TmtlID Int,
  @ProjectID NVarChar(6),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(2),
  @SendStatusID NVarChar(3),
  @NoOfCopies Int,
  @SendRemarks NVarChar(1000),
  @TmtlStatusID Int,
  @DocumentStatusID Int,
  @ResponsibleAgencyID Int,
  @TmtlTypeID NVarChar(2),
  @CustomerID NVarChar(6),
  @VendorID NVarChar(6),
  @CardNo NVarChar(8),
  @ReceiveStatusID NVarChar(3),
  @ReceivedRefNo NVarChar(250),
  @ReceivedRemarks NVarChar(1000),
  @ReceiveLocked Bit,
  @ReceivedOn DateTime,
  @ReceivedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_TransmittalDetail] SET 
   [TmtlID] = @TmtlID
  ,[ProjectID] = @ProjectID
  ,[DocumentID] = @DocumentID
  ,[RevisionNo] = @RevisionNo
  ,[SendStatusID] = @SendStatusID
  ,[NoOfCopies] = @NoOfCopies
  ,[SendRemarks] = @SendRemarks
  ,[TmtlStatusID] = @TmtlStatusID
  ,[DocumentStatusID] = @DocumentStatusID
  ,[ResponsibleAgencyID] = @ResponsibleAgencyID
  ,[TmtlTypeID] = @TmtlTypeID
  ,[CustomerID] = @CustomerID
  ,[VendorID] = @VendorID
  ,[CardNo] = @CardNo
  ,[ReceiveStatusID] = @ReceiveStatusID
  ,[ReceivedRefNo] = @ReceivedRefNo
  ,[ReceivedRemarks] = @ReceivedRemarks
  ,[ReceiveLocked] = @ReceiveLocked
  ,[ReceivedOn] = @ReceivedOn
  ,[ReceivedBy] = @ReceivedBy
  WHERE
  [TmtlID] = @Original_TmtlID
  AND [ProjectID] = @Original_ProjectID
  AND [DocumentID] = @Original_DocumentID
  AND [RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
