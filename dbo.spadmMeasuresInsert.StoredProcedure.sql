USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMeasuresInsert]
  @Description NVarChar(100),
  @MonitoringMechanism NVarChar(100),
  @Return_MeasureID Int = null OUTPUT
  AS
  INSERT [ADM_Measures]
  (
   [Description]
  ,[MonitoringMechanism]
  )
  VALUES
  (
   @Description
  ,@MonitoringMechanism
  )
  SET @Return_MeasureID = Scope_Identity()
GO
