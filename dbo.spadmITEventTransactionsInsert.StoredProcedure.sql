USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventTransactionsInsert]
  @EventDate DateTime,
  @CardNo NVarChar(8),
  @Description NVarChar(100),
  @Circular nText,
  @Return_EventID Int = null OUTPUT
  AS
  INSERT [ADM_ITEventTransactions]
  (
   [EventDate]
  ,[CardNo]
  ,[Description]
  ,[Circular]
  )
  VALUES
  (
   @EventDate
  ,@CardNo
  ,@Description
  ,@Circular 
  )
  SET @Return_EventID = Scope_Identity()
GO
