USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtIsgecGSTINSelectListSearch]
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
 ,GSTID Int NOT NULL
  )
  INSERT INTO #PageIndex (GSTID)
  SELECT [SPMT_IsgecGSTIN].[GSTID] FROM [SPMT_IsgecGSTIN]
 WHERE  
   ( 
         STR(ISNULL([SPMT_IsgecGSTIN].[GSTID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_IsgecGSTIN].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_IsgecGSTIN].[State],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GSTID' THEN [SPMT_IsgecGSTIN].[GSTID] END,
     CASE @OrderBy WHEN 'GSTID DESC' THEN [SPMT_IsgecGSTIN].[GSTID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_IsgecGSTIN].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_IsgecGSTIN].[Description] END DESC,
     CASE @OrderBy WHEN 'State' THEN [SPMT_IsgecGSTIN].[State] END,
     CASE @OrderBy WHEN 'State DESC' THEN [SPMT_IsgecGSTIN].[State] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_IsgecGSTIN].*  
  FROM [SPMT_IsgecGSTIN] 
      INNER JOIN #PageIndex
          ON [SPMT_IsgecGSTIN].[GSTID] = #PageIndex.GSTID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
