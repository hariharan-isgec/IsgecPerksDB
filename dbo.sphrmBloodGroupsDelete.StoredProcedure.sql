USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmBloodGroupsDelete]
  @Original_BloodGroupID NVarChar(5),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_BloodGroups]
  WHERE
  [HRM_BloodGroups].[BloodGroupID] = @Original_BloodGroupID
  SET @RowCount = @@RowCount
GO
