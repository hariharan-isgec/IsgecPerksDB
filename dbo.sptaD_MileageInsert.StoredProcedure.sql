USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_MileageInsert]
  @CategoryID Int,
  @CityID NVarChar(30),
  @OtherCity Bit,
  @AmountPerKM Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_D_Mileage]
  (
   [CategoryID]
  ,[CityID]
  ,[OtherCity]
  ,[AmountPerKM]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @CategoryID
  ,@CityID
  ,@OtherCity
  ,@AmountPerKM
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
GO
