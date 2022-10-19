CREATE TABLE [dbo].[Assignment_Link]
(
   [Assignment_Link_ID]     VARCHAR(30) NOT NULL,
   [Assignment_ID]          VARCHAR(30) NOT NULL,

   -- external reference...
   [Element_ID]             VARCHAR(30) NOT NULL,

   -- record management
   [Tenant_ID]              VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(30) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]  DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Assignment_Link] PRIMARY KEY CLUSTERED ([Assignment_Link_ID] ASC),
   CONSTRAINT [fk_Assignment_Link] FOREIGN KEY ([Assignment_ID])
      REFERENCES [Management].[Assignment](Assignment_ID)
)
