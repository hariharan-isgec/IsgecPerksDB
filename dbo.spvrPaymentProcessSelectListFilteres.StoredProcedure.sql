USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrPaymentProcessSelectListFilteres]
  @Filter_ProcessedBy NVarChar(8),
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_PaymentProcess].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_PaymentProcess] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VR_PaymentProcess].[ProcessedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProcessedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_PaymentProcess].[ProcessedBy] = ''' + @Filter_ProcessedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[VR_PaymentProcess].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_PaymentProcess].[SerialNo] DESC'
                        WHEN 'PTRNo' THEN '[VR_PaymentProcess].[PTRNo]'
                        WHEN 'PTRNo DESC' THEN '[VR_PaymentProcess].[PTRNo] DESC'
                        WHEN 'PTRDate' THEN '[VR_PaymentProcess].[PTRDate]'
                        WHEN 'PTRDate DESC' THEN '[VR_PaymentProcess].[PTRDate] DESC'
                        WHEN 'PTRAmount' THEN '[VR_PaymentProcess].[PTRAmount]'
                        WHEN 'PTRAmount DESC' THEN '[VR_PaymentProcess].[PTRAmount] DESC'
                        WHEN 'PaymentReference' THEN '[VR_PaymentProcess].[PaymentReference]'
                        WHEN 'PaymentReference DESC' THEN '[VR_PaymentProcess].[PaymentReference] DESC'
                        WHEN 'ChequeNo' THEN '[VR_PaymentProcess].[ChequeNo]'
                        WHEN 'ChequeNo DESC' THEN '[VR_PaymentProcess].[ChequeNo] DESC'
                        WHEN 'ChequeDate' THEN '[VR_PaymentProcess].[ChequeDate]'
                        WHEN 'ChequeDate DESC' THEN '[VR_PaymentProcess].[ChequeDate] DESC'
                        WHEN 'ChequeAmount' THEN '[VR_PaymentProcess].[ChequeAmount]'
                        WHEN 'ChequeAmount DESC' THEN '[VR_PaymentProcess].[ChequeAmount] DESC'
                        WHEN 'PaymentDescription' THEN '[VR_PaymentProcess].[PaymentDescription]'
                        WHEN 'PaymentDescription DESC' THEN '[VR_PaymentProcess].[PaymentDescription] DESC'
                        WHEN 'ProcessedBy' THEN '[VR_PaymentProcess].[ProcessedBy]'
                        WHEN 'ProcessedBy DESC' THEN '[VR_PaymentProcess].[ProcessedBy] DESC'
                        WHEN 'ProcessedOn' THEN '[VR_PaymentProcess].[ProcessedOn]'
                        WHEN 'ProcessedOn DESC' THEN '[VR_PaymentProcess].[ProcessedOn] DESC'
                        WHEN 'Freezed' THEN '[VR_PaymentProcess].[Freezed]'
                        WHEN 'Freezed DESC' THEN '[VR_PaymentProcess].[Freezed] DESC'
                        WHEN 'IRNo' THEN '[VR_PaymentProcess].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[VR_PaymentProcess].[IRNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        ELSE '[VR_PaymentProcess].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_PaymentProcess].[SerialNo] ,
		[VR_PaymentProcess].[PTRNo] ,
		[VR_PaymentProcess].[PTRDate] ,
		[VR_PaymentProcess].[PTRAmount] ,
		[VR_PaymentProcess].[PaymentReference] ,
		[VR_PaymentProcess].[ChequeNo] ,
		[VR_PaymentProcess].[ChequeDate] ,
		[VR_PaymentProcess].[ChequeAmount] ,
		[VR_PaymentProcess].[PaymentDescription] ,
		[VR_PaymentProcess].[ProcessedBy] ,
		[VR_PaymentProcess].[ProcessedOn] ,
		[VR_PaymentProcess].[Freezed] ,
		[VR_PaymentProcess].[IRNo] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [VR_PaymentProcess] 
    	INNER JOIN #PageIndex
          ON [VR_PaymentProcess].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_PaymentProcess].[ProcessedBy] = [aspnet_Users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
