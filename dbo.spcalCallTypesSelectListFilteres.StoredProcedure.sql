USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalCallTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CallTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (CallTypeID) ' + 
               'SELECT [CAL_CallTypes].[CallTypeID] FROM [CAL_CallTypes] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority1]'
  SET @LGSQL = @LGSQL + '    ON [CAL_CallTypes].[Priority] = [CAL_Priority1].[Priority]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallTypeID' THEN '[CAL_CallTypes].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[CAL_CallTypes].[CallTypeID] DESC'
                        WHEN 'Description' THEN '[CAL_CallTypes].[Description]'
                        WHEN 'Description DESC' THEN '[CAL_CallTypes].[Description] DESC'
                        WHEN 'Priority' THEN '[CAL_CallTypes].[Priority]'
                        WHEN 'Priority DESC' THEN '[CAL_CallTypes].[Priority] DESC'
                        WHEN 'ResponseTime' THEN '[CAL_CallTypes].[ResponseTime]'
                        WHEN 'ResponseTime DESC' THEN '[CAL_CallTypes].[ResponseTime] DESC'
                        WHEN 'CAL_Priority1_Priority' THEN '[CAL_Priority1].[Priority]'
                        WHEN 'CAL_Priority1_Priority DESC' THEN '[CAL_Priority1].[Priority] DESC'
                        WHEN 'CAL_Priority1_Description' THEN '[CAL_Priority1].[Description]'
                        WHEN 'CAL_Priority1_Description DESC' THEN '[CAL_Priority1].[Description] DESC'
                        ELSE '[CAL_CallTypes].[CallTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[CAL_CallTypes].[CallTypeID],
		[CAL_CallTypes].[Description],
		[CAL_CallTypes].[Priority],
		[CAL_CallTypes].[ResponseTime],
		[CAL_Priority1].[Priority] AS CAL_Priority1_Priority,
		[CAL_Priority1].[Description] AS CAL_Priority1_Description 
  FROM [CAL_CallTypes] 
    	INNER JOIN #PageIndex
          ON [CAL_CallTypes].[CallTypeID] = #PageIndex.CallTypeID
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority1]
    ON [CAL_CallTypes].[Priority] = [CAL_Priority1].[Priority]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
