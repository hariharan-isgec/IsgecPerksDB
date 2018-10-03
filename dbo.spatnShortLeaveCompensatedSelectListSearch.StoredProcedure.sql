USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnShortLeaveCompensatedSelectListSearch]
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
 ,AttenID Int NOT NULL
  )
  INSERT INTO #PageIndex (AttenID)
  SELECT [ATNv_ShortLeaveCompensated].[AttenID] FROM [ATNv_ShortLeaveCompensated]
 WHERE  
   ( 
         STR(ISNULL([ATNv_ShortLeaveCompensated].[AttenID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_ShortLeaveCompensated].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_ShortLeaveCompensated].[Punch1Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_ShortLeaveCompensated].[Punch2Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_ShortLeaveCompensated].[difmin], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'AttenID' THEN [ATNv_ShortLeaveCompensated].[AttenID] END,
     CASE @OrderBy WHEN 'AttenID DESC' THEN [ATNv_ShortLeaveCompensated].[AttenID] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [ATNv_ShortLeaveCompensated].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [ATNv_ShortLeaveCompensated].[CardNo] END DESC,
     CASE @OrderBy WHEN 'AttenDate' THEN [ATNv_ShortLeaveCompensated].[AttenDate] END,
     CASE @OrderBy WHEN 'AttenDate DESC' THEN [ATNv_ShortLeaveCompensated].[AttenDate] END DESC,
     CASE @OrderBy WHEN 'Punch1Time' THEN [ATNv_ShortLeaveCompensated].[Punch1Time] END,
     CASE @OrderBy WHEN 'Punch1Time DESC' THEN [ATNv_ShortLeaveCompensated].[Punch1Time] END DESC,
     CASE @OrderBy WHEN 'Punch2Time' THEN [ATNv_ShortLeaveCompensated].[Punch2Time] END,
     CASE @OrderBy WHEN 'Punch2Time DESC' THEN [ATNv_ShortLeaveCompensated].[Punch2Time] END DESC,
     CASE @OrderBy WHEN 'p1t' THEN [ATNv_ShortLeaveCompensated].[p1t] END,
     CASE @OrderBy WHEN 'p1t DESC' THEN [ATNv_ShortLeaveCompensated].[p1t] END DESC,
     CASE @OrderBy WHEN 'p2t' THEN [ATNv_ShortLeaveCompensated].[p2t] END,
     CASE @OrderBy WHEN 'p2t DESC' THEN [ATNv_ShortLeaveCompensated].[p2t] END DESC,
     CASE @OrderBy WHEN 'difmin' THEN [ATNv_ShortLeaveCompensated].[difmin] END,
     CASE @OrderBy WHEN 'difmin DESC' THEN [ATNv_ShortLeaveCompensated].[difmin] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATNv_ShortLeaveCompensated].[AttenID] ,
		[ATNv_ShortLeaveCompensated].[CardNo] ,
		[ATNv_ShortLeaveCompensated].[AttenDate] ,
		[ATNv_ShortLeaveCompensated].[Punch1Time] ,
		[ATNv_ShortLeaveCompensated].[Punch2Time] ,
		[ATNv_ShortLeaveCompensated].[p1t] ,
		[ATNv_ShortLeaveCompensated].[p2t] ,
		[ATNv_ShortLeaveCompensated].[difmin]  
  FROM [ATNv_ShortLeaveCompensated] 
    	INNER JOIN #PageIndex
          ON [ATNv_ShortLeaveCompensated].[AttenID] = #PageIndex.AttenID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
