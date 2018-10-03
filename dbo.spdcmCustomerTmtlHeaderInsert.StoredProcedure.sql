USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlHeaderInsert]
  @ProjectID NVarChar(6),
  @CustomerID NVarChar(6),
  @TmtlReference NVarChar(30),
  @Subject NVarChar(500),
  @Remarks NVarChar(1000),
  @TmtlStatusID NVarChar(1),
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @Return_TmtlID Int = null OUTPUT
  AS
  INSERT [DCM_CustomerTmtlHeader]
  (
   [ProjectID]
  ,[CustomerID]
  ,[TmtlReference]
  ,[Subject]
  ,[Remarks]
  ,[TmtlStatusID]
  ,[CreatedOn]
  ,[CreatedBy]
  )
  VALUES
  (
   @ProjectID
  ,@CustomerID
  ,@TmtlReference
  ,@Subject
  ,@Remarks
  ,@TmtlStatusID
  ,@CreatedOn
  ,@CreatedBy
  )
  SET @Return_TmtlID = Scope_Identity()
GO
