USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtUnaccountedBillsUpdate]
  @Original_IRNo Int, 
  @CQReceived Bit,
  @CQRNo Int,
  @CQRDt DateTime,
  @StatusID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_IRDocs] SET 
   [CQReceived] = @CQReceived
  ,[CQRNo] = @CQRNo
  ,[CQRDt] = @CQRDt
  ,[StatusID] = @StatusID
  WHERE
  [IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
