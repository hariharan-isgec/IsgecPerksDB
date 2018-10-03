USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBPGSTINSelectByID]
  @LoginID NVarChar(8),
  @BPID NVarChar(9),
  @GSTIN Int 
  AS
  SELECT
    [VR_BPGSTIN].* ,
    [VR_BusinessPartner1].[BPName] AS VR_BusinessPartner1_BPName 
  FROM [VR_BPGSTIN] 
  INNER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner1]
    ON [VR_BPGSTIN].[BPID] = [VR_BusinessPartner1].[BPID]
  WHERE
  [VR_BPGSTIN].[BPID] = @BPID
  AND [VR_BPGSTIN].[GSTIN] = @GSTIN
GO
