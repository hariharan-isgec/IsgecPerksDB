USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeySheetsUpdate]
  @ServeyID Int,
  @Description NVarChar(50),
  @Original_ServeySheetID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_ServeySheets] SET 
   [ServeyID] = @ServeyID
  ,[Description] = @Description
  WHERE
  [ServeySheetID] = @Original_ServeySheetID
  SET @RowCount = @@RowCount
GO
