USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtImagesSelectListFilteres]
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
 ,ImageID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ImageID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[GRT_Images].[ImageID]'
  SET @LGSQL = @LGSQL + ' FROM [GRT_Images] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ImageID' THEN '[GRT_Images].[ImageID]'
                        WHEN 'ImageID DESC' THEN '[GRT_Images].[ImageID] DESC'
                        WHEN 'Description' THEN '[GRT_Images].[Description]'
                        WHEN 'Description DESC' THEN '[GRT_Images].[Description] DESC'
                        WHEN 'ImageFileName' THEN '[GRT_Images].[ImageFileName]'
                        WHEN 'ImageFileName DESC' THEN '[GRT_Images].[ImageFileName] DESC'
                        WHEN 'DiskFileName' THEN '[GRT_Images].[DiskFileName]'
                        WHEN 'DiskFileName DESC' THEN '[GRT_Images].[DiskFileName] DESC'
                        ELSE '[GRT_Images].[ImageID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[GRT_Images].[ImageID] ,
		[GRT_Images].[Description] ,
		[GRT_Images].[ImageFileName] ,
		[GRT_Images].[DiskFileName]  
  FROM [GRT_Images] 
    	INNER JOIN #PageIndex
          ON [GRT_Images].[ImageID] = #PageIndex.ImageID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
