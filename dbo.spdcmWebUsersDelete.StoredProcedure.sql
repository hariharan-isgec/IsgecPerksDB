USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmWebUsersDelete]
  @Original_UserID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_WebUsers]
  WHERE
  [DCM_WebUsers].[UserID] = @Original_UserID
  SET @RowCount = @@RowCount
GO
