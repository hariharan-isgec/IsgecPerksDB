USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_SiteDADelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_F_SiteDA]
  WHERE
  [TA_F_SiteDA].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
