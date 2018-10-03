USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappApplicationsUpdate]
  @Original_AppID Int, 
  @ApplicationName NVarChar(50),
  @ApplicationDescription NVarChar(250),
  @IsActive Bit,
  @MainPageURL NVarChar(500),
  @AppIconID Int,
  @AppIconStyle NVarChar(500),
  @RowCount int = null OUTPUT
  AS
  UPDATE [MAPP_Applications] SET 
   [ApplicationName] = @ApplicationName
  ,[ApplicationDescription] = @ApplicationDescription
  ,[IsActive] = @IsActive
  ,[MainPageURL] = @MainPageURL
  ,[AppIconID] = @AppIconID
  ,[AppIconStyle] = @AppIconStyle
  WHERE
  [AppID] = @Original_AppID
  SET @RowCount = @@RowCount
GO
