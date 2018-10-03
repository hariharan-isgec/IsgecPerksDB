USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsDesignationsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,DesignationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DesignationID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Designations].[DesignationID]'
  SET @LGSQL = @LGSQL + ' FROM [HRM_Designations] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DesignationID' THEN '[HRM_Designations].[DesignationID]'
                        WHEN 'DesignationID DESC' THEN '[HRM_Designations].[DesignationID] DESC'
                        WHEN 'Description' THEN '[HRM_Designations].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Designations].[Description] DESC'
                        WHEN 'ShortName' THEN '[HRM_Designations].[ShortName]'
                        WHEN 'ShortName DESC' THEN '[HRM_Designations].[ShortName] DESC'
                        WHEN 'Sequence' THEN '[HRM_Designations].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[HRM_Designations].[Sequence] DESC'
                        ELSE '[HRM_Designations].[DesignationID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Designations].[DesignationID] ,
		[HRM_Designations].[Description] ,
		[HRM_Designations].[ShortName] ,
		[HRM_Designations].[Sequence]  
  FROM [HRM_Designations] 
    	INNER JOIN #PageIndex
          ON [HRM_Designations].[DesignationID] = #PageIndex.DesignationID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
