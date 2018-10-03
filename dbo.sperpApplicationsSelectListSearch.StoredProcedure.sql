USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpApplicationsSelectListSearch]
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
 ,ApplID Int NOT NULL
  )
  INSERT INTO #PageIndex (ApplID)
  SELECT [ERP_Applications].[ApplID] FROM [ERP_Applications]
 WHERE  
   ( 
         STR(ISNULL([ERP_Applications].[ApplID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_Applications].[ApplName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ApplID' THEN [ERP_Applications].[ApplID] END,
     CASE @OrderBy WHEN 'ApplID DESC' THEN [ERP_Applications].[ApplID] END DESC,
     CASE @OrderBy WHEN 'ApplName' THEN [ERP_Applications].[ApplName] END,
     CASE @OrderBy WHEN 'ApplName DESC' THEN [ERP_Applications].[ApplName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_Applications].[ApplID] ,
		[ERP_Applications].[ApplName]  
  FROM [ERP_Applications] 
    	INNER JOIN #PageIndex
          ON [ERP_Applications].[ApplID] = #PageIndex.ApplID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
