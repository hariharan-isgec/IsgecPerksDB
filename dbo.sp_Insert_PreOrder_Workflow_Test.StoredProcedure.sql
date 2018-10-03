USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_Insert_PreOrder_Workflow_Test]
@Parent_WFID int,
@Project	varchar(50),
@Element	varchar(50),
@SpecificationNo	varchar(100),
@PMDLDocNo varchar(100),
@Buyer	varchar(8),
@Manager varchar(8),
@UserId	varchar(8),
@WF_Status varchar(100)
AS
BEGIN
Declare @WFID int
SET @WFID=(SELECT (ISNULL(MAX(WFID),0) + 1)as WfId FROM WF1_PreOrder)

INSERT INTO [IJTPerks].[dbo].[WF1_PreOrder]
           ([WFID]
           ,[Parent_WFID]
           ,[Project]
           ,[Element]
           ,[SpecificationNo]
           ,[PMDLDocNo]
           ,[Buyer]
           ,[Manager]
           ,[WF_Status]
           ,[UserId]
          )
     VALUES
     (@WFID,@Parent_WFID,@Project,@Element,@SpecificationNo,@PMDLDocNo,@Buyer,@Manager,@WF_Status,@UserId)
     
  Select @WFID
END
GO
