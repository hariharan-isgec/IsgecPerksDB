USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapPurposeDelete]
  @Original_PurposeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QAP_Purpose]
  WHERE
  [QAP_Purpose].[PurposeID] = @Original_PurposeID
  SET @RowCount = @@RowCount
GO
