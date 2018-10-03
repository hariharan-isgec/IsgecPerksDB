USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalTypesSelectListSearch]
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
 ,TmtlTypeID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (TmtlTypeID)
  SELECT [IDM_TransmittalTypes].[TmtlTypeID] FROM [IDM_TransmittalTypes]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_TransmittalTypes].[TmtlTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TmtlTypeID' THEN [IDM_TransmittalTypes].[TmtlTypeID] END,
     CASE @orderBy WHEN 'TmtlTypeID DESC' THEN [IDM_TransmittalTypes].[TmtlTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_TransmittalTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_TransmittalTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_TransmittalTypes].[TmtlTypeID] ,
		[IDM_TransmittalTypes].[Description]  
  FROM [IDM_TransmittalTypes] 
    	INNER JOIN #PageIndex
          ON [IDM_TransmittalTypes].[TmtlTypeID] = #PageIndex.TmtlTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
