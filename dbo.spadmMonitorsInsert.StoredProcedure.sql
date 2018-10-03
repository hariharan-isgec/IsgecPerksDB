USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMonitorsInsert]
  @ServiceID NVarChar(10),
  @MonitorID NVarChar(8),
  @Return_ServiceID NVarChar(10) = null OUTPUT
  AS
  INSERT [ADM_Monitors]
  (
   [ServiceID]
  ,[MonitorID]
  )
  VALUES
  (
   @ServiceID
  ,@MonitorID
  )
  SET @Return_ServiceID = @ServiceID
GO
