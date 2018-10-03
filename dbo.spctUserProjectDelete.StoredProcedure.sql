USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserProjectDelete]
  @Original_UserID NVarChar(8),
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [CT_UserProject]
  WHERE
  [CT_UserProject].[UserID] = @Original_UserID
  AND [CT_UserProject].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
