USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscCommitteesDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SC_Committees]
  WHERE
  [SC_Committees].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
