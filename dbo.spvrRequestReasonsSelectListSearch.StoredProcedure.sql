USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestReasonsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ReasonID Int NOT NULL
  )
  INSERT INTO #PageIndex (ReasonID)
  SELECT [VR_RequestReasons].[ReasonID] FROM [VR_RequestReasons]
 WHERE  
   ( 
         STR(ISNULL([VR_RequestReasons].[ReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestReasons].[Description],'')) LIKE @KeyWord1
   ) 
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

  SELECT
		[VR_RequestReasons].[ReasonID] ,
		[VR_RequestReasons].[Description] ,
		[VR_RequestReasons].[Transporter] ,
		[VR_RequestReasons].[ISGEC] ,
		[VR_RequestReasons].[Supplier] ,
		[VR_RequestReasons].[Other]  
  FROM [VR_RequestReasons] 
    	INNER JOIN #PageIndex
          ON [VR_RequestReasons].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
