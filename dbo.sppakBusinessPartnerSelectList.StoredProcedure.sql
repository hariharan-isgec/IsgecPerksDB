USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakBusinessPartnerSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [VR_BusinessPartner].*  
  FROM [VR_BusinessPartner] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BPID' THEN [VR_BusinessPartner].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [VR_BusinessPartner].[BPID] END DESC,
     CASE @OrderBy WHEN 'BPName' THEN [VR_BusinessPartner].[BPName] END,
     CASE @OrderBy WHEN 'BPName DESC' THEN [VR_BusinessPartner].[BPName] END DESC,
     CASE @OrderBy WHEN 'Address1Line' THEN [VR_BusinessPartner].[Address1Line] END,
     CASE @OrderBy WHEN 'Address1Line DESC' THEN [VR_BusinessPartner].[Address1Line] END DESC,
     CASE @OrderBy WHEN 'Address2Line' THEN [VR_BusinessPartner].[Address2Line] END,
     CASE @OrderBy WHEN 'Address2Line DESC' THEN [VR_BusinessPartner].[Address2Line] END DESC,
     CASE @OrderBy WHEN 'City' THEN [VR_BusinessPartner].[City] END,
     CASE @OrderBy WHEN 'City DESC' THEN [VR_BusinessPartner].[City] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [VR_BusinessPartner].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [VR_BusinessPartner].[EMailID] END DESC 
  SET @RecordCount = @@RowCount
GO
