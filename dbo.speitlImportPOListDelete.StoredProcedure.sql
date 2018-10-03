USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlImportPOListDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_POList]
  WHERE
  [EITL_POList].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
