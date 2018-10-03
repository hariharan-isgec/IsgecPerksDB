USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventTransactionsUpdate]
  @Original_EventID Int, 
  @EventDate DateTime,
  @CardNo NVarChar(8),
  @Description NVarChar(100),
  @Completed Bit,
  @CompletedOn DateTime,
  @Circular nText,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ITEventTransactions] SET 
   [EventDate] = @EventDate
  ,[CardNo] = @CardNo
  ,[Description] = @Description
  ,[Completed] = @Completed
  ,[CompletedOn] = @CompletedOn
  ,[Circular] = @Circular   
  WHERE
  [EventID] = @Original_EventID
  SET @RowCount = @@RowCount
GO
