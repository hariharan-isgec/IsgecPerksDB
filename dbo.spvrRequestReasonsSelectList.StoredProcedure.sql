USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestReasonsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_RequestReasons].[ReasonID] ,
		[VR_RequestReasons].[Description] ,
		[VR_RequestReasons].[Transporter] ,
		[VR_RequestReasons].[ISGEC] ,
		[VR_RequestReasons].[Supplier] ,
		[VR_RequestReasons].[Other]  
  FROM [VR_RequestReasons] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [VR_RequestReasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [VR_RequestReasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_RequestReasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_RequestReasons].[Description] END DESC,
     CASE @OrderBy WHEN 'Transporter' THEN [VR_RequestReasons].[Transporter] END,
     CASE @OrderBy WHEN 'Transporter DESC' THEN [VR_RequestReasons].[Transporter] END DESC,
     CASE @OrderBy WHEN 'ISGEC' THEN [VR_RequestReasons].[ISGEC] END,
     CASE @OrderBy WHEN 'ISGEC DESC' THEN [VR_RequestReasons].[ISGEC] END DESC,
     CASE @OrderBy WHEN 'Supplier' THEN [VR_RequestReasons].[Supplier] END,
     CASE @OrderBy WHEN 'Supplier DESC' THEN [VR_RequestReasons].[Supplier] END DESC,
     CASE @OrderBy WHEN 'Other' THEN [VR_RequestReasons].[Other] END,
     CASE @OrderBy WHEN 'Other DESC' THEN [VR_RequestReasons].[Other] END DESC 
  SET @RecordCount = @@RowCount
GO
