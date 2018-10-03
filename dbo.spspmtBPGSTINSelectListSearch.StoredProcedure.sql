USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBPGSTINSelectListSearch]
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
 ,BPID NVarChar(9) NOT NULL
 ,GSTIN Int NOT NULL
  )
  INSERT INTO #PageIndex (BPID, GSTIN)
  SELECT [VR_BPGSTIN].[BPID], [VR_BPGSTIN].[GSTIN] FROM [VR_BPGSTIN]
  INNER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner1]
    ON [VR_BPGSTIN].[BPID] = [VR_BusinessPartner1].[BPID]
 WHERE  
   ( 
         LOWER(ISNULL([VR_BPGSTIN].[BPID],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_BPGSTIN].[GSTIN], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_BPGSTIN].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BPID' THEN [VR_BPGSTIN].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [VR_BPGSTIN].[BPID] END DESC,
     CASE @OrderBy WHEN 'GSTIN' THEN [VR_BPGSTIN].[GSTIN] END,
     CASE @OrderBy WHEN 'GSTIN DESC' THEN [VR_BPGSTIN].[GSTIN] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_BPGSTIN].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_BPGSTIN].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner1_BPName' THEN [VR_BusinessPartner1].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner1_BPName DESC' THEN [VR_BusinessPartner1].[BPName] END DESC 

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
