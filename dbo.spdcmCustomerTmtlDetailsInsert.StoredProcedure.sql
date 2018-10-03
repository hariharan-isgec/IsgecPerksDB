USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlDetailsInsert]
  @TmtlID Int,
  @ProjectID NVarChar(6),
  @CustomerID NVarChar(6),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(2),
  @SendStatusID NVarChar(2),
  @SendRemarks NVarChar(250),
  @ReceiveStatusID NVarChar(2),
  @ReceivedRefNo NVarChar(250),
  @ReceivedRemarks NVarChar(250),
  @ReceivedOn DateTime,
  @ReceivedBy NVarChar(8),
  @Return_TmtlID Int = null OUTPUT
  AS
  INSERT [DCM_CustomerTmtlDetails]
  (
   [TmtlID]
  ,[ProjectID]
  ,[CustomerID]
  ,[DocumentID]
  ,[RevisionNo]
  ,[SendStatusID]
  ,[SendRemarks]
  ,[ReceiveStatusID]
  ,[ReceivedRefNo]
  ,[ReceivedRemarks]
  ,[ReceivedOn]
  ,[ReceivedBy]
  )
  VALUES
  (
   @TmtlID
  ,@ProjectID
  ,@CustomerID
  ,@DocumentID
  ,@RevisionNo
  ,@SendStatusID
  ,@SendRemarks
  ,@ReceiveStatusID
  ,@ReceivedRefNo
  ,@ReceivedRemarks
  ,@ReceivedOn
  ,@ReceivedBy
  )
  SET @Return_TmtlID = @TmtlID
GO
