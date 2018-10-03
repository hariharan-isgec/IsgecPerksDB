USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalTypesUpdate]
  @Original_TmtlTypeID NVarChar(2), 
  @TmtlTypeID NVarChar(2),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_TransmittalTypes] SET 
   [TmtlTypeID] = @TmtlTypeID
  ,[Description] = @Description
  WHERE
  [TmtlTypeID] = @Original_TmtlTypeID
  SET @RowCount = @@RowCount
GO
