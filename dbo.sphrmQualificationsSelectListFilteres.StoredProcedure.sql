USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmQualificationsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  QualificationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (QualificationID) ' + 
               'SELECT [HRM_Qualifications].[QualificationID] FROM [HRM_Qualifications] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'QualificationID' THEN '[HRM_Qualifications].[QualificationID]'
                        WHEN 'QualificationID DESC' THEN '[HRM_Qualifications].[QualificationID] DESC'
                        WHEN 'Description' THEN '[HRM_Qualifications].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Qualifications].[Description] DESC'
                        ELSE '[HRM_Qualifications].[QualificationID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Qualifications].[QualificationID],
		[HRM_Qualifications].[Description] 
  FROM [HRM_Qualifications] 
    	INNER JOIN #PageIndex
          ON [HRM_Qualifications].[QualificationID] = #PageIndex.QualificationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
