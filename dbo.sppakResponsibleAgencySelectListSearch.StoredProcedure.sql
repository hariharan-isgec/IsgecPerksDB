USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgencySelectListSearch]
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
 ,ResponsibleAgencyID Int NOT NULL
  )
  INSERT INTO #PageIndex (ResponsibleAgencyID)
  SELECT [IDM_ResponsibleAgency].[ResponsibleAgencyID] FROM [IDM_ResponsibleAgency]
 WHERE  
   ( 
         STR(ISNULL([IDM_ResponsibleAgency].[ResponsibleAgencyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_ResponsibleAgency].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ResponsibleAgencyID' THEN [IDM_ResponsibleAgency].[ResponsibleAgencyID] END,
     CASE @OrderBy WHEN 'ResponsibleAgencyID DESC' THEN [IDM_ResponsibleAgency].[ResponsibleAgencyID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [IDM_ResponsibleAgency].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [IDM_ResponsibleAgency].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [IDM_ResponsibleAgency].*  
  FROM [IDM_ResponsibleAgency] 
      INNER JOIN #PageIndex
          ON [IDM_ResponsibleAgency].[ResponsibleAgencyID] = #PageIndex.ResponsibleAgencyID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
