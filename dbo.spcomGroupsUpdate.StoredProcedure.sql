USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupsUpdate]
  @Original_GroupID NVarChar(6), 
  @GroupID NVarChar(6),
  @Description NVarChar(50),
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_Groups] SET 
   [GroupID] = @GroupID
  ,[Description] = @Description
  ,[Active] = @Active
  WHERE
  [GroupID] = @Original_GroupID
  SET @RowCount = @@RowCount
GO
