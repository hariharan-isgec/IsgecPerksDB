USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDashboardsUpdate]
  @Original_DashboardID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_Dashboards] SET 
   [DBDescription] = @DBDescription
  ,[DBTitle] = @DBTitle
  ,[TitleStyle] = @TitleStyle
  ,[Active] = @Active
  ,[InitializedByMe] = @InitializedByMe
  ,[DBIconID] = @DBIconID
  ,[NotToDraw] = @NotToDraw
  ,[DBRowTypeID] = @DBRowTypeID
  ,[GraphTypeID] = @GraphTypeID
  ,[ConvertForGraph] = @ConvertForGraph
  WHERE
  [DashboardID] = @Original_DashboardID
  SET @RowCount = @@RowCount
GO
