USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TOSv_TasksWithoutCLPItems]
AS
SELECT     TOP (100) PERCENT ProjectID, TaskID, Description, wuDefined, wuEntered, wuBalance, stdtDefined, endtDefined, stdtActual, endtActual, Sequence, 
                      ElementID, FunctionalAreaID, TaskTypeID, Active, wuNoteID, AssignedTo, Predecessors, Successors, ParentTaskID, IsParent
FROM         dbo.TOS_Tasks
WHERE     (TaskID NOT IN
                          (SELECT     ad1TaskID AS tt
                            FROM          dbo.TOS_CLPs AS TOS_CLPs_10
                            WHERE      (ProjectID = dbo.TOS_Tasks.ProjectID) AND (ad1TaskID IS NOT NULL)
                            UNION ALL
                            SELECT     ad2TaskID AS tt
                            FROM         dbo.TOS_CLPs AS TOS_CLPs_9
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (ad2TaskID IS NOT NULL)
                            UNION ALL
                            SELECT     ad3TaskID AS tt
                            FROM         dbo.TOS_CLPs AS TOS_CLPs_8
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (ad3TaskID IS NOT NULL)
                            UNION ALL
                            SELECT     ad4TaskID AS tt
                            FROM         dbo.TOS_CLPs AS TOS_CLPs_7
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (ad4TaskID IS NOT NULL)
                            UNION ALL
                            SELECT     recTaskID AS tt
                            FROM         dbo.TOS_CLPs AS TOS_CLPs_6
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (recTaskID IS NOT NULL)
                            UNION ALL
                            SELECT     ioTaskID AS tt
                            FROM         dbo.TOS_CLPs AS TOS_CLPs_5
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (ioTaskID IS NOT NULL)
                            UNION ALL
                            SELECT     engTaskID AS tt
                            FROM         dbo.TOS_CLPs AS tos_clps_4
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (engTaskID IS NOT NULL)
                            UNION ALL
                            SELECT     ordTaskID AS tt
                            FROM         dbo.TOS_CLPs AS TOS_CLPs_3
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (ordTaskID IS NOT NULL)
                            UNION ALL
                            SELECT     desTaskID AS tt
                            FROM         dbo.TOS_CLPs AS TOS_CLPs_2
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (desTaskID IS NOT NULL)
                            UNION ALL
                            SELECT     ereTaskID AS tt
                            FROM         dbo.TOS_CLPs AS TOS_CLPs_1
                            WHERE     (ProjectID = dbo.TOS_Tasks.ProjectID) AND (ereTaskID IS NOT NULL)))
ORDER BY ProjectID, TaskID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[16] 2[15] 3) )"
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
         Begin Table = "TOS_Tasks"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 201
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
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TOSv_TasksWithoutCLPItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TOSv_TasksWithoutCLPItems'
GO
