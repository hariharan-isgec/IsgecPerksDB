USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrGroupsSelectListFilteres]
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
 ,GroupID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GroupID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_Groups].[GroupID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_Groups] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GroupID' THEN '[VR_Groups].[GroupID]'
                        WHEN 'GroupID DESC' THEN '[VR_Groups].[GroupID] DESC'
                        WHEN 'GroupName' THEN '[VR_Groups].[GroupName]'
                        WHEN 'GroupName DESC' THEN '[VR_Groups].[GroupName] DESC'
                        ELSE '[VR_Groups].[GroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_Groups].[GroupID] ,
		[VR_Groups].[GroupName]  
  FROM [VR_Groups] 
    	INNER JOIN #PageIndex
          ON [VR_Groups].[GroupID] = #PageIndex.GroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
