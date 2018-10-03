USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_ForeignTravelInsert]
  @Bord_Lodg_DA_Percent Decimal(10,2),
  @Lodg_DA_Percent Decimal(10,2),
  @DA_Adjested_LC_Percent Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_F_ForeignTravel]
  (
   [Bord_Lodg_DA_Percent]
  ,[Lodg_DA_Percent]
  ,[DA_Adjested_LC_Percent]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @Bord_Lodg_DA_Percent
  ,@Lodg_DA_Percent
  ,@DA_Adjested_LC_Percent
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
GO
