USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TrainingSelectListSearch]
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
  SELECT [TA_D_Training].[SerialNo] FROM [TA_D_Training]
 WHERE  
   ( 
         STR(ISNULL([TA_D_Training].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_Training].[Bord_Lodg_DA_Percent], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_Training].[Lodg_DA_Percent], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_Training].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_Training].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Bord_Lodg_DA_Percent' THEN [TA_D_Training].[Bord_Lodg_DA_Percent] END,
     CASE @OrderBy WHEN 'Bord_Lodg_DA_Percent DESC' THEN [TA_D_Training].[Bord_Lodg_DA_Percent] END DESC,
     CASE @OrderBy WHEN 'Lodg_DA_Percent' THEN [TA_D_Training].[Lodg_DA_Percent] END,
     CASE @OrderBy WHEN 'Lodg_DA_Percent DESC' THEN [TA_D_Training].[Lodg_DA_Percent] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_Training].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_Training].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_Training].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_Training].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_Training].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_Training].[Active] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_D_Training].[SerialNo] ,
		[TA_D_Training].[Bord_Lodg_DA_Percent] ,
		[TA_D_Training].[Lodg_DA_Percent] ,
		[TA_D_Training].[FromDate] ,
		[TA_D_Training].[TillDate] ,
		[TA_D_Training].[Active]  
  FROM [TA_D_Training] 
      INNER JOIN #PageIndex
          ON [TA_D_Training].[SerialNo] = #PageIndex.SerialNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
