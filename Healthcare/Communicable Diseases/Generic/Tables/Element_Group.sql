CREATE TABLE [Generic].[Element_Group]
(
   [Group_ID]              VARCHAR(30) NOT NULL,
   [Description]           VARCHAR(80),
   [Category_ID]           VARCHAR(30)  NULL,
   [Tags]                  VARCHAR(128) NULL,

   [CodeSet_Name]          VARCHAR(80) NULL,

   -- custom columns
   [Is_Multiselect]        BIT NULL DEFAULT 1,

   -- record management
   [Tenant_ID]             VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Element_Group] PRIMARY KEY CLUSTERED ([Group_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Provided to name the kind of list, checklist, group, or collection.', 
   @level0type = N'SCHEMA',   @level0name = N'Generic', 
   @level1type = N'TABLE',    @level1name = N'Element_Group';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Multiselect groups (default) implies that all elements within a list can be managed by the end-user, else only one of the items should be selecte or managed.', 
   @level0type = N'SCHEMA',   @level0name = N'Generic', 
   @level1type = N'TABLE',    @level1name = N'Element_Group', 
   @level2type = N'COLUMN',   @level2name = N'Is_Multiselect';