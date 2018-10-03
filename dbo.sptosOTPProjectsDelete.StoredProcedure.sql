USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPProjectsDelete]
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_Projects]
  WHERE
  [TOS_Projects].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
