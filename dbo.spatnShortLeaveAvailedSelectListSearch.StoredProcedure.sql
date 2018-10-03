USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnShortLeaveAvailedSelectListSearch]
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
  SELECT [ATNv_ShortLeaveAvailed].[AttenID] FROM [ATNv_ShortLeaveAvailed]
 WHERE  
   ( 
         STR(ISNULL([ATNv_ShortLeaveAvailed].[AttenID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_ShortLeaveAvailed].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_ShortLeaveAvailed].[Punch1Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_ShortLeaveAvailed].[Punch2Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_ShortLeaveAvailed].[difmin], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_ShortLeaveAvailed].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_ShortLeaveAvailed].[Designation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_ShortLeaveAvailed].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_ShortLeaveAvailed].[Division],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_ShortLeaveAvailed].[Location],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'AttenID' THEN [ATNv_ShortLeaveAvailed].[AttenID] END,
     CASE @OrderBy WHEN 'AttenID DESC' THEN [ATNv_ShortLeaveAvailed].[AttenID] END DESC,
     CASE @OrderBy WHEN 'AttenDate' THEN [ATNv_ShortLeaveAvailed].[AttenDate] END,
     CASE @OrderBy WHEN 'AttenDate DESC' THEN [ATNv_ShortLeaveAvailed].[AttenDate] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [ATNv_ShortLeaveAvailed].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [ATNv_ShortLeaveAvailed].[CardNo] END DESC,
     CASE @OrderBy WHEN 'Punch1Time' THEN [ATNv_ShortLeaveAvailed].[Punch1Time] END,
     CASE @OrderBy WHEN 'Punch1Time DESC' THEN [ATNv_ShortLeaveAvailed].[Punch1Time] END DESC,
     CASE @OrderBy WHEN 'Punch2Time' THEN [ATNv_ShortLeaveAvailed].[Punch2Time] END,
     CASE @OrderBy WHEN 'Punch2Time DESC' THEN [ATNv_ShortLeaveAvailed].[Punch2Time] END DESC,
     CASE @OrderBy WHEN 'p1t' THEN [ATNv_ShortLeaveAvailed].[p1t] END,
     CASE @OrderBy WHEN 'p1t DESC' THEN [ATNv_ShortLeaveAvailed].[p1t] END DESC,
     CASE @OrderBy WHEN 'p2t' THEN [ATNv_ShortLeaveAvailed].[p2t] END,
     CASE @OrderBy WHEN 'p2t DESC' THEN [ATNv_ShortLeaveAvailed].[p2t] END DESC,
     CASE @OrderBy WHEN 'difmin' THEN [ATNv_ShortLeaveAvailed].[difmin] END,
     CASE @OrderBy WHEN 'difmin DESC' THEN [ATNv_ShortLeaveAvailed].[difmin] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [ATNv_ShortLeaveAvailed].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [ATNv_ShortLeaveAvailed].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'Designation' THEN [ATNv_ShortLeaveAvailed].[Designation] END,
     CASE @OrderBy WHEN 'Designation DESC' THEN [ATNv_ShortLeaveAvailed].[Designation] END DESC,
     CASE @OrderBy WHEN 'Department' THEN [ATNv_ShortLeaveAvailed].[Department] END,
     CASE @OrderBy WHEN 'Department DESC' THEN [ATNv_ShortLeaveAvailed].[Department] END DESC,
     CASE @OrderBy WHEN 'Division' THEN [ATNv_ShortLeaveAvailed].[Division] END,
     CASE @OrderBy WHEN 'Division DESC' THEN [ATNv_ShortLeaveAvailed].[Division] END DESC,
     CASE @OrderBy WHEN 'Location' THEN [ATNv_ShortLeaveAvailed].[Location] END,
     CASE @OrderBy WHEN 'Location DESC' THEN [ATNv_ShortLeaveAvailed].[Location] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATNv_ShortLeaveAvailed].[AttenID] ,
		[ATNv_ShortLeaveAvailed].[AttenDate] ,
		[ATNv_ShortLeaveAvailed].[CardNo] ,
		[ATNv_ShortLeaveAvailed].[Punch1Time] ,
		[ATNv_ShortLeaveAvailed].[Punch2Time] ,
		[ATNv_ShortLeaveAvailed].[p1t] ,
		[ATNv_ShortLeaveAvailed].[p2t] ,
		[ATNv_ShortLeaveAvailed].[difmin] ,
		[ATNv_ShortLeaveAvailed].[EmployeeName] ,
		[ATNv_ShortLeaveAvailed].[Designation] ,
		[ATNv_ShortLeaveAvailed].[Department] ,
		[ATNv_ShortLeaveAvailed].[Division] ,
		[ATNv_ShortLeaveAvailed].[Location]  
  FROM [ATNv_ShortLeaveAvailed] 
    	INNER JOIN #PageIndex
          ON [ATNv_ShortLeaveAvailed].[AttenID] = #PageIndex.AttenID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
