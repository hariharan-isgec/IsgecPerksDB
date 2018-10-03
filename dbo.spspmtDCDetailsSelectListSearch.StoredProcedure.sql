USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCDetailsSelectListSearch]
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
 ,ChallanID NVarChar(20) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ChallanID, SerialNo)
  SELECT [SPMT_DCDetails].[ChallanID], [SPMT_DCDetails].[SerialNo] FROM [SPMT_DCDetails]
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [SPMT_DCDetails].[BillTypeID] = [SPMT_BillTypes1].[BillType]
  INNER JOIN [SPMT_DCHeader] AS [SPMT_DCHeader2]
    ON [SPMT_DCDetails].[ChallanID] = [SPMT_DCHeader2].[ChallanID]
  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits3]
    ON [SPMT_DCDetails].[UOM] = [SPMT_ERPUnits3].[UOM]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes4]
    ON [SPMT_DCDetails].[BillTypeID] = [SPMT_HSNSACCodes4].[BillType]
    AND [SPMT_DCDetails].[HSNSACCode] = [SPMT_HSNSACCodes4].[HSNSACCode]
 WHERE  
   ( 
         STR(ISNULL([SPMT_DCDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCDetails].[ItemDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[BillTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCDetails].[HSNSACCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCDetails].[UOM],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[Price], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[AssessableValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[IGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[IGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[SGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[SGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[CGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[CGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[CessRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[CessAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[TotalGST], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCDetails].[TotalAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCDetails].[ChallanID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ChallanID' THEN [SPMT_DCDetails].[ChallanID] END,
     CASE @OrderBy WHEN 'ChallanID DESC' THEN [SPMT_DCDetails].[ChallanID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [SPMT_DCDetails].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [SPMT_DCDetails].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [SPMT_DCDetails].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [SPMT_DCDetails].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'BillTypeID' THEN [SPMT_DCDetails].[BillTypeID] END,
     CASE @OrderBy WHEN 'BillTypeID DESC' THEN [SPMT_DCDetails].[BillTypeID] END DESC,
     CASE @OrderBy WHEN 'HSNSACCode' THEN [SPMT_DCDetails].[HSNSACCode] END,
     CASE @OrderBy WHEN 'HSNSACCode DESC' THEN [SPMT_DCDetails].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'UOM' THEN [SPMT_DCDetails].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [SPMT_DCDetails].[UOM] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [SPMT_DCDetails].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [SPMT_DCDetails].[Quantity] END DESC,
     CASE @OrderBy WHEN 'Price' THEN [SPMT_DCDetails].[Price] END,
     CASE @OrderBy WHEN 'Price DESC' THEN [SPMT_DCDetails].[Price] END DESC,
     CASE @OrderBy WHEN 'AssessableValue' THEN [SPMT_DCDetails].[AssessableValue] END,
     CASE @OrderBy WHEN 'AssessableValue DESC' THEN [SPMT_DCDetails].[AssessableValue] END DESC,
     CASE @OrderBy WHEN 'IGSTRate' THEN [SPMT_DCDetails].[IGSTRate] END,
     CASE @OrderBy WHEN 'IGSTRate DESC' THEN [SPMT_DCDetails].[IGSTRate] END DESC,
     CASE @OrderBy WHEN 'IGSTAmount' THEN [SPMT_DCDetails].[IGSTAmount] END,
     CASE @OrderBy WHEN 'IGSTAmount DESC' THEN [SPMT_DCDetails].[IGSTAmount] END DESC,
     CASE @OrderBy WHEN 'SGSTRate' THEN [SPMT_DCDetails].[SGSTRate] END,
     CASE @OrderBy WHEN 'SGSTRate DESC' THEN [SPMT_DCDetails].[SGSTRate] END DESC,
     CASE @OrderBy WHEN 'SGSTAmount' THEN [SPMT_DCDetails].[SGSTAmount] END,
     CASE @OrderBy WHEN 'SGSTAmount DESC' THEN [SPMT_DCDetails].[SGSTAmount] END DESC,
     CASE @OrderBy WHEN 'CGSTRate' THEN [SPMT_DCDetails].[CGSTRate] END,
     CASE @OrderBy WHEN 'CGSTRate DESC' THEN [SPMT_DCDetails].[CGSTRate] END DESC,
     CASE @OrderBy WHEN 'CGSTAmount' THEN [SPMT_DCDetails].[CGSTAmount] END,
     CASE @OrderBy WHEN 'CGSTAmount DESC' THEN [SPMT_DCDetails].[CGSTAmount] END DESC,
     CASE @OrderBy WHEN 'CessRate' THEN [SPMT_DCDetails].[CessRate] END,
     CASE @OrderBy WHEN 'CessRate DESC' THEN [SPMT_DCDetails].[CessRate] END DESC,
     CASE @OrderBy WHEN 'CessAmount' THEN [SPMT_DCDetails].[CessAmount] END,
     CASE @OrderBy WHEN 'CessAmount DESC' THEN [SPMT_DCDetails].[CessAmount] END DESC,
     CASE @OrderBy WHEN 'TotalGST' THEN [SPMT_DCDetails].[TotalGST] END,
     CASE @OrderBy WHEN 'TotalGST DESC' THEN [SPMT_DCDetails].[TotalGST] END DESC,
     CASE @OrderBy WHEN 'TotalAmount' THEN [SPMT_DCDetails].[TotalAmount] END,
     CASE @OrderBy WHEN 'TotalAmount DESC' THEN [SPMT_DCDetails].[TotalAmount] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes1_Description' THEN [SPMT_BillTypes1].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes1_Description DESC' THEN [SPMT_BillTypes1].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_DCHeader2_Purpose' THEN [SPMT_DCHeader2].[Purpose] END,
     CASE @OrderBy WHEN 'SPMT_DCHeader2_Purpose DESC' THEN [SPMT_DCHeader2].[Purpose] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPUnits3_Description' THEN [SPMT_ERPUnits3].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPUnits3_Description DESC' THEN [SPMT_ERPUnits3].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes4_HSNSACCode' THEN [SPMT_HSNSACCodes4].[HSNSACCode] END,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes4_HSNSACCode DESC' THEN [SPMT_HSNSACCodes4].[HSNSACCode] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_DCDetails].* ,
    [SPMT_BillTypes1].[Description] AS SPMT_BillTypes1_Description,
    [SPMT_DCHeader2].[Purpose] AS SPMT_DCHeader2_Purpose,
    [SPMT_ERPUnits3].[Description] AS SPMT_ERPUnits3_Description,
    [SPMT_HSNSACCodes4].[HSNSACCode] AS SPMT_HSNSACCodes4_HSNSACCode 
  FROM [SPMT_DCDetails] 
      INNER JOIN #PageIndex
          ON [SPMT_DCDetails].[ChallanID] = #PageIndex.ChallanID
          AND [SPMT_DCDetails].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [SPMT_DCDetails].[BillTypeID] = [SPMT_BillTypes1].[BillType]
  INNER JOIN [SPMT_DCHeader] AS [SPMT_DCHeader2]
    ON [SPMT_DCDetails].[ChallanID] = [SPMT_DCHeader2].[ChallanID]
  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits3]
    ON [SPMT_DCDetails].[UOM] = [SPMT_ERPUnits3].[UOM]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes4]
    ON [SPMT_DCDetails].[BillTypeID] = [SPMT_HSNSACCodes4].[BillType]
    AND [SPMT_DCDetails].[HSNSACCode] = [SPMT_HSNSACCodes4].[HSNSACCode]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
