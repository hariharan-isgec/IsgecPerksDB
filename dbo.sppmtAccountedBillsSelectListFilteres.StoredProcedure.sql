USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtAccountedBillsSelectListFilteres]
  @Filter_CQRNo Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IRNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMT_IRDocs].[IRNo]'
  SET @LGSQL = @LGSQL + ' FROM [PMT_IRDocs] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus3]'
  SET @LGSQL = @LGSQL + '    ON [PMT_IRDocs].[StatusID] = [PMT_BookingStatus3].[StatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CQRNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PMT_IRDocs].[CQRNo] = ' + STR(@Filter_CQRNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[PMT_IRDocs].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[PMT_IRDocs].[IRNo] DESC'
                        WHEN 'VendorBillNo' THEN '[PMT_IRDocs].[VendorBillNo]'
                        WHEN 'VendorBillNo DESC' THEN '[PMT_IRDocs].[VendorBillNo] DESC'
                        WHEN 'VendorBillDate' THEN '[PMT_IRDocs].[VendorBillDate]'
                        WHEN 'VendorBillDate DESC' THEN '[PMT_IRDocs].[VendorBillDate] DESC'
                        WHEN 'PassedDistance' THEN '[PMT_IRDocs].[PassedDistance]'
                        WHEN 'PassedDistance DESC' THEN '[PMT_IRDocs].[PassedDistance] DESC'
                        WHEN 'PassedHours' THEN '[PMT_IRDocs].[PassedHours]'
                        WHEN 'PassedHours DESC' THEN '[PMT_IRDocs].[PassedHours] DESC'
                        WHEN 'PassedAmount' THEN '[PMT_IRDocs].[PassedAmount]'
                        WHEN 'PassedAmount DESC' THEN '[PMT_IRDocs].[PassedAmount] DESC'
                        WHEN 'Remarks' THEN '[PMT_IRDocs].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PMT_IRDocs].[Remarks] DESC'
                        WHEN 'PostedInBaaN' THEN '[PMT_IRDocs].[PostedInBaaN]'
                        WHEN 'PostedInBaaN DESC' THEN '[PMT_IRDocs].[PostedInBaaN] DESC'
                        WHEN 'PostedOn' THEN '[PMT_IRDocs].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[PMT_IRDocs].[PostedOn] DESC'
                        WHEN 'CQReceived' THEN '[PMT_IRDocs].[CQReceived]'
                        WHEN 'CQReceived DESC' THEN '[PMT_IRDocs].[CQReceived] DESC'
                        WHEN 'CQRNo' THEN '[PMT_IRDocs].[CQRNo]'
                        WHEN 'CQRNo DESC' THEN '[PMT_IRDocs].[CQRNo] DESC'
                        WHEN 'CQRDt' THEN '[PMT_IRDocs].[CQRDt]'
                        WHEN 'CQRDt DESC' THEN '[PMT_IRDocs].[CQRDt] DESC'
                        WHEN 'StatusID' THEN '[PMT_IRDocs].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PMT_IRDocs].[StatusID] DESC'
                        WHEN 'PMT_BookingStatus3_StatusID' THEN '[PMT_BookingStatus3].[StatusID]'
                        WHEN 'PMT_BookingStatus3_StatusID DESC' THEN '[PMT_BookingStatus3].[StatusID] DESC'
                        WHEN 'PMT_BookingStatus3_Description' THEN '[PMT_BookingStatus3].[Description]'
                        WHEN 'PMT_BookingStatus3_Description DESC' THEN '[PMT_BookingStatus3].[Description] DESC'
                        ELSE '[PMT_IRDocs].[IRNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMT_IRDocs].[IRNo],
		[PMT_IRDocs].[VendorBillNo],
		[PMT_IRDocs].[VendorBillDate],
		[PMT_IRDocs].[PassedDistance],
		[PMT_IRDocs].[PassedHours],
		[PMT_IRDocs].[PassedAmount],
		[PMT_IRDocs].[Remarks],
		[PMT_IRDocs].[PostedInBaaN],
		[PMT_IRDocs].[PostedOn],
		[PMT_IRDocs].[CQReceived],
		[PMT_IRDocs].[CQRNo],
		[PMT_IRDocs].[CQRDt],
		[PMT_IRDocs].[StatusID],
		[PMT_BookingStatus3].[StatusID] AS PMT_BookingStatus3_StatusID,
		[PMT_BookingStatus3].[Description] AS PMT_BookingStatus3_Description 
  FROM [PMT_IRDocs] 
    	INNER JOIN #PageIndex
          ON [PMT_IRDocs].[IRNo] = #PageIndex.IRNo
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus3]
    ON [PMT_IRDocs].[StatusID] = [PMT_BookingStatus3].[StatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
