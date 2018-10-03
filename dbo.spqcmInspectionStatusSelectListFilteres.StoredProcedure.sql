USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStatusSelectListFilteres]
  @Filter_InspectionStatusID Int,
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
 ,InspectionStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'InspectionStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_InspectionStatus].[InspectionStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_InspectionStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_InspectionStatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_InspectionStatus].[InspectionStatusID] = ' + STR(@Filter_InspectionStatusID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'InspectionStatusID' THEN '[QCM_InspectionStatus].[InspectionStatusID]'
                        WHEN 'InspectionStatusID DESC' THEN '[QCM_InspectionStatus].[InspectionStatusID] DESC'
                        WHEN 'Description' THEN '[QCM_InspectionStatus].[Description]'
                        WHEN 'Description DESC' THEN '[QCM_InspectionStatus].[Description] DESC'
                        ELSE '[QCM_InspectionStatus].[InspectionStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectionStatus].[InspectionStatusID] ,
		[QCM_InspectionStatus].[Description]  
  FROM [QCM_InspectionStatus] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectionStatus].[InspectionStatusID] = #PageIndex.InspectionStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
