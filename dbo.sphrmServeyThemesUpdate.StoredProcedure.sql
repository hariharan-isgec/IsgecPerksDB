USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemesUpdate]
  @Description NVarChar(50),
  @Details NVarChar(100),
  @ServeyID Int,
  @Original_ThemeID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_ServeyThemes] SET 
   [Description] = @Description
  ,[Details] = @Details
  ,[ServeyID] = @ServeyID
  WHERE
  [ThemeID] = @Original_ThemeID
  SET @RowCount = @@RowCount
GO
