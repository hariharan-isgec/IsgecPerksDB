USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtGreetingsUpdate]
  @Original_UserID NVarChar(8), 
  @Original_SerialNo Int, 
  @UserID NVarChar(8),
  @ToEmailID NVarChar(100),
  @ToName NVarChar(100),
  @SentOn DateTime,
  @UsingGreetingID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [GRT_Greetings] SET 
   [UserID] = @UserID
  ,[ToEmailID] = @ToEmailID
  ,[ToName] = @ToName
  ,[SentOn] = @SentOn
  ,[UsingGreetingID] = @UsingGreetingID
  WHERE
  [UserID] = @Original_UserID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
