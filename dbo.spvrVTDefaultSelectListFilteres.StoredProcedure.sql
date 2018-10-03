USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrVTDefaultSelectListFilteres]
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_VTDefault].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_VTDefault] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[VR_VTDefault].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_VTDefault].[SerialNo] DESC'
                        WHEN 'MinimumCapacityPercentage' THEN '[VR_VTDefault].[MinimumCapacityPercentage]'
                        WHEN 'MinimumCapacityPercentage DESC' THEN '[VR_VTDefault].[MinimumCapacityPercentage] DESC'
                        WHEN 'MaximumCapacityPercentage' THEN '[VR_VTDefault].[MaximumCapacityPercentage]'
                        WHEN 'MaximumCapacityPercentage DESC' THEN '[VR_VTDefault].[MaximumCapacityPercentage] DESC'
                        WHEN 'MinimumHeightPercentage' THEN '[VR_VTDefault].[MinimumHeightPercentage]'
                        WHEN 'MinimumHeightPercentage DESC' THEN '[VR_VTDefault].[MinimumHeightPercentage] DESC'
                        WHEN 'MinimumWidthPercentage' THEN '[VR_VTDefault].[MinimumWidthPercentage]'
                        WHEN 'MinimumWidthPercentage DESC' THEN '[VR_VTDefault].[MinimumWidthPercentage] DESC'
                        WHEN 'MinimumLengthPercentage' THEN '[VR_VTDefault].[MinimumLengthPercentage]'
                        WHEN 'MinimumLengthPercentage DESC' THEN '[VR_VTDefault].[MinimumLengthPercentage] DESC'
                        WHEN 'MaximumHeightPercentage' THEN '[VR_VTDefault].[MaximumHeightPercentage]'
                        WHEN 'MaximumHeightPercentage DESC' THEN '[VR_VTDefault].[MaximumHeightPercentage] DESC'
                        WHEN 'MaximumWidthPercentage' THEN '[VR_VTDefault].[MaximumWidthPercentage]'
                        WHEN 'MaximumWidthPercentage DESC' THEN '[VR_VTDefault].[MaximumWidthPercentage] DESC'
                        WHEN 'MaximumLengthPercentage' THEN '[VR_VTDefault].[MaximumLengthPercentage]'
                        WHEN 'MaximumLengthPercentage DESC' THEN '[VR_VTDefault].[MaximumLengthPercentage] DESC'
                        ELSE '[VR_VTDefault].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_VTDefault].[SerialNo] ,
		[VR_VTDefault].[MinimumCapacityPercentage] ,
		[VR_VTDefault].[MaximumCapacityPercentage] ,
		[VR_VTDefault].[MinimumHeightPercentage] ,
		[VR_VTDefault].[MinimumWidthPercentage] ,
		[VR_VTDefault].[MinimumLengthPercentage] ,
		[VR_VTDefault].[MaximumHeightPercentage] ,
		[VR_VTDefault].[MaximumWidthPercentage] ,
		[VR_VTDefault].[MaximumLengthPercentage]  
  FROM [VR_VTDefault] 
    	INNER JOIN #PageIndex
          ON [VR_VTDefault].[SerialNo] = #PageIndex.SerialNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
