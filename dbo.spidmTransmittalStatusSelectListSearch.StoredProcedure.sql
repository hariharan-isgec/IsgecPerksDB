USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalStatusSelectListSearch]
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
 ,TmtlStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (TmtlStatusID)
  SELECT [IDM_TransmittalStatus].[TmtlStatusID] FROM [IDM_TransmittalStatus]
 WHERE  
   ( 
         STR(ISNULL([IDM_TransmittalStatus].[TmtlStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TmtlStatusID' THEN [IDM_TransmittalStatus].[TmtlStatusID] END,
     CASE @orderBy WHEN 'TmtlStatusID DESC' THEN [IDM_TransmittalStatus].[TmtlStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_TransmittalStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_TransmittalStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_TransmittalStatus].[TmtlStatusID] ,
		[IDM_TransmittalStatus].[Description]  
  FROM [IDM_TransmittalStatus] 
    	INNER JOIN #PageIndex
          ON [IDM_TransmittalStatus].[TmtlStatusID] = #PageIndex.TmtlStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
