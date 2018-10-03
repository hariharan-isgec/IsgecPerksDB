USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_ForeignTravelSelectListSearch]
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
  SELECT [TA_F_ForeignTravel].[SerialNo] FROM [TA_F_ForeignTravel]
 WHERE  
   ( 
         STR(ISNULL([TA_F_ForeignTravel].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_F_ForeignTravel].[Bord_Lodg_DA_Percent], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_F_ForeignTravel].[Lodg_DA_Percent], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_F_ForeignTravel].[DA_Adjested_LC_Percent], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_F_ForeignTravel].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_F_ForeignTravel].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Bord_Lodg_DA_Percent' THEN [TA_F_ForeignTravel].[Bord_Lodg_DA_Percent] END,
     CASE @OrderBy WHEN 'Bord_Lodg_DA_Percent DESC' THEN [TA_F_ForeignTravel].[Bord_Lodg_DA_Percent] END DESC,
     CASE @OrderBy WHEN 'Lodg_DA_Percent' THEN [TA_F_ForeignTravel].[Lodg_DA_Percent] END,
     CASE @OrderBy WHEN 'Lodg_DA_Percent DESC' THEN [TA_F_ForeignTravel].[Lodg_DA_Percent] END DESC,
     CASE @OrderBy WHEN 'DA_Adjested_LC_Percent' THEN [TA_F_ForeignTravel].[DA_Adjested_LC_Percent] END,
     CASE @OrderBy WHEN 'DA_Adjested_LC_Percent DESC' THEN [TA_F_ForeignTravel].[DA_Adjested_LC_Percent] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_F_ForeignTravel].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_F_ForeignTravel].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_F_ForeignTravel].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_F_ForeignTravel].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_F_ForeignTravel].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_F_ForeignTravel].[Active] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_F_ForeignTravel].[SerialNo] ,
		[TA_F_ForeignTravel].[Bord_Lodg_DA_Percent] ,
		[TA_F_ForeignTravel].[Lodg_DA_Percent] ,
		[TA_F_ForeignTravel].[DA_Adjested_LC_Percent] ,
		[TA_F_ForeignTravel].[FromDate] ,
		[TA_F_ForeignTravel].[TillDate] ,
		[TA_F_ForeignTravel].[Active]  
  FROM [TA_F_ForeignTravel] 
      INNER JOIN #PageIndex
          ON [TA_F_ForeignTravel].[SerialNo] = #PageIndex.SerialNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
