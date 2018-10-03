USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestReasonsSelectByID]
  @LoginID NVarChar(8),
  @ReasonID Int 
  AS
  SELECT
		[VR_RequestReasons].[ReasonID] ,
		[VR_RequestReasons].[Description] ,
		[VR_RequestReasons].[Transporter] ,
		[VR_RequestReasons].[ISGEC] ,
		[VR_RequestReasons].[Supplier] ,
		[VR_RequestReasons].[Other]  
  FROM [VR_RequestReasons] 
  WHERE
  [VR_RequestReasons].[ReasonID] = @ReasonID
GO
