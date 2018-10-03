USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TOS_OrdCLPs]
AS
SELECT     TOP (100) PERCENT dbo.TOS_Projects.ProjectID, dbo.TOS_Projects.Description AS ProjectName, dbo.TOS_CLPDataDetails.CLPID, 
                      dbo.TOS_CLPDataDetails.Description AS CLPName, dbo.TOS_CLPDataDetails.Quantity, dbo.TOS_CLPDataDetails.DisplayType, 
                      dbo.TOS_CLPDataDetails.Sequence, DATEDIFF(d, dbo.TOS_CLPDataDetails.ordEndtDefined, dbo.TOS_CLPDataDetails.ordEndtActual) AS DelayDays, 
                      dbo.TOS_Tasks.wuDefined, dbo.TOS_Tasks.wuEntered, dbo.TOS_Tasks.wuBalance, dbo.TOS_Tasks.stdtDefined, dbo.TOS_Tasks.endtDefined, 
                      dbo.TOS_Tasks.stdtActual, dbo.TOS_Tasks.endtActual, dbo.TOS_Tasks.ElementID, dbo.TOS_Tasks.AssignedTo, 
                      dbo.TOS_FunctionalArea.Description AS FunctionalArea, dbo.TOS_CLPDataDetails.ordEndtDefined, dbo.TOS_CLPDataDetails.ordEndtActual, 
                      dbo.TOS_CLPDataDetails.orddelayStatus
FROM         dbo.TOS_CLPDataDetails INNER JOIN
                      dbo.TOS_BaseClpData ON dbo.TOS_CLPDataDetails.ProjectID = dbo.TOS_BaseClpData.ProjectID AND 
                      dbo.TOS_CLPDataDetails.ProgressID = dbo.TOS_BaseClpData.ProgressID INNER JOIN
                      dbo.TOS_CLPs ON dbo.TOS_CLPDataDetails.ProjectID = dbo.TOS_CLPs.ProjectID AND 
                      dbo.TOS_CLPDataDetails.CLPID = dbo.TOS_CLPs.CLPID INNER JOIN
                      dbo.TOS_Tasks ON dbo.TOS_CLPs.ProjectID = dbo.TOS_Tasks.ProjectID AND dbo.TOS_CLPs.ordTaskID = dbo.TOS_Tasks.TaskID INNER JOIN
                      dbo.TOS_Projects ON dbo.TOS_BaseClpData.ProjectID = dbo.TOS_Projects.ProjectID LEFT OUTER JOIN
                      dbo.TOS_FunctionalArea ON dbo.TOS_Tasks.FunctionalAreaID = dbo.TOS_FunctionalArea.FunctionalAreaID
ORDER BY dbo.TOS_Projects.ProjectID, dbo.TOS_CLPDataDetails.Sequence
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[12] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TOS_CLPDataDetails"
            Begin Extent = 
               Top = 2
               Left = 8
               Bottom = 173
               Right = 165
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TOS_BaseClpData"
            Begin Extent = 
               Top = 5
               Left = 494
               Bottom = 83
               Right = 645
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TOS_CLPs"
            Begin Extent = 
               Top = 93
               Left = 513
               Bottom = 294
               Right = 664
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TOS_Tasks"
            Begin Extent = 
               Top = 134
               Left = 237
               Bottom = 301
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TOS_Projects"
            Begin Extent = 
               Top = 6
               Left = 735
               Bottom = 114
               Right = 886
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TOS_FunctionalArea"
            Begin Extent = 
               Top = 191
               Left = 18
               Bottom = 269
               Right = 181
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TOS_OrdCLPs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TOS_OrdCLPs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TOS_OrdCLPs'
GO
