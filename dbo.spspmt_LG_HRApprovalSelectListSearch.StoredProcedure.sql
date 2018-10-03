USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_LG_HRApprovalSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @AdviceStatusID Int,
  @OrderBy NVarChar(50),
  @LoginID NVarChar(8), 
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,AdviceNo Int NOT NULL
  )
  INSERT INTO #PageIndex (AdviceNo)
  SELECT [SPMT_PaymentAdvice].[AdviceNo] FROM [SPMT_PaymentAdvice]
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
 WHERE [SPMT_TranTypes4].[GroupID] IN (SELECT GroupID FROM SYS_GroupLogins WHERE LoginID = @LoginID)     
   AND [SPMT_PaymentAdvice].[AdviceStatusID] = (@AdviceStatusID)
   AND ( 
         STR(ISNULL([SPMT_PaymentAdvice].[AdviceNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[TranTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[CostCenter],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[ConcernedHOD],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_PaymentAdvice].[AdviceStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[AdviceStatusUser],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksHOD],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksHR],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksAC],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'AdviceNo' THEN [SPMT_PaymentAdvice].[AdviceNo] END,
     CASE @orderBy WHEN 'AdviceNo DESC' THEN [SPMT_PaymentAdvice].[AdviceNo] END DESC,
     CASE @orderBy WHEN 'TranTypeID' THEN [SPMT_PaymentAdvice].[TranTypeID] END,
     CASE @orderBy WHEN 'TranTypeID DESC' THEN [SPMT_PaymentAdvice].[TranTypeID] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_PaymentAdvice].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_PaymentAdvice].[VendorID] END DESC,
     CASE @orderBy WHEN 'CostCenter' THEN [SPMT_PaymentAdvice].[CostCenter] END,
     CASE @orderBy WHEN 'CostCenter DESC' THEN [SPMT_PaymentAdvice].[CostCenter] END DESC,
     CASE @orderBy WHEN 'ConcernedHOD' THEN [SPMT_PaymentAdvice].[ConcernedHOD] END,
     CASE @orderBy WHEN 'ConcernedHOD DESC' THEN [SPMT_PaymentAdvice].[ConcernedHOD] END DESC,
     CASE @orderBy WHEN 'AdviceStatusID' THEN [SPMT_PaymentAdvice].[AdviceStatusID] END,
     CASE @orderBy WHEN 'AdviceStatusID DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusID] END DESC,
     CASE @orderBy WHEN 'AdviceStatusOn' THEN [SPMT_PaymentAdvice].[AdviceStatusOn] END,
     CASE @orderBy WHEN 'AdviceStatusOn DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusOn] END DESC,
     CASE @orderBy WHEN 'AdviceStatusUser' THEN [SPMT_PaymentAdvice].[AdviceStatusUser] END,
     CASE @orderBy WHEN 'AdviceStatusUser DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusUser] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [SPMT_PaymentAdvice].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [SPMT_PaymentAdvice].[Remarks] END DESC,
     CASE @orderBy WHEN 'RemarksHOD' THEN [SPMT_PaymentAdvice].[RemarksHOD] END,
     CASE @orderBy WHEN 'RemarksHOD DESC' THEN [SPMT_PaymentAdvice].[RemarksHOD] END DESC,
     CASE @orderBy WHEN 'RemarksHR' THEN [SPMT_PaymentAdvice].[RemarksHR] END,
     CASE @orderBy WHEN 'RemarksHR DESC' THEN [SPMT_PaymentAdvice].[RemarksHR] END DESC,
     CASE @orderBy WHEN 'RemarksAC' THEN [SPMT_PaymentAdvice].[RemarksAC] END,
     CASE @orderBy WHEN 'RemarksAC DESC' THEN [SPMT_PaymentAdvice].[RemarksAC] END DESC,
     CASE @orderBy WHEN 'Returned' THEN [SPMT_PaymentAdvice].[Returned] END,
     CASE @orderBy WHEN 'Returned DESC' THEN [SPMT_PaymentAdvice].[Returned] END DESC,
     CASE @orderBy WHEN 'Forward' THEN [SPMT_PaymentAdvice].[Forward] END,
     CASE @orderBy WHEN 'Forward DESC' THEN [SPMT_PaymentAdvice].[Forward] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'SPMT_PAStatus3_Description' THEN [SPMT_PAStatus3].[Description] END,
     CASE @orderBy WHEN 'SPMT_PAStatus3_Description DESC' THEN [SPMT_PAStatus3].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_TranTypes4_Description' THEN [SPMT_TranTypes4].[Description] END,
     CASE @orderBy WHEN 'SPMT_TranTypes4_Description DESC' THEN [SPMT_TranTypes4].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Vendors5_Description' THEN [SPMT_Vendors5].[Description] END,
     CASE @orderBy WHEN 'SPMT_Vendors5_Description DESC' THEN [SPMT_Vendors5].[Description] END DESC 

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
