USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PMSv_PmsApprovers]
AS
SELECT     dbo.PMS_Approvers.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Divisions.Description AS Division, 
                      dbo.HRM_Departments.Description AS Department, dbo.HRM_Designations.Description AS Designation, HRM_Employees_1.CardNo AS AppraiserID, 
                      HRM_Employees_1.EmployeeName AS AppraiserName, HRM_Employees_2.CardNo AS FinalReviewerID, 
                      HRM_Employees_2.EmployeeName AS FinalReviewer, HRM_Employees_3.CardNo AS AdditionalReviewerID, 
                      HRM_Employees_3.EmployeeName AS AdditionalReviewer
FROM         dbo.PMS_Approvers LEFT OUTER JOIN
                      dbo.HRM_Employees AS HRM_Employees_3 ON dbo.PMS_Approvers.ReviewerII = HRM_Employees_3.CardNo LEFT OUTER JOIN
                      dbo.HRM_Employees AS HRM_Employees_2 ON dbo.PMS_Approvers.ReviewerI = HRM_Employees_2.CardNo LEFT OUTER JOIN
                      dbo.HRM_Employees AS HRM_Employees_1 ON dbo.PMS_Approvers.Apparaiser = HRM_Employees_1.CardNo LEFT OUTER JOIN
                      dbo.HRM_Departments RIGHT OUTER JOIN
                      dbo.HRM_Designations RIGHT OUTER JOIN
                      dbo.HRM_Employees ON dbo.HRM_Designations.DesignationID = dbo.HRM_Employees.C_DesignationID ON 
                      dbo.HRM_Departments.DepartmentID = dbo.HRM_Employees.C_DepartmentID LEFT OUTER JOIN
                      dbo.HRM_Divisions ON dbo.HRM_Employees.C_DivisionID = dbo.HRM_Divisions.DivisionID ON 
                      dbo.PMS_Approvers.CardNo = dbo.HRM_Employees.CardNo
WHERE     (dbo.HRM_Employees.ActiveState = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
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
         Begin Table = "PMS_Approvers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HRM_Employees_3"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_2"
            Begin Extent = 
               Top = 6
               Left = 685
               Bottom = 114
               Right = 876
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_1"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 114
               Right = 647
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 114
               Left = 456
               Bottom = 207
               Right = 618
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 114
               Left = 267
               Bottom = 222
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 418' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PMSv_PmsApprovers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "HRM_Divisions"
            Begin Extent = 
               Top = 114
               Left = 656
               Bottom = 207
               Right = 807
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
      Begin ColumnWidths = 12
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
         Width = 1890
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2325
         Table = 2940
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PMSv_PmsApprovers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PMSv_PmsApprovers'
GO
