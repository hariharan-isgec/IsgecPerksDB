USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrODCReasonsSelectListFilteres]
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
 ,ReasonID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReasonID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_ODCReasons].[ReasonID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_ODCReasons] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReasonID' THEN '[VR_ODCReasons].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[VR_ODCReasons].[ReasonID] DESC'
                        WHEN 'Description' THEN '[VR_ODCReasons].[Description]'
                        WHEN 'Description DESC' THEN '[VR_ODCReasons].[Description] DESC'
                        ELSE '[VR_ODCReasons].[ReasonID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_ODCReasons].[ReasonID] ,
		[VR_ODCReasons].[Description]  
  FROM [VR_ODCReasons] 
    	INNER JOIN #PageIndex
          ON [VR_ODCReasons].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
