USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrGroupsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_Groups].[GroupID] ,
		[VR_Groups].[GroupName]  
  FROM [VR_Groups] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [VR_Groups].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [VR_Groups].[GroupID] END DESC,
     CASE @OrderBy WHEN 'GroupName' THEN [VR_Groups].[GroupName] END,
     CASE @OrderBy WHEN 'GroupName DESC' THEN [VR_Groups].[GroupName] END DESC 
  SET @RecordCount = @@RowCount
GO
