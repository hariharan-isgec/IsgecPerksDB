USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPsDelete]
  @Original_ProjectID NVarChar(6),
  @Original_CLPID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_CLPs]
  WHERE
  [TOS_CLPs].[ProjectID] = @Original_ProjectID
  AND [TOS_CLPs].[CLPID] = @Original_CLPID
  SET @RowCount = @@RowCount
GO
