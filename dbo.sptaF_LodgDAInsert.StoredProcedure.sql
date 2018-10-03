USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_LodgDAInsert]
  @CategoryID Int,
  @RegionID NVarChar(10),
  @Lodging Decimal(10,2),
  @DA Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_F_LodgDA]
  (
   [CategoryID]
  ,[RegionID]
  ,[Lodging]
  ,[DA]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @CategoryID
  ,@RegionID
  ,@Lodging
  ,@DA
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
GO
