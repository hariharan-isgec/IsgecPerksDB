USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperp_LG_CreateTPTBillGetByReceiptDate]
  @FromDate DateTime,
  @ToDate DateTime,
  @StartRowIndex int,
  @MaximumRows int,
  @StatusID NVarChar(8),
  @LoginID NVarChar(8),
  @RecordCount Int = 0 OUTPUT   
 AS   
  BEGIN   
  DECLARE @LGSQL VarChar(8000)    
  CREATE TABLE #PageIndex (   
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )   
   INSERT INTO #PageIndex (SerialNo)
   SELECT [ERP_TransporterBill].[SerialNo] FROM [ERP_TransporterBill] 
   WHERE  [ERP_TransporterBill].[TPTBillReceivedOn] BetWeen @FromDate  AND @ToDate     
     AND [ERP_TransporterBill].[BillStatus] = @StatusID  
	      
  SET @RecordCount = @@RowCount

  SELECT
		[ERP_TransporterBill].* ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName,
		[aspnet_Users6].[UserFullName] AS aspnet_Users6_UserFullName,
		[aspnet_Users7].[UserFullName] AS aspnet_Users7_UserFullName,
		[ERP_TPTBillStatus8].[Description] AS ERP_TPTBillStatus8_Description,
		[IDM_Projects9].[Description] AS IDM_Projects9_Description,
		[VR_Transporters10].[TransporterName] AS VR_Transporters10_TransporterName 
  FROM [ERP_TransporterBill] 
    	INNER JOIN #PageIndex
          ON [ERP_TransporterBill].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ERP_TransporterBill].[FWDToAccountsBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [ERP_TransporterBill].[RECDinAccountsBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [ERP_TransporterBill].[DiscReturnedinAcBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [ERP_TransporterBill].[DiscReturnedToByAC] = [aspnet_Users4].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users5]
    ON [ERP_TransporterBill].[DiscRecdInLgstBy] = [aspnet_Users5].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users6]
    ON [ERP_TransporterBill].[ReFwdToAcBy] = [aspnet_Users6].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users7]
    ON [ERP_TransporterBill].[CreatedBy] = [aspnet_Users7].[LoginID]
  LEFT OUTER JOIN [ERP_TPTBillStatus] AS [ERP_TPTBillStatus8]
    ON [ERP_TransporterBill].[BillStatus] = [ERP_TPTBillStatus8].[BillStatusID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]
    ON [ERP_TransporterBill].[ProjectID] = [IDM_Projects9].[ProjectID]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters10]
    ON [ERP_TransporterBill].[TPTCode] = [VR_Transporters10].[TransporterID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
