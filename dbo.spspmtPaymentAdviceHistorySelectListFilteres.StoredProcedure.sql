USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPaymentAdviceHistorySelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,AdviceNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AdviceNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_PaymentAdviceHistory].[AdviceNo]'
  SET @LGSQL = @LGSQL + ', [SPMT_PaymentAdviceHistory].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_PaymentAdviceHistory] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdviceHistory].[ConcernedHOD] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdviceHistory].[AdviceStatusUser] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdviceHistory].[AdviceStatusID] = [SPMT_PAStatus3].[AdviceStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdviceHistory].[AdviceNo] = [SPMT_PaymentAdvice4].[AdviceNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdviceHistory].[VendorID] = [SPMT_Vendors5].[VendorID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AdviceNo' THEN '[SPMT_PaymentAdviceHistory].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_PaymentAdviceHistory].[AdviceNo] DESC'
                        WHEN 'SerialNo' THEN '[SPMT_PaymentAdviceHistory].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[SPMT_PaymentAdviceHistory].[SerialNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_PaymentAdviceHistory].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_PaymentAdviceHistory].[TranTypeID] DESC'
                        WHEN 'VendorID' THEN '[SPMT_PaymentAdviceHistory].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_PaymentAdviceHistory].[VendorID] DESC'
                        WHEN 'CostCenter' THEN '[SPMT_PaymentAdviceHistory].[CostCenter]'
                        WHEN 'CostCenter DESC' THEN '[SPMT_PaymentAdviceHistory].[CostCenter] DESC'
                        WHEN 'ConcernedHOD' THEN '[SPMT_PaymentAdviceHistory].[ConcernedHOD]'
                        WHEN 'ConcernedHOD DESC' THEN '[SPMT_PaymentAdviceHistory].[ConcernedHOD] DESC'
                        WHEN 'AdviceStatusID' THEN '[SPMT_PaymentAdviceHistory].[AdviceStatusID]'
                        WHEN 'AdviceStatusID DESC' THEN '[SPMT_PaymentAdviceHistory].[AdviceStatusID] DESC'
                        WHEN 'AdviceStatusOn' THEN '[SPMT_PaymentAdviceHistory].[AdviceStatusOn]'
                        WHEN 'AdviceStatusOn DESC' THEN '[SPMT_PaymentAdviceHistory].[AdviceStatusOn] DESC'
                        WHEN 'AdviceStatusUser' THEN '[SPMT_PaymentAdviceHistory].[AdviceStatusUser]'
                        WHEN 'AdviceStatusUser DESC' THEN '[SPMT_PaymentAdviceHistory].[AdviceStatusUser] DESC'
                        WHEN 'Remarks' THEN '[SPMT_PaymentAdviceHistory].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_PaymentAdviceHistory].[Remarks] DESC'
                        WHEN 'RemarksHOD' THEN '[SPMT_PaymentAdviceHistory].[RemarksHOD]'
                        WHEN 'RemarksHOD DESC' THEN '[SPMT_PaymentAdviceHistory].[RemarksHOD] DESC'
                        WHEN 'RemarksHR' THEN '[SPMT_PaymentAdviceHistory].[RemarksHR]'
                        WHEN 'RemarksHR DESC' THEN '[SPMT_PaymentAdviceHistory].[RemarksHR] DESC'
                        WHEN 'RemarksAC' THEN '[SPMT_PaymentAdviceHistory].[RemarksAC]'
                        WHEN 'RemarksAC DESC' THEN '[SPMT_PaymentAdviceHistory].[RemarksAC] DESC'
                        WHEN 'Returned' THEN '[SPMT_PaymentAdviceHistory].[Returned]'
                        WHEN 'Returned DESC' THEN '[SPMT_PaymentAdviceHistory].[Returned] DESC'
                        WHEN 'Forward' THEN '[SPMT_PaymentAdviceHistory].[Forward]'
                        WHEN 'Forward DESC' THEN '[SPMT_PaymentAdviceHistory].[Forward] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'SPMT_PAStatus3_Description' THEN '[SPMT_PAStatus].[Description]'
                        WHEN 'SPMT_PAStatus3_Description DESC' THEN '[SPMT_PAStatus3].[Description] DESC'
                        WHEN 'SPMT_Vendors5_Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'SPMT_Vendors5_Description DESC' THEN '[SPMT_Vendors5].[Description] DESC'
                        ELSE '[SPMT_PaymentAdviceHistory].[AdviceNo],[SPMT_PaymentAdviceHistory].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_PaymentAdviceHistory].[AdviceNo] ,
		[SPMT_PaymentAdviceHistory].[SerialNo] ,
		[SPMT_PaymentAdviceHistory].[TranTypeID] ,
		[SPMT_PaymentAdviceHistory].[VendorID] ,
		[SPMT_PaymentAdviceHistory].[CostCenter] ,
		[SPMT_PaymentAdviceHistory].[ConcernedHOD] ,
		[SPMT_PaymentAdviceHistory].[AdviceStatusID] ,
		[SPMT_PaymentAdviceHistory].[AdviceStatusOn] ,
		[SPMT_PaymentAdviceHistory].[AdviceStatusUser] ,
		[SPMT_PaymentAdviceHistory].[Remarks] ,
		[SPMT_PaymentAdviceHistory].[RemarksHOD] ,
		[SPMT_PaymentAdviceHistory].[RemarksHR] ,
		[SPMT_PaymentAdviceHistory].[RemarksAC] ,
		[SPMT_PaymentAdviceHistory].[Returned] ,
		[SPMT_PaymentAdviceHistory].[Forward] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[SPMT_PAStatus3].[Description] AS SPMT_PAStatus3_Description,
		[SPMT_Vendors5].[Description] AS SPMT_Vendors5_Description 
  FROM [SPMT_PaymentAdviceHistory] 
    	INNER JOIN #PageIndex
          ON [SPMT_PaymentAdviceHistory].[AdviceNo] = #PageIndex.AdviceNo
          AND [SPMT_PaymentAdviceHistory].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_PaymentAdviceHistory].[ConcernedHOD] = [aspnet_Users1].[LoginID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_PaymentAdviceHistory].[AdviceStatusUser] = [aspnet_Users2].[LoginID]
  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus3]
    ON [SPMT_PaymentAdviceHistory].[AdviceStatusID] = [SPMT_PAStatus3].[AdviceStatusID]
  INNER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice4]
    ON [SPMT_PaymentAdviceHistory].[AdviceNo] = [SPMT_PaymentAdvice4].[AdviceNo]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors5]
    ON [SPMT_PaymentAdviceHistory].[VendorID] = [SPMT_Vendors5].[VendorID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
