USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBPreOrderHistoryInsert]
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
  @Return_WFID Int = null OUTPUT 
  AS
  INSERT [WF1_PreOrder_History]
  (
   [WFID]
  ,[Project]
  ,[Element]
  ,[SpecificationNo]
  ,[Buyer]
  ,[SupplierName]
  ,[Supplier]
  ,[Notes]
  ,[DateTime]
  ,[UserId]
  ,[Parent_WFID]
  ,[WFID_SlNo]
  ,[WF_Status]
  ,[WF_HistoryID]
  )
  VALUES
  (
   @WFID
  ,@Project
  ,@Element
  ,@SpecificationNo
  ,@Buyer
  ,@SupplierName
  ,@Supplier
  ,@Notes
  ,@DateTime
  ,@UserId
  ,@Parent_WFID
  ,@WFID_SlNo
  ,@WF_Status
  ,@WF_HistoryID
  )
  SET @Return_WFID = @WFID
GO
