USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRApplicationsUpdate]
  @Description NVarChar(100),
  @WebPath NVarChar(250),
  @Original_ApplicationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_Applications] SET 
   [Description] = @Description
  ,[WebPath] = @WebPath
  WHERE
  [ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
