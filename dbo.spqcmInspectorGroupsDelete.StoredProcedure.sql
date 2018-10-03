USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupsDelete]
  @Original_GroupID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_InspectorGroups]
  WHERE
  [QCM_InspectorGroups].[GroupID] = @Original_GroupID
  SET @RowCount = @@RowCount
GO
