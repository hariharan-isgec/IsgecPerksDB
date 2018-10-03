USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveStatusUpdate]
  @Original_ReceiveStatusID NVarChar(3), 
  @ReceiveStatusID NVarChar(3),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_ReceiveStatus] SET 
   [ReceiveStatusID] = @ReceiveStatusID
  ,[Description] = @Description
  WHERE
  [ReceiveStatusID] = @Original_ReceiveStatusID
  SET @RowCount = @@RowCount
GO
