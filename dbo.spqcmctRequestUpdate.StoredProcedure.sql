USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmctRequestUpdate]
  @Original_QCRequestNo Int, 
  @Original_SerialNo Int, 
  @Original_PONumber NVarChar(9), 
  @Original_ItemReference VarChar(200), 
  @Original_ActivityID VarChar(9), 
  @QCRequestNo Int,
  @SerialNo Int,
  @PONumber NVarChar(9),
  @ItemReference VarChar(200),
  @ActivityID VarChar(9),
  @ItemUnit VarChar(20),
  @Activity2Desc VarChar(150),
  @Activity3Desc VarChar(150),
  @Activity4Desc VarChar(150),
  @Handle VarChar(50),
  @ProgressPercent Decimal(18,4),
  @Quantity Decimal(18,4),
  @PercentOfQuantity Decimal(18,4),
  @PartialOrFull VarChar(10),
  @NotSelectedList VarChar(500),
  @SelectedList VarChar(500),
  @Product VarChar(9),
  @Project VarChar(9),
  @GridLineStatus Int,
  @InspectionStageiD Int,
  @IrefWeight Decimal(18,4),
  @ProgressWeight Decimal(18,4),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_CT_Request] SET 
   [QCRequestNo] = @QCRequestNo
  ,[SerialNo] = @SerialNo
  ,[PONumber] = @PONumber
  ,[ItemReference] = @ItemReference
  ,[ActivityID] = @ActivityID
  ,[ItemUnit] = @ItemUnit
  ,[Activity2Desc] = @Activity2Desc
  ,[Activity3Desc] = @Activity3Desc
  ,[Activity4Desc] = @Activity4Desc
  ,[Handle] = @Handle
  ,[ProgressPercent] = @ProgressPercent
  ,[Quantity] = @Quantity
  ,[PercentOfQuantity] = @PercentOfQuantity
  ,[PartialOrFull] = @PartialOrFull
  ,[NotSelectedList] = @NotSelectedList
  ,[SelectedList] = @SelectedList
  ,[Product] = @Product
  ,[Project] = @Project
  ,[GridLineStatus] = @GridLineStatus
  ,[InspectionStageiD] = @InspectionStageiD
  ,[IrefWeight] = @IrefWeight
  ,[ProgressWeight] = @ProgressWeight
  WHERE
  [QCRequestNo] = @Original_QCRequestNo
  AND [SerialNo] = @Original_SerialNo
  AND [PONumber] = @Original_PONumber
  AND [ItemReference] = @Original_ItemReference
  AND [ActivityID] = @Original_ActivityID
  SET @RowCount = @@RowCount
GO
