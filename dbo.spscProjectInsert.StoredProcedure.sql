USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscProjectInsert]
  @RequestID Int,
  @ProjectID NVarChar(6),
  @ElementID NVarChar(8),
  @Amount Decimal(18,2),
  @IsFromProject Bit,
  @Return_RequestID Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [SC_Project]
  (
   [RequestID]
  ,[ProjectID]
  ,[ElementID]
  ,[Amount]
  ,[IsFromProject]
  )
  VALUES
  (
   @RequestID
  ,@ProjectID
  ,@ElementID
  ,@Amount
  ,@IsFromProject
  )
  SET @Return_RequestID = @RequestID
  SET @Return_SerialNo = Scope_Identity()
GO
