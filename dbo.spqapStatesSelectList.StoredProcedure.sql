USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_States].[StatusID] ,
		[QAP_States].[QAPStatus]  
  FROM [QAP_States] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_States].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_States].[StatusID] END DESC,
     CASE @OrderBy WHEN 'QAPStatus' THEN [QAP_States].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAPStatus DESC' THEN [QAP_States].[QAPStatus] END DESC 
  SET @RecordCount = @@RowCount
GO
