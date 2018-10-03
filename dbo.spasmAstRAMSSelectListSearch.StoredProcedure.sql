USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstRAMSSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,RAMID NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (RAMID)
  SELECT [ASM_AstRAMS].[RAMID] FROM [ASM_AstRAMS]
 WHERE  
   ( 
         LOWER(ISNULL([ASM_AstRAMS].[RAMID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstRAMS].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RAMID' THEN [ASM_AstRAMS].[RAMID] END,
     CASE @orderBy WHEN 'RAMID DESC' THEN [ASM_AstRAMS].[RAMID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstRAMS].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstRAMS].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstRAMS].[RAMID],
		[ASM_AstRAMS].[Description] 
  FROM [ASM_AstRAMS] 
    	INNER JOIN #PageIndex
          ON [ASM_AstRAMS].[RAMID] = #PageIndex.RAMID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
