USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosFunctionalAreaSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TOS_FunctionalArea].[FunctionalAreaID] ,
		[TOS_FunctionalArea].[Description]  
  FROM [TOS_FunctionalArea] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'FunctionalAreaID' THEN [TOS_FunctionalArea].[FunctionalAreaID] END,
     CASE @OrderBy WHEN 'FunctionalAreaID DESC' THEN [TOS_FunctionalArea].[FunctionalAreaID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_FunctionalArea].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_FunctionalArea].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
