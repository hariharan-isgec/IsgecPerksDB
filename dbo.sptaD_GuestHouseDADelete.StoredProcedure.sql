USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_GuestHouseDADelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_D_GuestHouseDA]
  WHERE
  [TA_D_GuestHouseDA].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
