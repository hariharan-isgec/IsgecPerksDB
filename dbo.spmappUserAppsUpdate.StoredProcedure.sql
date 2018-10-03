USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappUserAppsUpdate]
  @Original_AppID Int, 
  @Original_UserID NVarChar(8), 
  @AppID Int,
  @UserID NVarChar(8),
  @IsActive Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [MAPP_UserApps] SET 
   [AppID] = @AppID
  ,[UserID] = @UserID
  ,[IsActive] = @IsActive
  WHERE
  [AppID] = @Original_AppID
  AND [UserID] = @Original_UserID
  SET @RowCount = @@RowCount
GO
