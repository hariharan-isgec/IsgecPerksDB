USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServiceCheckPointsInsert]
  @ServiceID NVarChar(10),
  @CheckPointID Int,
  @Return_ServiceID NVarChar(10) = null OUTPUT
  AS
  INSERT [ADM_ServiceCheckPoints]
  (
   [ServiceID]
  ,[CheckPointID]
  )
  VALUES
  (
   @ServiceID
  ,@CheckPointID
  )
  SET @Return_ServiceID = @ServiceID
GO
