USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_TravelModesInsert]
  @CategoryID Int,
  @TravelModeID Int,
  @EntitlementText NVarChar(250),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_F_TravelModes]
  (
   [CategoryID]
  ,[TravelModeID]
  ,[EntitlementText]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @CategoryID
  ,@TravelModeID
  ,@EntitlementText
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
GO
