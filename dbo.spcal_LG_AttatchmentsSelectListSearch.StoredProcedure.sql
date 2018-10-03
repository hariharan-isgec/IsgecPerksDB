USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spcal_LG_AttatchmentsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @CallID int, 
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CallID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (CallID, SerialNo)
  SELECT [CAL_Attatchments].[CallID], [CAL_Attatchments].[SerialNo] FROM [CAL_Attatchments]
  INNER JOIN [CAL_Register] AS [CAL_Register1]
    ON [CAL_Attatchments].[CallID] = [CAL_Register1].[CallID]
 WHERE  [CAL_Attatchments].[CallID] = @CallID
     AND ( 
         STR(ISNULL([CAL_Attatchments].[CallID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([CAL_Attatchments].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Attatchments].[AttatchmentName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Attatchments].[DiskFileName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallID' THEN [CAL_Attatchments].[CallID] END,
     CASE @orderBy WHEN 'CallID DESC' THEN [CAL_Attatchments].[CallID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [CAL_Attatchments].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [CAL_Attatchments].[SerialNo] END DESC,
     CASE @orderBy WHEN 'AttatchmentName' THEN [CAL_Attatchments].[AttatchmentName] END,
     CASE @orderBy WHEN 'AttatchmentName DESC' THEN [CAL_Attatchments].[AttatchmentName] END DESC,
     CASE @orderBy WHEN 'DiskFileName' THEN [CAL_Attatchments].[DiskFileName] END,
     CASE @orderBy WHEN 'DiskFileName DESC' THEN [CAL_Attatchments].[DiskFileName] END DESC,
     CASE @orderBy WHEN 'IsImage' THEN [CAL_Attatchments].[IsImage] END,
     CASE @orderBy WHEN 'IsImage DESC' THEN [CAL_Attatchments].[IsImage] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[CAL_Attatchments].[CallID] ,
		[CAL_Attatchments].[SerialNo] ,
		[CAL_Attatchments].[AttatchmentName] ,
		[CAL_Attatchments].[DiskFileName] ,
		[CAL_Attatchments].[IsImage]  
  FROM [CAL_Attatchments] 
    	INNER JOIN #PageIndex
          ON [CAL_Attatchments].[CallID] = #PageIndex.CallID
          AND [CAL_Attatchments].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [CAL_Register] AS [CAL_Register1]
    ON [CAL_Attatchments].[CallID] = [CAL_Register1].[CallID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
