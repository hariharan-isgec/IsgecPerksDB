USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwLGPageSizeUpdate]
  @Original_PageID Int, 
  @LoginID NVarChar(20),
  @PageName NVarChar(250),
  @ApplicationID Int,
  @PageSize Int,
  @PageNo Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_LGPageSize] SET 
   [LoginID] = @LoginID
  ,[PageName] = @PageName
  ,[ApplicationID] = @ApplicationID
  ,[PageSize] = @PageSize
  ,[PageNo] = @PageNo
  WHERE
  [PageID] = @Original_PageID
  SET @RowCount = @@RowCount
GO
