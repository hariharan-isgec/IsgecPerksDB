USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscProjectDelete]
  @Original_RequestID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SC_Project]
  WHERE
  [SC_Project].[RequestID] = @Original_RequestID
  AND [SC_Project].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
