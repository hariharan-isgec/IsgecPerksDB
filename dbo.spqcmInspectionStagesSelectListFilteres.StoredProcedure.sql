USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStagesSelectListFilteres]
  @Filter_InspectionStageID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,InspectionStageID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'InspectionStageID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_InspectionStages].[InspectionStageID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_InspectionStages] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_InspectionStageID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_InspectionStages].[InspectionStageID] = ' + STR(@Filter_InspectionStageID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'InspectionStageID' THEN '[QCM_InspectionStages].[InspectionStageID]'
                        WHEN 'InspectionStageID DESC' THEN '[QCM_InspectionStages].[InspectionStageID] DESC'
                        WHEN 'Description' THEN '[QCM_InspectionStages].[Description]'
                        WHEN 'Description DESC' THEN '[QCM_InspectionStages].[Description] DESC'
                        ELSE '[QCM_InspectionStages].[InspectionStageID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectionStages].[InspectionStageID] ,
		[QCM_InspectionStages].[Description]  
  FROM [QCM_InspectionStages] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectionStages].[InspectionStageID] = #PageIndex.InspectionStageID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
