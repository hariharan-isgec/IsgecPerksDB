USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmSendStatusUpdate]
  @Original_SendStatusID NVarChar(3), 
  @SendStatusID NVarChar(3),
  @Description NVarChar(50),
  @ReceivedBack Bit,
  @IsItForApproval Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_SendStatus] SET 
   [SendStatusID] = @SendStatusID
  ,[Description] = @Description
  ,[ReceivedBack] = @ReceivedBack
  ,[IsItForApproval] = @IsItForApproval
  WHERE
  [SendStatusID] = @Original_SendStatusID
  SET @RowCount = @@RowCount
GO
