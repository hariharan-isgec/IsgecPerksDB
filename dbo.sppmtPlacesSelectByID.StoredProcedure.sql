USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtPlacesSelectByID]
  @PlaceID NVarChar(30) 
  AS
  SELECT
		[PMT_Places].[PlaceID],
		[PMT_Places].[Description] 
  FROM [PMT_Places] 
  WHERE
  [PMT_Places].[PlaceID] = @PlaceID
GO
