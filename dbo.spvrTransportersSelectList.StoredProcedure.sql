USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransportersSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_Transporters].[TransporterID] ,
		[VR_Transporters].[TransporterName] ,
		[VR_Transporters].[Address1Line] ,
		[VR_Transporters].[Address2Line] ,
		[VR_Transporters].[City] ,
		[VR_Transporters].[EMailID]  
  FROM [VR_Transporters] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'TransporterID' THEN [VR_Transporters].[TransporterID] END,
     CASE @OrderBy WHEN 'TransporterID DESC' THEN [VR_Transporters].[TransporterID] END DESC,
     CASE @OrderBy WHEN 'TransporterName' THEN [VR_Transporters].[TransporterName] END,
     CASE @OrderBy WHEN 'TransporterName DESC' THEN [VR_Transporters].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'Address1Line' THEN [VR_Transporters].[Address1Line] END,
     CASE @OrderBy WHEN 'Address1Line DESC' THEN [VR_Transporters].[Address1Line] END DESC,
     CASE @OrderBy WHEN 'Address2Line' THEN [VR_Transporters].[Address2Line] END,
     CASE @OrderBy WHEN 'Address2Line DESC' THEN [VR_Transporters].[Address2Line] END DESC,
     CASE @OrderBy WHEN 'City' THEN [VR_Transporters].[City] END,
     CASE @OrderBy WHEN 'City DESC' THEN [VR_Transporters].[City] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [VR_Transporters].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [VR_Transporters].[EMailID] END DESC 
  SET @RecordCount = @@RowCount
GO
