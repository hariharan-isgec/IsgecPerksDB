USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UnderPosting]
AS
SELECT     dbo.ATN_ApplHeader.LeaveApplID, dbo.ATN_ApplHeader.CardNo, dbo.ATN_ApplHeader.ApplStatusID, dbo.ATN_ApplHeader.PostedOn, 
                      dbo.ATN_Attendance.AttenID, dbo.ATN_Attendance.AttenDate, dbo.ATN_Attendance.ApplStatusID AS Expr1, dbo.ATN_Attendance.Posted, 
                      dbo.ATN_Attendance.AdvanceApplication, dbo.ATN_LeaveLedger.Days, dbo.ATN_LeaveLedger.InProcessDays
FROM         dbo.ATN_ApplHeader INNER JOIN
                      dbo.ATN_Attendance ON dbo.ATN_ApplHeader.LeaveApplID = dbo.ATN_Attendance.ApplHeaderID INNER JOIN
                      dbo.ATN_LeaveLedger ON dbo.ATN_Attendance.AttenID = dbo.ATN_LeaveLedger.ApplDetailID
WHERE     (dbo.ATN_ApplHeader.AdvanceApplication = 1) AND (NOT (dbo.ATN_ApplHeader.PostedOn IS NULL)) AND (dbo.ATN_ApplHeader.ApplStatusID = 6) AND 
                      (dbo.ATN_Attendance.Posted = 1) AND (dbo.ATN_Attendance.ApplStatusID = 5)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[16] 4[12] 2[14] 3) )"
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
         Begin Table = "ATN_ApplHeader"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 114
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 18
         End
         Begin Table = "ATN_LeaveLedger"
            Begin Extent = 
               Top = 3
               Left = 536
               Bottom = 111
               Right = 687
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1095
         Width = 885
         Width = 810
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UnderPosting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UnderPosting'
GO
