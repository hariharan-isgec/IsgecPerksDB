USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBusinessPartnerSelectByID]
  @LoginID NVarChar(8),
  @BPID NVarChar(9) 
  AS
  SELECT
    [VR_BusinessPartner].*  
  FROM [VR_BusinessPartner] 
  WHERE
  [VR_BusinessPartner].[BPID] = @BPID
GO
