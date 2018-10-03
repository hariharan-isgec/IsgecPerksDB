USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmEMailGroupsUpdate]
  @Original_EMailGroup NVarChar(50), 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_EMailGroups] SET 
   [Description] = @Description
  WHERE
  [EMailGroup] = @Original_EMailGroup
  SET @RowCount = @@RowCount
GO
