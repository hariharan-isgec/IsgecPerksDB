USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransportersSelectByID]
  @LoginID NVarChar(8),
  @TransporterID NVarChar(9) 
  AS
  SELECT
		[VR_Transporters].[TransporterID] ,
		[VR_Transporters].[TransporterName] ,
		[VR_Transporters].[Address1Line] ,
		[VR_Transporters].[Address2Line] ,
		[VR_Transporters].[City] ,
		[VR_Transporters].[EMailID]  
  FROM [VR_Transporters] 
  WHERE
  [VR_Transporters].[TransporterID] = @TransporterID
GO
