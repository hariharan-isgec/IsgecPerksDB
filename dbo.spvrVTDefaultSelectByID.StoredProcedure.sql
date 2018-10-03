USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrVTDefaultSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[VR_VTDefault].[SerialNo] ,
		[VR_VTDefault].[MinimumCapacityPercentage] ,
		[VR_VTDefault].[MaximumCapacityPercentage] ,
		[VR_VTDefault].[MinimumHeightPercentage] ,
		[VR_VTDefault].[MinimumWidthPercentage] ,
		[VR_VTDefault].[MinimumLengthPercentage] ,
		[VR_VTDefault].[MaximumHeightPercentage] ,
		[VR_VTDefault].[MaximumWidthPercentage] ,
		[VR_VTDefault].[MaximumLengthPercentage]  
  FROM [VR_VTDefault] 
  WHERE
  [VR_VTDefault].[SerialNo] = @SerialNo
GO
