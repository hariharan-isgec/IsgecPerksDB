USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmBloodGroupsUpdate]
  @Description NVarChar(30),
  @Original_BloodGroupID NVarChar(5), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_BloodGroups] SET 
   [Description] = @Description
  WHERE
  [BloodGroupID] = @Original_BloodGroupID
  SET @RowCount = @@RowCount
GO
