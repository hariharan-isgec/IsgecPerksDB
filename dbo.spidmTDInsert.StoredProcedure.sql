USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTDInsert]
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
  @Return_TmtlID Int = null OUTPUT
  AS
  INSERT [IDM_TransmittalDetail]
  (
   [TmtlID]
  ,[ProjectID]
  ,[DocumentID]
  ,[RevisionNo]
  ,[SendStatusID]
  ,[NoOfCopies]
  ,[SendRemarks]
  ,[TmtlStatusID]
  ,[DocumentStatusID]
  ,[ResponsibleAgencyID]
  ,[TmtlTypeID]
  ,[CustomerID]
  ,[VendorID]
  ,[CardNo]
  ,[ReceiveStatusID]
  ,[ReceivedRefNo]
  ,[ReceivedRemarks]
  ,[ReceiveLocked]
  ,[ReceivedOn]
  ,[ReceivedBy]
  )
  VALUES
  (
   @TmtlID
  ,UPPER(@ProjectID)
  ,UPPER(@DocumentID)
  ,UPPER(@RevisionNo)
  ,@SendStatusID
  ,@NoOfCopies
  ,@SendRemarks
  ,@TmtlStatusID
  ,@DocumentStatusID
  ,@ResponsibleAgencyID
  ,@TmtlTypeID
  ,@CustomerID
  ,@VendorID
  ,@CardNo
  ,@ReceiveStatusID
  ,@ReceivedRefNo
  ,@ReceivedRemarks
  ,@ReceiveLocked
  ,@ReceivedOn
  ,@ReceivedBy
  )
  SET @Return_TmtlID = @TmtlID
GO
