USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IT_CallView]
AS
SELECT        dbo.ADM_ITComplaints.CallID, dbo.ADM_ITComplaints.EndUserID, dbo.HRM_Employees.EmployeeName, dbo.HRM_Departments.Description AS DepartmentDescription, dbo.HRM_Offices.Description AS Location, 
                         REPLACE(REPLACE(dbo.ADM_ITComplaints.Description, '
', ' '), '
', ' ') AS CallDesc, dbo.ADM_ITComplaints.CallSubTypeID, dbo.ADM_ITCallSubTypes.Description, dbo.ADM_ITComplaints.AssignedTo, 
                         dbo.ADM_ITComplaints.CallStatusID, dbo.ADM_ITComplaints.LoggedOn, dbo.ADM_ITComplaints.LoggedBy, dbo.ADM_ITComplaints.FirstAttendedOn, dbo.ADM_ITComplaints.ClosedOn, dbo.ADM_ITComplaints.FirstAttended, 
                         dbo.ADM_ITComplaints.Closed, dbo.ADM_ITComplaints.CallReceivedOn, dbo.ADM_ITCallTypes.Description AS CallTypeID
FROM            dbo.ADM_ITComplaints INNER JOIN
                         dbo.HRM_Employees ON dbo.ADM_ITComplaints.EndUserID = dbo.HRM_Employees.CardNo INNER JOIN
                         dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID INNER JOIN
                         dbo.HRM_Offices ON dbo.HRM_Employees.C_OfficeID = dbo.HRM_Offices.OfficeID INNER JOIN
                         dbo.ADM_ITCallTypes ON dbo.ADM_ITComplaints.CallTypeID = dbo.ADM_ITCallTypes.CallTypeID LEFT OUTER JOIN
                         dbo.ADM_ITCallSubTypes ON dbo.ADM_ITComplaints.CallSubTypeID = dbo.ADM_ITCallSubTypes.CallSubTypeID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[22] 2[15] 3) )"
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ADM_ITComplaints"
            Begin Extent = 
               Top = 7
               Left = 12
               Bottom = 290
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 114
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 96
               Left = 530
               Bottom = 275
               Right = 692
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 6
               Left = 686
               Bottom = 259
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_ITCallTypes"
            Begin Extent = 
               Top = 165
               Left = 283
               Bottom = 285
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_ITCallSubTypes"
            Begin Extent = 
               Top = 268
               Left = 731
               Bottom = 381
               Right = 901
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
      Begin ColumnWidths = 19
         Width = 284
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IT_CallView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Width = 1500
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
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2670
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IT_CallView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IT_CallView'
GO
