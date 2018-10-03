USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPaymentAdviceHistorySelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,AdviceNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (AdviceNo, SerialNo)
  SELECT [SPMT_PaymentAdviceHistory].[AdviceNo], [SPMT_PaymentAdviceHistory].[SerialNo] FROM [SPMT_PaymentAdviceHistory]
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
   ( 
         STR(ISNULL([SPMT_PaymentAdviceHistory].[AdviceNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_PaymentAdviceHistory].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[TranTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[CostCenter],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[ConcernedHOD],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_PaymentAdviceHistory].[AdviceStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[AdviceStatusUser],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[RemarksHOD],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[RemarksHR],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdviceHistory].[RemarksAC],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'AdviceNo' THEN [SPMT_PaymentAdviceHistory].[AdviceNo] END,
     CASE @orderBy WHEN 'AdviceNo DESC' THEN [SPMT_PaymentAdviceHistory].[AdviceNo] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [SPMT_PaymentAdviceHistory].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [SPMT_PaymentAdviceHistory].[SerialNo] END DESC,
     CASE @orderBy WHEN 'TranTypeID' THEN [SPMT_PaymentAdviceHistory].[TranTypeID] END,
     CASE @orderBy WHEN 'TranTypeID DESC' THEN [SPMT_PaymentAdviceHistory].[TranTypeID] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_PaymentAdviceHistory].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_PaymentAdviceHistory].[VendorID] END DESC,
     CASE @orderBy WHEN 'CostCenter' THEN [SPMT_PaymentAdviceHistory].[CostCenter] END,
     CASE @orderBy WHEN 'CostCenter DESC' THEN [SPMT_PaymentAdviceHistory].[CostCenter] END DESC,
     CASE @orderBy WHEN 'ConcernedHOD' THEN [SPMT_PaymentAdviceHistory].[ConcernedHOD] END,
     CASE @orderBy WHEN 'ConcernedHOD DESC' THEN [SPMT_PaymentAdviceHistory].[ConcernedHOD] END DESC,
     CASE @orderBy WHEN 'AdviceStatusID' THEN [SPMT_PaymentAdviceHistory].[AdviceStatusID] END,
     CASE @orderBy WHEN 'AdviceStatusID DESC' THEN [SPMT_PaymentAdviceHistory].[AdviceStatusID] END DESC,
     CASE @orderBy WHEN 'AdviceStatusOn' THEN [SPMT_PaymentAdviceHistory].[AdviceStatusOn] END,
     CASE @orderBy WHEN 'AdviceStatusOn DESC' THEN [SPMT_PaymentAdviceHistory].[AdviceStatusOn] END DESC,
     CASE @orderBy WHEN 'AdviceStatusUser' THEN [SPMT_PaymentAdviceHistory].[AdviceStatusUser] END,
     CASE @orderBy WHEN 'AdviceStatusUser DESC' THEN [SPMT_PaymentAdviceHistory].[AdviceStatusUser] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [SPMT_PaymentAdviceHistory].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [SPMT_PaymentAdviceHistory].[Remarks] END DESC,
     CASE @orderBy WHEN 'RemarksHOD' THEN [SPMT_PaymentAdviceHistory].[RemarksHOD] END,
     CASE @orderBy WHEN 'RemarksHOD DESC' THEN [SPMT_PaymentAdviceHistory].[RemarksHOD] END DESC,
     CASE @orderBy WHEN 'RemarksHR' THEN [SPMT_PaymentAdviceHistory].[RemarksHR] END,
     CASE @orderBy WHEN 'RemarksHR DESC' THEN [SPMT_PaymentAdviceHistory].[RemarksHR] END DESC,
     CASE @orderBy WHEN 'RemarksAC' THEN [SPMT_PaymentAdviceHistory].[RemarksAC] END,
     CASE @orderBy WHEN 'RemarksAC DESC' THEN [SPMT_PaymentAdviceHistory].[RemarksAC] END DESC,
     CASE @orderBy WHEN 'Returned' THEN [SPMT_PaymentAdviceHistory].[Returned] END,
     CASE @orderBy WHEN 'Returned DESC' THEN [SPMT_PaymentAdviceHistory].[Returned] END DESC,
     CASE @orderBy WHEN 'Forward' THEN [SPMT_PaymentAdviceHistory].[Forward] END,
     CASE @orderBy WHEN 'Forward DESC' THEN [SPMT_PaymentAdviceHistory].[Forward] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'SPMT_PAStatus3_Description' THEN [SPMT_PAStatus3].[Description] END,
     CASE @orderBy WHEN 'SPMT_PAStatus3_Description DESC' THEN [SPMT_PAStatus3].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Vendors5_Description' THEN [SPMT_Vendors5].[Description] END,
     CASE @orderBy WHEN 'SPMT_Vendors5_Description DESC' THEN [SPMT_Vendors5].[Description] END DESC 

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
