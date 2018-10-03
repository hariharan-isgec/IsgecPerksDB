USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrPaymentProcessSelectListSearch]
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
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [VR_PaymentProcess].[SerialNo] FROM [VR_PaymentProcess]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_PaymentProcess].[ProcessedBy] = [aspnet_Users1].[LoginID]
 WHERE  
   ( 
         STR(ISNULL([VR_PaymentProcess].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_PaymentProcess].[PTRNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_PaymentProcess].[PTRAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_PaymentProcess].[PaymentReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_PaymentProcess].[ChequeNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_PaymentProcess].[ChequeAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_PaymentProcess].[PaymentDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_PaymentProcess].[ProcessedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_PaymentProcess].[IRNo], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_PaymentProcess].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_PaymentProcess].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PTRNo' THEN [VR_PaymentProcess].[PTRNo] END,
     CASE @OrderBy WHEN 'PTRNo DESC' THEN [VR_PaymentProcess].[PTRNo] END DESC,
     CASE @OrderBy WHEN 'PTRDate' THEN [VR_PaymentProcess].[PTRDate] END,
     CASE @OrderBy WHEN 'PTRDate DESC' THEN [VR_PaymentProcess].[PTRDate] END DESC,
     CASE @OrderBy WHEN 'PTRAmount' THEN [VR_PaymentProcess].[PTRAmount] END,
     CASE @OrderBy WHEN 'PTRAmount DESC' THEN [VR_PaymentProcess].[PTRAmount] END DESC,
     CASE @OrderBy WHEN 'PaymentReference' THEN [VR_PaymentProcess].[PaymentReference] END,
     CASE @OrderBy WHEN 'PaymentReference DESC' THEN [VR_PaymentProcess].[PaymentReference] END DESC,
     CASE @OrderBy WHEN 'ChequeNo' THEN [VR_PaymentProcess].[ChequeNo] END,
     CASE @OrderBy WHEN 'ChequeNo DESC' THEN [VR_PaymentProcess].[ChequeNo] END DESC,
     CASE @OrderBy WHEN 'ChequeDate' THEN [VR_PaymentProcess].[ChequeDate] END,
     CASE @OrderBy WHEN 'ChequeDate DESC' THEN [VR_PaymentProcess].[ChequeDate] END DESC,
     CASE @OrderBy WHEN 'ChequeAmount' THEN [VR_PaymentProcess].[ChequeAmount] END,
     CASE @OrderBy WHEN 'ChequeAmount DESC' THEN [VR_PaymentProcess].[ChequeAmount] END DESC,
     CASE @OrderBy WHEN 'PaymentDescription' THEN [VR_PaymentProcess].[PaymentDescription] END,
     CASE @OrderBy WHEN 'PaymentDescription DESC' THEN [VR_PaymentProcess].[PaymentDescription] END DESC,
     CASE @OrderBy WHEN 'ProcessedBy' THEN [VR_PaymentProcess].[ProcessedBy] END,
     CASE @OrderBy WHEN 'ProcessedBy DESC' THEN [VR_PaymentProcess].[ProcessedBy] END DESC,
     CASE @OrderBy WHEN 'ProcessedOn' THEN [VR_PaymentProcess].[ProcessedOn] END,
     CASE @OrderBy WHEN 'ProcessedOn DESC' THEN [VR_PaymentProcess].[ProcessedOn] END DESC,
     CASE @OrderBy WHEN 'Freezed' THEN [VR_PaymentProcess].[Freezed] END,
     CASE @OrderBy WHEN 'Freezed DESC' THEN [VR_PaymentProcess].[Freezed] END DESC,
     CASE @OrderBy WHEN 'IRNo' THEN [VR_PaymentProcess].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [VR_PaymentProcess].[IRNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC 

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
