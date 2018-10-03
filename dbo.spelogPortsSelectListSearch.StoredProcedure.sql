USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogPortsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,PortID Int NOT NULL
  )
  INSERT INTO #PageIndex (PortID)
  SELECT [ELOG_Ports].[PortID] FROM [ELOG_Ports]
 WHERE  
   ( 
         STR(ISNULL([ELOG_Ports].[PortID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_Ports].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'PortID' THEN [ELOG_Ports].[PortID] END,
     CASE @OrderBy WHEN 'PortID DESC' THEN [ELOG_Ports].[PortID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_Ports].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_Ports].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_Ports].*  
  FROM [ELOG_Ports] 
      INNER JOIN #PageIndex
          ON [ELOG_Ports].[PortID] = #PageIndex.PortID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
