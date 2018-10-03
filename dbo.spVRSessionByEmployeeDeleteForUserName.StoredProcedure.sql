USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spVRSessionByEmployeeDeleteForUserName]
  @UserName NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRSessionByEmployee]
  WHERE
  [SYS_VRSessionByEmployee].[UserName] = @UserName
  SET @RowCount = @@RowCount
GO
