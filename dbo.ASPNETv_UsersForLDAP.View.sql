USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ASPNETv_UsersForLDAP]
AS
SELECT     dbo.aspnet_Users.UserName, dbo.aspnet_Users.UserFullName, dbo.HRM_Employees.EmployeeName, 
                      dbo.HRM_Departments.Description AS Department, dbo.HRM_Designations.Description AS Designation, dbo.aspnet_Users.EMailID, 
                      dbo.aspnet_Users.MD5Password, dbo.aspnet_Users.MobileNo, dbo.HRM_Offices.Description AS Location, dbo.HRM_Employees.ActiveState, 
                      dbo.HRM_Employees.VPNMailExpireOn, dbo.HRM_Employees.C_ProjectSiteID AS ProjectSiteID, dbo.IDM_Projects.ProjectSiteEMailID, 
                      dbo.IDM_Projects.ProjectSiteEMailPassword, dbo.HRM_Employees.Blackberry, dbo.HRM_Employees.ContactNumbers
FROM         dbo.HRM_Employees LEFT OUTER JOIN
                      dbo.IDM_Projects ON dbo.HRM_Employees.C_ProjectSiteID = dbo.IDM_Projects.ProjectID LEFT OUTER JOIN
                      dbo.HRM_Offices ON dbo.HRM_Employees.C_OfficeID = dbo.HRM_Offices.OfficeID LEFT OUTER JOIN
                      dbo.HRM_Designations ON dbo.HRM_Employees.C_DesignationID = dbo.HRM_Designations.DesignationID LEFT OUTER JOIN
                      dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID RIGHT OUTER JOIN
                      dbo.aspnet_Users ON dbo.HRM_Employees.CardNo = dbo.aspnet_Users.LoginID
WHERE     (dbo.HRM_Employees.ActiveState = 1) AND (dbo.HRM_Employees.EMailID IS NOT NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[16] 2[4] 3) )"
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
         Top = -49
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 48
               Left = 328
               Bottom = 156
               Right = 519
            End
            DisplayFlags = 280
            TopColumn = 71
         End
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 243
               Left = 277
               Bottom = 351
               Right = 481
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 6
               Left = 0
               Bottom = 114
               Right = 151
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 117
               Left = 109
               Bottom = 225
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 5
               Left = 161
               Bottom = 83
               Right = 312
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Users"
            Begin Extent = 
               Top = 13
               Left = 566
               Bottom = 241
               Right = 736
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
         Width' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ASPNETv_UsersForLDAP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ASPNETv_UsersForLDAP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ASPNETv_UsersForLDAP'
GO
