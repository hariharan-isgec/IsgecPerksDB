USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBIconsUpdate]
  @Original_DBIconID Int, 
  @IconName NVarChar(100),
  @IconStyle NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_DBIcons] SET 
   [IconName] = @IconName
  ,[IconStyle] = @IconStyle
  WHERE
  [DBIconID] = @Original_DBIconID
  SET @RowCount = @@RowCount
GO
