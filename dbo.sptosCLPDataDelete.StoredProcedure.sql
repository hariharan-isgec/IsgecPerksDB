USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataDelete]
  @Original_ProjectID NVarChar(6),
  @Original_ProgressID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_CLPData]
  WHERE
  [TOS_CLPData].[ProjectID] = @Original_ProjectID
  AND [TOS_CLPData].[ProgressID] = @Original_ProgressID
  SET @RowCount = @@RowCount
GO
