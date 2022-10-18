-- this is a sample for Element Lists

-- Prepare a Follow-Up List (also referr as Concepts)
INSERT INTO [Generic].[Element_Group] (
   [Group_ID], [Description]) VALUES
   ('CM-000001', 'Case & Referral Management')
GO

INSERT INTO [Generic].[Element] (
   [Group_ID], [Sequence_No], [Element_ID], [Label_Text]) VALUES
   ('CM-000001', 1, 'CM-001', 'New Requests for Information'),
   ('CM-000001', 2, 'CM-002', 'Active Cases'),
   ('CM-000001', 3, 'CM-003', 'Cases near completion'),
   ('CM-000001', 4, 'CM-004', 'Must Call or Follow-up Case or Person'),
   ('CM-000001', 5, 'CM-005', 'Case Closed in last 60 days')
GO

-- Make Assignments... (see [Management].[Assignment])

