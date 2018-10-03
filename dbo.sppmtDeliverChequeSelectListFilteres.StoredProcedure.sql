USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtDeliverChequeSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CQRNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CQRNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMT_CQReceipts].[CQRNo]'
  SET @LGSQL = @LGSQL + ' FROM [PMT_CQReceipts] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus2]'
  SET @LGSQL = @LGSQL + '    ON [PMT_CQReceipts].[StatusID] = [PMT_BookingStatus2].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PMT_Vendor] AS [PMT_Vendor1]'
  SET @LGSQL = @LGSQL + '    ON [PMT_CQReceipts].[VendorID] = [PMT_Vendor1].[VendorID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CQRNo' THEN '[PMT_CQReceipts].[CQRNo]'
                        WHEN 'CQRNo DESC' THEN '[PMT_CQReceipts].[CQRNo] DESC'
                        WHEN 'CQRDt' THEN '[PMT_CQReceipts].[CQRDt]'
                        WHEN 'CQRDt DESC' THEN '[PMT_CQReceipts].[CQRDt] DESC'
                        WHEN 'VendorID' THEN '[PMT_CQReceipts].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[PMT_CQReceipts].[VendorID] DESC'
                        WHEN 'CQNumber' THEN '[PMT_CQReceipts].[CQNumber]'
                        WHEN 'CQNumber DESC' THEN '[PMT_CQReceipts].[CQNumber] DESC'
                        WHEN 'CQAmount' THEN '[PMT_CQReceipts].[CQAmount]'
                        WHEN 'CQAmount DESC' THEN '[PMT_CQReceipts].[CQAmount] DESC'
                        WHEN 'CQDate' THEN '[PMT_CQReceipts].[CQDate]'
                        WHEN 'CQDate DESC' THEN '[PMT_CQReceipts].[CQDate] DESC'
                        WHEN 'StatusID' THEN '[PMT_CQReceipts].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PMT_CQReceipts].[StatusID] DESC'
                        WHEN 'Remarks' THEN '[PMT_CQReceipts].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PMT_CQReceipts].[Remarks] DESC'
                        WHEN 'Delivered' THEN '[PMT_CQReceipts].[Delivered]'
                        WHEN 'Delivered DESC' THEN '[PMT_CQReceipts].[Delivered] DESC'
                        WHEN 'DeliveredOn' THEN '[PMT_CQReceipts].[DeliveredOn]'
                        WHEN 'DeliveredOn DESC' THEN '[PMT_CQReceipts].[DeliveredOn] DESC'
                        WHEN 'PMT_BookingStatus2_StatusID' THEN '[PMT_BookingStatus2].[StatusID]'
                        WHEN 'PMT_BookingStatus2_StatusID DESC' THEN '[PMT_BookingStatus2].[StatusID] DESC'
                        WHEN 'PMT_BookingStatus2_Description' THEN '[PMT_BookingStatus2].[Description]'
                        WHEN 'PMT_BookingStatus2_Description DESC' THEN '[PMT_BookingStatus2].[Description] DESC'
                        WHEN 'PMT_Vendor1_VendorID' THEN '[PMT_Vendor1].[VendorID]'
                        WHEN 'PMT_Vendor1_VendorID DESC' THEN '[PMT_Vendor1].[VendorID] DESC'
                        WHEN 'PMT_Vendor1_Description' THEN '[PMT_Vendor1].[Description]'
                        WHEN 'PMT_Vendor1_Description DESC' THEN '[PMT_Vendor1].[Description] DESC'
                        WHEN 'PMT_Vendor1_Active' THEN '[PMT_Vendor1].[Active]'
                        WHEN 'PMT_Vendor1_Active DESC' THEN '[PMT_Vendor1].[Active] DESC'
                        ELSE '[PMT_CQReceipts].[CQRNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMT_CQReceipts].[CQRNo],
		[PMT_CQReceipts].[CQRDt],
		[PMT_CQReceipts].[VendorID],
		[PMT_CQReceipts].[CQNumber],
		[PMT_CQReceipts].[CQAmount],
		[PMT_CQReceipts].[CQDate],
		[PMT_CQReceipts].[StatusID],
		[PMT_CQReceipts].[Remarks],
		[PMT_CQReceipts].[Delivered],
		[PMT_CQReceipts].[DeliveredOn],
		[PMT_BookingStatus2].[StatusID] AS PMT_BookingStatus2_StatusID,
		[PMT_BookingStatus2].[Description] AS PMT_BookingStatus2_Description,
		[PMT_Vendor1].[VendorID] AS PMT_Vendor1_VendorID,
		[PMT_Vendor1].[Description] AS PMT_Vendor1_Description,
		[PMT_Vendor1].[Active] AS PMT_Vendor1_Active 
  FROM [PMT_CQReceipts] 
    	INNER JOIN #PageIndex
          ON [PMT_CQReceipts].[CQRNo] = #PageIndex.CQRNo
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus2]
    ON [PMT_CQReceipts].[StatusID] = [PMT_BookingStatus2].[StatusID]
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor1]
    ON [PMT_CQReceipts].[VendorID] = [PMT_Vendor1].[VendorID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
