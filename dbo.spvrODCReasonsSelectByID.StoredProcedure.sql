USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrODCReasonsSelectByID]
  @LoginID NVarChar(8),
  @ReasonID Int 
  AS
  SELECT
		[VR_ODCReasons].[ReasonID] ,
		[VR_ODCReasons].[Description]  
  FROM [VR_ODCReasons] 
  WHERE
  [VR_ODCReasons].[ReasonID] = @ReasonID
GO
