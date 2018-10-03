USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalTypesDelete]
  @Original_TmtlTypeID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_TransmittalTypes]
  WHERE
  [IDM_TransmittalTypes].[TmtlTypeID] = @Original_TmtlTypeID
  SET @RowCount = @@RowCount
GO
