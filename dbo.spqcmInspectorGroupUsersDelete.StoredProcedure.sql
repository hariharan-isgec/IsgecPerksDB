USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupUsersDelete]
  @Original_GroupID Int,
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_InspectorGroupUsers]
  WHERE
  [QCM_InspectorGroupUsers].[GroupID] = @Original_GroupID
  AND [QCM_InspectorGroupUsers].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
