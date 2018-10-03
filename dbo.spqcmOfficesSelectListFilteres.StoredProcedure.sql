USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmOfficesSelectListFilteres]
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
 ,OfficeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'OfficeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Offices].[OfficeID]'
  SET @LGSQL = @LGSQL + ' FROM [HRM_Offices] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'OfficeID' THEN '[HRM_Offices].[OfficeID]'
                        WHEN 'OfficeID DESC' THEN '[HRM_Offices].[OfficeID] DESC'
                        WHEN 'Description' THEN '[HRM_Offices].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Offices].[Description] DESC'
                        WHEN 'Address' THEN '[HRM_Offices].[Address]'
                        WHEN 'Address DESC' THEN '[HRM_Offices].[Address] DESC'
                        WHEN 'City' THEN '[HRM_Offices].[City]'
                        WHEN 'City DESC' THEN '[HRM_Offices].[City] DESC'
                        ELSE '[HRM_Offices].[OfficeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Offices].[OfficeID] ,
		[HRM_Offices].[Description] ,
		[HRM_Offices].[Address] ,
		[HRM_Offices].[City]  
  FROM [HRM_Offices] 
    	INNER JOIN #PageIndex
          ON [HRM_Offices].[OfficeID] = #PageIndex.OfficeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
