USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LodgingInsert]
  @CategoryID Int,
  @CityTypeID NVarChar(6),
  @LodgingAmount Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_D_Lodging]
  (
   [CategoryID]
  ,[CityTypeID]
  ,[LodgingAmount]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @CategoryID
  ,@CityTypeID
  ,@LodgingAmount
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
GO
