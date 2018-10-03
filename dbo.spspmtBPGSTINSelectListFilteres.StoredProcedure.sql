USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBPGSTINSelectListFilteres]
  @Filter_BPID NVarChar(9),
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
 ,BPID NVarChar(9) NOT NULL
 ,GSTIN Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BPID'
  SET @LGSQL = @LGSQL + ', GSTIN'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_BPGSTIN].[BPID]'
  SET @LGSQL = @LGSQL + ', [VR_BPGSTIN].[GSTIN]'
  SET @LGSQL = @LGSQL + ' FROM [VR_BPGSTIN] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner1]'
  SET @LGSQL = @LGSQL + '    ON [VR_BPGSTIN].[BPID] = [VR_BusinessPartner1].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_BPID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_BPGSTIN].[BPID] = ''' + @Filter_BPID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BPID' THEN '[VR_BPGSTIN].[BPID]'
                        WHEN 'BPID DESC' THEN '[VR_BPGSTIN].[BPID] DESC'
                        WHEN 'GSTIN' THEN '[VR_BPGSTIN].[GSTIN]'
                        WHEN 'GSTIN DESC' THEN '[VR_BPGSTIN].[GSTIN] DESC'
                        WHEN 'Description' THEN '[VR_BPGSTIN].[Description]'
                        WHEN 'Description DESC' THEN '[VR_BPGSTIN].[Description] DESC'
                        WHEN 'VR_BusinessPartner1_BPName' THEN '[VR_BusinessPartner1].[BPName]'
                        WHEN 'VR_BusinessPartner1_BPName DESC' THEN '[VR_BusinessPartner1].[BPName] DESC'
                        ELSE '[VR_BPGSTIN].[BPID],[VR_BPGSTIN].[GSTIN]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [VR_BPGSTIN].* ,
    [VR_BusinessPartner1].[BPName] AS VR_BusinessPartner1_BPName 
  FROM [VR_BPGSTIN] 
      INNER JOIN #PageIndex
          ON [VR_BPGSTIN].[BPID] = #PageIndex.BPID
          AND [VR_BPGSTIN].[GSTIN] = #PageIndex.GSTIN
  INNER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner1]
    ON [VR_BPGSTIN].[BPID] = [VR_BusinessPartner1].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
