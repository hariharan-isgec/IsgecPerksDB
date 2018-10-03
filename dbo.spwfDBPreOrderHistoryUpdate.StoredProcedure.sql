USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBPreOrderHistoryUpdate]
  @Original_WFID Int, 
  @WFID Int,
  @Project VarChar(50),
  @Element VarChar(50),
  @SpecificationNo VarChar(100),
  @Buyer VarChar(8),
  @SupplierName VarChar(100),
  @Supplier VarChar(50),
  @Notes VarChar(4000),
  @DateTime DateTime,
  @UserId VarChar(8),
  @Parent_WFID Int,
  @WFID_SlNo Int,
  @WF_Status VarChar(100),
  @WF_HistoryID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF1_PreOrder_History] SET 
   [WFID] = @WFID
  ,[Project] = @Project
  ,[Element] = @Element
  ,[SpecificationNo] = @SpecificationNo
  ,[Buyer] = @Buyer
  ,[SupplierName] = @SupplierName
  ,[Supplier] = @Supplier
  ,[Notes] = @Notes
  ,[DateTime] = @DateTime
  ,[UserId] = @UserId
  ,[Parent_WFID] = @Parent_WFID
  ,[WFID_SlNo] = @WFID_SlNo
  ,[WF_Status] = @WF_Status
  ,[WF_HistoryID] = @WF_HistoryID
  WHERE
  [WFID] = @Original_WFID
  SET @RowCount = @@RowCount
GO
