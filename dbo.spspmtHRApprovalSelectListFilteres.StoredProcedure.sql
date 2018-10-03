USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtHRApprovalSelectListFilteres]
  @Filter_TranTypeID NVarChar(3),
  @Filter_VendorID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @AdviceStatusID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,AdviceNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AdviceNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_PaymentAdvice].[AdviceNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_PaymentAdvice] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[AdviceStatusUser] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[ConcernedHOD] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[AdviceStatusID] = [SPMT_PAStatus3].[AdviceStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[TranTypeID] = [SPMT_TranTypes4].[TranTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[VendorID] = [SPMT_Vendors5].[VendorID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SPMT_PaymentAdvice].[AdviceStatusID] = ''' + STR(@AdviceStatusID) + '''' 
  IF (@Filter_TranTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_PaymentAdvice].[TranTypeID] = ''' + @Filter_TranTypeID + ''''
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_PaymentAdvice].[VendorID] = ''' + @Filter_VendorID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AdviceNo' THEN '[SPMT_PaymentAdvice].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_PaymentAdvice].[AdviceNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_PaymentAdvice].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_PaymentAdvice].[TranTypeID] DESC'
                        WHEN 'VendorID' THEN '[SPMT_PaymentAdvice].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_PaymentAdvice].[VendorID] DESC'
                        WHEN 'CostCenter' THEN '[SPMT_PaymentAdvice].[CostCenter]'
                        WHEN 'CostCenter DESC' THEN '[SPMT_PaymentAdvice].[CostCenter] DESC'
                        WHEN 'ConcernedHOD' THEN '[SPMT_PaymentAdvice].[ConcernedHOD]'
                        WHEN 'ConcernedHOD DESC' THEN '[SPMT_PaymentAdvice].[ConcernedHOD] DESC'
                        WHEN 'AdviceStatusID' THEN '[SPMT_PaymentAdvice].[AdviceStatusID]'
                        WHEN 'AdviceStatusID DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusID] DESC'
                        WHEN 'AdviceStatusOn' THEN '[SPMT_PaymentAdvice].[AdviceStatusOn]'
                        WHEN 'AdviceStatusOn DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusOn] DESC'
                        WHEN 'AdviceStatusUser' THEN '[SPMT_PaymentAdvice].[AdviceStatusUser]'
                        WHEN 'AdviceStatusUser DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusUser] DESC'
                        WHEN 'Remarks' THEN '[SPMT_PaymentAdvice].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_PaymentAdvice].[Remarks] DESC'
                        WHEN 'RemarksHOD' THEN '[SPMT_PaymentAdvice].[RemarksHOD]'
                        WHEN 'RemarksHOD DESC' THEN '[SPMT_PaymentAdvice].[RemarksHOD] DESC'
                        WHEN 'RemarksHR' THEN '[SPMT_PaymentAdvice].[RemarksHR]'
                        WHEN 'RemarksHR DESC' THEN '[SPMT_PaymentAdvice].[RemarksHR] DESC'
                        WHEN 'RemarksAC' THEN '[SPMT_PaymentAdvice].[RemarksAC]'
                        WHEN 'RemarksAC DESC' THEN '[SPMT_PaymentAdvice].[RemarksAC] DESC'
                        WHEN 'Returned' THEN '[SPMT_PaymentAdvice].[Returned]'
                        WHEN 'Returned DESC' THEN '[SPMT_PaymentAdvice].[Returned] DESC'
                        WHEN 'Forward' THEN '[SPMT_PaymentAdvice].[Forward]'
                        WHEN 'Forward DESC' THEN '[SPMT_PaymentAdvice].[Forward] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'SPMT_PAStatus3_Description' THEN '[SPMT_PAStatus].[Description]'
                        WHEN 'SPMT_PAStatus3_Description DESC' THEN '[SPMT_PAStatus3].[Description] DESC'
                        WHEN 'SPMT_TranTypes4_Description' THEN '[SPMT_TranTypes].[Description]'
                        WHEN 'SPMT_TranTypes4_Description DESC' THEN '[SPMT_TranTypes4].[Description] DESC'
                        WHEN 'SPMT_Vendors5_Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'SPMT_Vendors5_Description DESC' THEN '[SPMT_Vendors5].[Description] DESC'
                        ELSE '[SPMT_PaymentAdvice].[AdviceNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_PaymentAdvice].[AdviceNo] ,
		[SPMT_PaymentAdvice].[TranTypeID] ,
		[SPMT_PaymentAdvice].[VendorID] ,
		[SPMT_PaymentAdvice].[CostCenter] ,
		[SPMT_PaymentAdvice].[ConcernedHOD] ,
		[SPMT_PaymentAdvice].[AdviceStatusID] ,
		[SPMT_PaymentAdvice].[AdviceStatusOn] ,
		[SPMT_PaymentAdvice].[AdviceStatusUser] ,
		[SPMT_PaymentAdvice].[Remarks] ,
		[SPMT_PaymentAdvice].[RemarksHOD] ,
		[SPMT_PaymentAdvice].[RemarksHR] ,
		[SPMT_PaymentAdvice].[RemarksAC] ,
		[SPMT_PaymentAdvice].[Returned] ,
		[SPMT_PaymentAdvice].[Forward] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[SPMT_PAStatus3].[Description] AS SPMT_PAStatus3_Description,
		[SPMT_TranTypes4].[Description] AS SPMT_TranTypes4_Description,
		[SPMT_Vendors5].[Description] AS SPMT_Vendors5_Description 
  FROM [SPMT_PaymentAdvice] 
    	INNER JOIN #PageIndex
          ON [SPMT_PaymentAdvice].[AdviceNo] = #PageIndex.AdviceNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_PaymentAdvice].[AdviceStatusUser] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_PaymentAdvice].[ConcernedHOD] = [aspnet_Users2].[LoginID]
  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus3]
    ON [SPMT_PaymentAdvice].[AdviceStatusID] = [SPMT_PAStatus3].[AdviceStatusID]
  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes4]
    ON [SPMT_PaymentAdvice].[TranTypeID] = [SPMT_TranTypes4].[TranTypeID]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors5]
    ON [SPMT_PaymentAdvice].[VendorID] = [SPMT_Vendors5].[VendorID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
