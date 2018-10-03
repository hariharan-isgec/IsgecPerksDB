USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITComplaintResponseInsert]
  @CallID Int,
  @Remarks NVarChar(250),
  @AttendedOn DateTime,
  @AttendedBy NVarChar(8),
  @AutoPosted Bit,
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [ADM_ITComplaintResponse]
  (
   [CallID]
  ,[Remarks]
  ,[AttendedOn]
  ,[AttendedBy]
  ,[AutoPosted]
  )
  VALUES
  (
   @CallID
  ,@Remarks
  ,@AttendedOn
  ,@AttendedBy
  ,@AutoPosted
  )
  SET @Return_SerialNo = Scope_Identity()
GO
