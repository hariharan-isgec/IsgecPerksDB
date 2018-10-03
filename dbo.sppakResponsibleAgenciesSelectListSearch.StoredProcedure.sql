USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgenciesSelectListSearch]
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
  SELECT [PAK_ResponsibleAgencies].[ResponsibleAgencyID] FROM [PAK_ResponsibleAgencies]
 WHERE  
   ( 
         STR(ISNULL([PAK_ResponsibleAgencies].[ResponsibleAgencyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_ResponsibleAgencies].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ResponsibleAgencyID' THEN [PAK_ResponsibleAgencies].[ResponsibleAgencyID] END,
     CASE @OrderBy WHEN 'ResponsibleAgencyID DESC' THEN [PAK_ResponsibleAgencies].[ResponsibleAgencyID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_ResponsibleAgencies].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_ResponsibleAgencies].[Description] END DESC,
     CASE @OrderBy WHEN 'ExternalAgency' THEN [PAK_ResponsibleAgencies].[ExternalAgency] END,
     CASE @OrderBy WHEN 'ExternalAgency DESC' THEN [PAK_ResponsibleAgencies].[ExternalAgency] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_ResponsibleAgencies].*  
  FROM [PAK_ResponsibleAgencies] 
      INNER JOIN #PageIndex
          ON [PAK_ResponsibleAgencies].[ResponsibleAgencyID] = #PageIndex.ResponsibleAgencyID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
