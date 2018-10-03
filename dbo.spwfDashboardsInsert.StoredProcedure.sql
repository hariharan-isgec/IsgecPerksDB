USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDashboardsInsert]
  @DBDescription NVarChar(50),
  @DBTitle NVarChar(100),
  @TitleStyle NVarChar(250),
  @Active Bit,
  @InitializedByMe Bit,
  @DBIconID Int,
  @NotToDraw Bit,
  @DBRowTypeID Int,
  @GraphTypeID Int,
  @ConvertForGraph Bit,
  @Return_DashboardID Int = null OUTPUT 
  AS
  INSERT [WF_Dashboards]
  (
   [DBDescription]
  ,[DBTitle]
  ,[TitleStyle]
  ,[Active]
  ,[InitializedByMe]
  ,[DBIconID]
  ,[NotToDraw]
  ,[DBRowTypeID]
  ,[GraphTypeID]
  ,[ConvertForGraph]
  )
  VALUES
  (
   @DBDescription
  ,@DBTitle
  ,@TitleStyle
  ,@Active
  ,@InitializedByMe
  ,@DBIconID
  ,@NotToDraw
  ,@DBRowTypeID
  ,@GraphTypeID
  ,@ConvertForGraph
  )
  SET @Return_DashboardID = Scope_Identity()
GO
