USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITServicesInsert]
  @ITServiceID NVarChar(15),
  @Description NVarChar(50),
  @AlertAfterDays Int,
  @EMailGroup NVarChar(50),
  @Return_ITServiceID NVarChar(15) = null OUTPUT
  AS
  INSERT [ADM_ITServices]
  (
   [ITServiceID]
  ,[Description]
  ,[AlertAfterDays]
  ,[EMailGroup]
  )
  VALUES
  (
   @ITServiceID
  ,@Description
  ,@AlertAfterDays
  ,@EMailGroup
  )
  SET @Return_ITServiceID = @ITServiceID
GO
