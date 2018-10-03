USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOutlookProgressDelete]
  @Original_ProjectID NVarChar(6),
  @Original_ProgressID Int,
  @Original_CLPID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_CLPDataDetails]
  WHERE
  [TOS_CLPDataDetails].[ProjectID] = @Original_ProjectID
  AND [TOS_CLPDataDetails].[ProgressID] = @Original_ProgressID
  AND [TOS_CLPDataDetails].[CLPID] = @Original_CLPID
  SET @RowCount = @@RowCount
GO
