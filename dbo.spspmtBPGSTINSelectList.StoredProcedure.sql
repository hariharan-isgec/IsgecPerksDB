USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBPGSTINSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [VR_BPGSTIN].* ,
    [VR_BusinessPartner1].[BPName] AS VR_BusinessPartner1_BPName 
  FROM [VR_BPGSTIN] 
  INNER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner1]
    ON [VR_BPGSTIN].[BPID] = [VR_BusinessPartner1].[BPID]
  WHERE 1 = 1  
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
GO
