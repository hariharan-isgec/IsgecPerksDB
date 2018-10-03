USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAttatchmentsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CallID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[CAL_Attatchments].[CallID]'
  SET @LGSQL = @LGSQL + ', [CAL_Attatchments].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [CAL_Attatchments] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [CAL_Register] AS [CAL_Register1]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Attatchments].[CallID] = [CAL_Register1].[CallID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[CAL_Attatchments].[CallID]'
                        WHEN 'CallID DESC' THEN '[CAL_Attatchments].[CallID] DESC'
                        WHEN 'SerialNo' THEN '[CAL_Attatchments].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[CAL_Attatchments].[SerialNo] DESC'
                        WHEN 'AttatchmentName' THEN '[CAL_Attatchments].[AttatchmentName]'
                        WHEN 'AttatchmentName DESC' THEN '[CAL_Attatchments].[AttatchmentName] DESC'
                        WHEN 'DiskFileName' THEN '[CAL_Attatchments].[DiskFileName]'
                        WHEN 'DiskFileName DESC' THEN '[CAL_Attatchments].[DiskFileName] DESC'
                        WHEN 'IsImage' THEN '[CAL_Attatchments].[IsImage]'
                        WHEN 'IsImage DESC' THEN '[CAL_Attatchments].[IsImage] DESC'
                        ELSE '[CAL_Attatchments].[CallID],[CAL_Attatchments].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[CAL_Attatchments].[CallID] ,
		[CAL_Attatchments].[SerialNo] ,
		[CAL_Attatchments].[AttatchmentName] ,
		[CAL_Attatchments].[DiskFileName] ,
		[CAL_Attatchments].[IsImage]  
  FROM [CAL_Attatchments] 
    	INNER JOIN #PageIndex
          ON [CAL_Attatchments].[CallID] = #PageIndex.CallID
          AND [CAL_Attatchments].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [CAL_Register] AS [CAL_Register1]
    ON [CAL_Attatchments].[CallID] = [CAL_Register1].[CallID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
