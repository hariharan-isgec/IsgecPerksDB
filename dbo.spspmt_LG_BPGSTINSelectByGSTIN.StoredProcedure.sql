USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spspmt_LG_BPGSTINSelectByGSTIN]
  @LoginID NVarChar(8),
  @GSTIN NVARCHAR(50)   
  AS
  SELECT TOP 1 
    [VR_BPGSTIN].* ,
    [VR_BusinessPartner1].[BPName] AS VR_BusinessPartner1_BPName 
  FROM [VR_BPGSTIN] 
  INNER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner1]
    ON [VR_BPGSTIN].[BPID] = [VR_BusinessPartner1].[BPID]
  WHERE [VR_BPGSTIN].[Description] = @GSTIN
GO
