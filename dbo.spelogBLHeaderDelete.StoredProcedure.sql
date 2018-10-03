USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLHeaderDelete]
  @Original_BLID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_BLHeader]
  WHERE
  [ELOG_BLHeader].[BLID] = @Original_BLID
  SET @RowCount = @@RowCount
GO
