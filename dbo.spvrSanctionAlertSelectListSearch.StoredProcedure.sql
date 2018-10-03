USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrSanctionAlertSelectListSearch]
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
 ,ProjectID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID)
  SELECT [VR_SanctionAlert].[ProjectID] FROM [VR_SanctionAlert]
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [VR_SanctionAlert].[ProjectID] = [IDM_Projects1].[ProjectID]
 WHERE  
   ( 
         LOWER(ISNULL([VR_SanctionAlert].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_SanctionAlert].[EMailIDs],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [VR_SanctionAlert].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [VR_SanctionAlert].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'At60' THEN [VR_SanctionAlert].[At60] END,
     CASE @OrderBy WHEN 'At60 DESC' THEN [VR_SanctionAlert].[At60] END DESC,
     CASE @OrderBy WHEN 'At70' THEN [VR_SanctionAlert].[At70] END,
     CASE @OrderBy WHEN 'At70 DESC' THEN [VR_SanctionAlert].[At70] END DESC,
     CASE @OrderBy WHEN 'At80' THEN [VR_SanctionAlert].[At80] END,
     CASE @OrderBy WHEN 'At80 DESC' THEN [VR_SanctionAlert].[At80] END DESC,
     CASE @OrderBy WHEN 'At90' THEN [VR_SanctionAlert].[At90] END,
     CASE @OrderBy WHEN 'At90 DESC' THEN [VR_SanctionAlert].[At90] END DESC,
     CASE @OrderBy WHEN 'At95' THEN [VR_SanctionAlert].[At95] END,
     CASE @OrderBy WHEN 'At95 DESC' THEN [VR_SanctionAlert].[At95] END DESC,
     CASE @OrderBy WHEN 'At96' THEN [VR_SanctionAlert].[At96] END,
     CASE @OrderBy WHEN 'At96 DESC' THEN [VR_SanctionAlert].[At96] END DESC,
     CASE @OrderBy WHEN 'At97' THEN [VR_SanctionAlert].[At97] END,
     CASE @OrderBy WHEN 'At97 DESC' THEN [VR_SanctionAlert].[At97] END DESC,
     CASE @OrderBy WHEN 'At98' THEN [VR_SanctionAlert].[At98] END,
     CASE @OrderBy WHEN 'At98 DESC' THEN [VR_SanctionAlert].[At98] END DESC,
     CASE @OrderBy WHEN 'At99' THEN [VR_SanctionAlert].[At99] END,
     CASE @OrderBy WHEN 'At99 DESC' THEN [VR_SanctionAlert].[At99] END DESC,
     CASE @OrderBy WHEN 'EMailIDs' THEN [VR_SanctionAlert].[EMailIDs] END,
     CASE @OrderBy WHEN 'EMailIDs DESC' THEN [VR_SanctionAlert].[EMailIDs] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_SanctionAlert].[ProjectID] ,
		[VR_SanctionAlert].[At60] ,
		[VR_SanctionAlert].[At70] ,
		[VR_SanctionAlert].[At80] ,
		[VR_SanctionAlert].[At90] ,
		[VR_SanctionAlert].[At95] ,
		[VR_SanctionAlert].[At96] ,
		[VR_SanctionAlert].[At97] ,
		[VR_SanctionAlert].[At98] ,
		[VR_SanctionAlert].[At99] ,
		[VR_SanctionAlert].[EMailIDs] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description 
  FROM [VR_SanctionAlert] 
    	INNER JOIN #PageIndex
          ON [VR_SanctionAlert].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [VR_SanctionAlert].[ProjectID] = [IDM_Projects1].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
