USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTDelete]
  @Original_TmtlID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_Transmittal]
  WHERE
  [IDM_Transmittal].[TmtlID] = @Original_TmtlID
  SET @RowCount = @@RowCount
GO
