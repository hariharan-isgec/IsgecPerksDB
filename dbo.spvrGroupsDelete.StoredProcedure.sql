USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrGroupsDelete]
  @Original_GroupID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_Groups]
  WHERE
  [VR_Groups].[GroupID] = @Original_GroupID
  SET @RowCount = @@RowCount
GO
