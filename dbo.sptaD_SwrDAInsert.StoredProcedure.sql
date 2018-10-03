USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_SwrDAInsert]
  @CategoryID Int,
  @CityTypeID NVarChar(6),
  @HotelStayDA Decimal(10,2),
  @SwrDA Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_D_SwrDA]
  (
   [CategoryID]
  ,[CityTypeID]
  ,[HotelStayDA]
  ,[SwrDA]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @CategoryID
  ,@CityTypeID
  ,@HotelStayDA
  ,@SwrDA
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
GO
