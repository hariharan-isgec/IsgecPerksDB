USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmReceivingMediumsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_ReceivingMediums].[ReceivingMediumID] ,
		[QCM_ReceivingMediums].[Description]  
  FROM [QCM_ReceivingMediums] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ReceivingMediumID' THEN [QCM_ReceivingMediums].[ReceivingMediumID] END,
     CASE @OrderBy WHEN 'ReceivingMediumID DESC' THEN [QCM_ReceivingMediums].[ReceivingMediumID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_ReceivingMediums].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_ReceivingMediums].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
