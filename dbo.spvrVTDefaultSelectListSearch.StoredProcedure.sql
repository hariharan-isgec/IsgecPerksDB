USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrVTDefaultSelectListSearch]
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
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [VR_VTDefault].[SerialNo] FROM [VR_VTDefault]
 WHERE  
   ( 
         STR(ISNULL([VR_VTDefault].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VTDefault].[MinimumCapacityPercentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VTDefault].[MaximumCapacityPercentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VTDefault].[MinimumHeightPercentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VTDefault].[MinimumWidthPercentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VTDefault].[MinimumLengthPercentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VTDefault].[MaximumHeightPercentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VTDefault].[MaximumWidthPercentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VTDefault].[MaximumLengthPercentage], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_VTDefault].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_VTDefault].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'MinimumCapacityPercentage' THEN [VR_VTDefault].[MinimumCapacityPercentage] END,
     CASE @OrderBy WHEN 'MinimumCapacityPercentage DESC' THEN [VR_VTDefault].[MinimumCapacityPercentage] END DESC,
     CASE @OrderBy WHEN 'MaximumCapacityPercentage' THEN [VR_VTDefault].[MaximumCapacityPercentage] END,
     CASE @OrderBy WHEN 'MaximumCapacityPercentage DESC' THEN [VR_VTDefault].[MaximumCapacityPercentage] END DESC,
     CASE @OrderBy WHEN 'MinimumHeightPercentage' THEN [VR_VTDefault].[MinimumHeightPercentage] END,
     CASE @OrderBy WHEN 'MinimumHeightPercentage DESC' THEN [VR_VTDefault].[MinimumHeightPercentage] END DESC,
     CASE @OrderBy WHEN 'MinimumWidthPercentage' THEN [VR_VTDefault].[MinimumWidthPercentage] END,
     CASE @OrderBy WHEN 'MinimumWidthPercentage DESC' THEN [VR_VTDefault].[MinimumWidthPercentage] END DESC,
     CASE @OrderBy WHEN 'MinimumLengthPercentage' THEN [VR_VTDefault].[MinimumLengthPercentage] END,
     CASE @OrderBy WHEN 'MinimumLengthPercentage DESC' THEN [VR_VTDefault].[MinimumLengthPercentage] END DESC,
     CASE @OrderBy WHEN 'MaximumHeightPercentage' THEN [VR_VTDefault].[MaximumHeightPercentage] END,
     CASE @OrderBy WHEN 'MaximumHeightPercentage DESC' THEN [VR_VTDefault].[MaximumHeightPercentage] END DESC,
     CASE @OrderBy WHEN 'MaximumWidthPercentage' THEN [VR_VTDefault].[MaximumWidthPercentage] END,
     CASE @OrderBy WHEN 'MaximumWidthPercentage DESC' THEN [VR_VTDefault].[MaximumWidthPercentage] END DESC,
     CASE @OrderBy WHEN 'MaximumLengthPercentage' THEN [VR_VTDefault].[MaximumLengthPercentage] END,
     CASE @OrderBy WHEN 'MaximumLengthPercentage DESC' THEN [VR_VTDefault].[MaximumLengthPercentage] END DESC 

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
