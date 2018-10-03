USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmEMailGroupsDelete]
  @Original_EMailGroup NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_EMailGroups]
  WHERE
  [HRM_EMailGroups].[EMailGroup] = @Original_EMailGroup
  SET @RowCount = @@RowCount
GO
