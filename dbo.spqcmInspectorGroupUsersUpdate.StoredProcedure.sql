USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupUsersUpdate]
  @Original_GroupID Int, 
  @Original_CardNo NVarChar(8), 
  @GroupID Int,
  @CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_InspectorGroupUsers] SET 
   [GroupID] = @GroupID
  ,[CardNo] = @CardNo
  WHERE
  [GroupID] = @Original_GroupID
  AND [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
