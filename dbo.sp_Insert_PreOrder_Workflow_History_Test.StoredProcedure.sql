USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_Insert_PreOrder_Workflow_History_Test]
@WFID int,
@Parent_WFID int,
@Project	varchar(50),
@Element	varchar(50),
@SpecificationNo	varchar(100),
@PMDLDocNo varchar(100),
@Buyer	varchar(8),
@Manager varchar(8),
@WF_Status varchar(100),
@UserId	varchar(8),
@Supplier	varchar(50),
@SupplierName varchar(100),
@Notes varchar(Max)=''

AS
BEGIN
Declare @WF_HistoryID int
Declare @WF_SlNo int
SET @WF_HistoryID=(SELECT (ISNULL(MAX(WF_HistoryID),0) + 1)as WfId FROM [WF1_PreOrder_History])
SET @WF_SlNo=(SELECT (ISNULL(MAX(WFID_SlNo),0) + 1)as WfId FROM [WF1_PreOrder_History] WHERE [WFID]=@WFID)

INSERT INTO [IJTPerks].[dbo].[WF1_PreOrder_History]
           ([WF_HistoryID]
           ,[WFID]
           ,[WFID_SlNo]
           ,[Parent_WFID]
           ,[Project]
           ,[Element]
           ,[SpecificationNo]
           ,[PMDLDocNo]
           ,[Buyer]
           ,[Manager]
           ,[WF_Status]
           ,[UserId]
           ,[DateTime]
           ,[Supplier]
           ,[SupplierName]
           ,[Notes])
     VALUES
   (@WF_HistoryID,@WFID,@WF_SlNo,@Parent_WFID,@Project,@Element,@SpecificationNo,@PMDLDocNo,@Buyer,@Manager,@WF_Status,@UserId,getDate(),@Supplier,@SupplierName,@Notes)
   
   
   select @WFID,@WF_SlNo
   
   
END
GO
