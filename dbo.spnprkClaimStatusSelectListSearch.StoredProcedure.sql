USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkClaimStatusSelectListSearch]
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
 ,ClaimStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (ClaimStatusID)
  SELECT [PRK_ClaimStatus].[ClaimStatusID] FROM [PRK_ClaimStatus]
 WHERE  
   ( 
         STR(ISNULL([PRK_ClaimStatus].[ClaimStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_ClaimStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ClaimStatusID' THEN [PRK_ClaimStatus].[ClaimStatusID] END,
     CASE @OrderBy WHEN 'ClaimStatusID DESC' THEN [PRK_ClaimStatus].[ClaimStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_ClaimStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_ClaimStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_ClaimStatus].*  
  FROM [PRK_ClaimStatus] 
      INNER JOIN #PageIndex
          ON [PRK_ClaimStatus].[ClaimStatusID] = #PageIndex.ClaimStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
