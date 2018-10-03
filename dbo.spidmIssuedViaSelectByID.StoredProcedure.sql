USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmIssuedViaSelectByID]
  @IssuedViaID Int 
  AS
  SELECT
		[IDM_IssuedVia].[IssuedViaID] ,
		[IDM_IssuedVia].[Description]  
  FROM [IDM_IssuedVia] 
  WHERE
  [IDM_IssuedVia].[IssuedViaID] = @IssuedViaID
GO
