USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmReceivingMediumsUpdate]
  @Original_ReceivingMediumID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_ReceivingMediums] SET 
   [Description] = @Description
  WHERE
  [ReceivingMediumID] = @Original_ReceivingMediumID
  SET @RowCount = @@RowCount
GO
