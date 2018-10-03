USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPlacesSelectByID]
  @PlaceID NVarChar(30) 
  AS
  SELECT
		[SPMT_Places].[PlaceID] ,
		[SPMT_Places].[Description]  
  FROM [SPMT_Places] 
  WHERE
  [SPMT_Places].[PlaceID] = @PlaceID
GO
