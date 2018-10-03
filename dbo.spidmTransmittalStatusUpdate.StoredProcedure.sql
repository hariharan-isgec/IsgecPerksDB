USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalStatusUpdate]
  @Original_TmtlStatusID Int, 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_TransmittalStatus] SET 
   [Description] = @Description
  WHERE
  [TmtlStatusID] = @Original_TmtlStatusID
  SET @RowCount = @@RowCount
GO
