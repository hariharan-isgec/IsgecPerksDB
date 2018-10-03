USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReasonsSelectByID]
  @LoginID NVarChar(8),
  @ReasonID Int 
  AS
  SELECT
    [PAK_Reasons].*  
  FROM [PAK_Reasons] 
  WHERE
  [PAK_Reasons].[ReasonID] = @ReasonID
GO
