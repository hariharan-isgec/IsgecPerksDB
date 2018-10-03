USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRPageSizeUpdate]
  @LoginID NVarChar(20),
  @PageName NVarChar(250),
  @PageSize Int,
  @PageNo Int,
  @ApplicationID Int,
  @Original_PageID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_LGPageSize] SET 
   [LoginID] = @LoginID
  ,[PageName] = @PageName
  ,[PageSize] = @PageSize
  ,[PageNo] = @PageNo
  ,[ApplicationID] = @ApplicationID
  WHERE
  [PageID] = @Original_PageID
  SET @RowCount = @@RowCount
GO
