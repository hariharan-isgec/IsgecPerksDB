USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmReceivingMediumsDelete]
  @Original_ReceivingMediumID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_ReceivingMediums]
  WHERE
  [QCM_ReceivingMediums].[ReceivingMediumID] = @Original_ReceivingMediumID
  SET @RowCount = @@RowCount
GO
