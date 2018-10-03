USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestReasonsSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ReasonID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReasonID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_RequestReasons].[ReasonID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_RequestReasons] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReasonID' THEN '[VR_RequestReasons].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[VR_RequestReasons].[ReasonID] DESC'
                        WHEN 'Description' THEN '[VR_RequestReasons].[Description]'
                        WHEN 'Description DESC' THEN '[VR_RequestReasons].[Description] DESC'
                        WHEN 'Transporter' THEN '[VR_RequestReasons].[Transporter]'
                        WHEN 'Transporter DESC' THEN '[VR_RequestReasons].[Transporter] DESC'
                        WHEN 'ISGEC' THEN '[VR_RequestReasons].[ISGEC]'
                        WHEN 'ISGEC DESC' THEN '[VR_RequestReasons].[ISGEC] DESC'
                        WHEN 'Supplier' THEN '[VR_RequestReasons].[Supplier]'
                        WHEN 'Supplier DESC' THEN '[VR_RequestReasons].[Supplier] DESC'
                        WHEN 'Other' THEN '[VR_RequestReasons].[Other]'
                        WHEN 'Other DESC' THEN '[VR_RequestReasons].[Other] DESC'
                        ELSE '[VR_RequestReasons].[ReasonID]'
                    END
  EXEC (@LGSQL)

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
