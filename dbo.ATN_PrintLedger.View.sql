USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_PrintLedger]
AS
SELECT     TOP (100) PERCENT dbo.ATN_LeaveLedger.CardNo, dbo.ATN_Attendance.AttenDate, dbo.ATN_LeaveLedger.LeaveTypeID, 
                      dbo.ATN_LeaveLedger.Days, HRM_Employees_2.EmployeeName, HRM_Employees_1.EmployeeName AS VerifiedBy, 
                      dbo.HRM_Employees.EmployeeName AS ApprovedBy, dbo.ATN_LeaveLedger.FinYear AS Year, MONTH(dbo.ATN_LeaveLedger.TranDate) AS Month, 
                      UPPER(dbo.ATN_ApplHeader.Remarks) AS Remarks, UPPER(dbo.ATN_Attendance.Destination) AS Destination, UPPER(dbo.ATN_Attendance.Purpose) 
                      AS Purpose, dbo.ATN_LeaveTypes.Sequence
FROM         dbo.HRM_Employees RIGHT OUTER JOIN
                      dbo.HRM_Employees AS HRM_Employees_1 RIGHT OUTER JOIN
                      dbo.ATN_LeaveTypes INNER JOIN
                      dbo.ATN_LeaveLedger INNER JOIN
                      dbo.HRM_Employees AS HRM_Employees_2 INNER JOIN
                      dbo.ATN_Attendance ON HRM_Employees_2.CardNo = dbo.ATN_Attendance.CardNo ON 
                      dbo.ATN_LeaveLedger.ApplDetailID = dbo.ATN_Attendance.AttenID INNER JOIN
                      dbo.ATN_ApplHeader ON dbo.ATN_LeaveLedger.ApplHeaderID = dbo.ATN_ApplHeader.LeaveApplID ON 
                      dbo.ATN_LeaveTypes.LeaveTypeID = dbo.ATN_LeaveLedger.LeaveTypeID ON HRM_Employees_1.CardNo = dbo.ATN_ApplHeader.VerifiedBy ON 
                      dbo.HRM_Employees.CardNo = dbo.ATN_ApplHeader.ApprovedBy
WHERE     (dbo.ATN_LeaveLedger.Days < 0) AND (dbo.ATN_LeaveLedger.TranType = N'TRN') AND (dbo.ATN_LeaveTypes.Applyiable = 1)
ORDER BY dbo.ATN_LeaveLedger.CardNo, dbo.ATN_Attendance.AttenDate, dbo.ATN_LeaveTypes.Sequence
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[23] 2[23] 3) )"
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
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 54
               Left = 775
               Bottom = 102
               Right = 966
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "HRM_Employees_1"
            Begin Extent = 
               Top = 4
               Left = 774
               Bottom = 52
               Right = 965
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ATN_LeaveTypes"
            Begin Extent = 
               Top = 90
               Left = 0
               Bottom = 198
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "ATN_LeaveLedger"
            Begin Extent = 
               Top = 5
               Left = 246
               Bottom = 266
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_2"
            Begin Extent = 
               Top = 214
               Left = 783
               Bottom = 279
               Right = 974
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 183
               Left = 525
               Bottom = 276
               Right = 710
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "ATN_ApplHeader"
            Begin Extent = 
               Top = 0
               Left = 517
               Bottom = 68
               Right = 693
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_PrintLedger'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            End
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
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Column = 2835
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_PrintLedger'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_PrintLedger'
GO
