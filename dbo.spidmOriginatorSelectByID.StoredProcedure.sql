USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmOriginatorSelectByID]
  @OriginatorID NVarChar(3) 
  AS
  SELECT
		[IDM_Originator].[OriginatorID] ,
		[IDM_Originator].[Description]  
  FROM [IDM_Originator] 
  WHERE
  [IDM_Originator].[OriginatorID] = @OriginatorID
GO
