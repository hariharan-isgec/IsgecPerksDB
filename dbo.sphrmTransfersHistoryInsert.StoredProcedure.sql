USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmTransfersHistoryInsert]
  @CardNo NVarChar(8),
  @CompanyID NVarChar(6),
  @DivisionID NVarChar(6),
  @OfficeID Int,
  @DepartmentID NVarChar(6),
  @ProjectSiteID NVarChar(6),
  @TransferedOn DateTime,
  @Remarks NVarChar(250),
  @ActiveState Bit,
  @Executed Bit,
  @Cancelled Bit,
  @CreateEvent Bit,
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Return_TransferID Int = null OUTPUT
  AS
  INSERT [HRM_Transfers]
  (
   [CardNo]
  ,[CompanyID]
  ,[DivisionID]
  ,[OfficeID]
  ,[DepartmentID]
  ,[ProjectSiteID]
  ,[TransferedOn]
  ,[Remarks]
  ,[ActiveState]
  ,[Executed]
  ,[Cancelled]
	,[CreateEvent]
  ,[ProcessedBy]
  ,[ProcessedOn]
  )
  VALUES
  (
   @CardNo
  ,@CompanyID
  ,@DivisionID
  ,@OfficeID
  ,@DepartmentID
  ,@ProjectSiteID
  ,@TransferedOn
  ,@Remarks
  ,@ActiveState
  ,@Executed
  ,@Cancelled
  ,@CreateEvent
  ,@ProcessedBy
  ,@ProcessedOn
  )
  SET @Return_TransferID = Scope_Identity()
GO
