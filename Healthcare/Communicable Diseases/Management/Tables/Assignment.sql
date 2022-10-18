CREATE TABLE [Management].[Assignment]
(
   [Assignment_ID]         VARCHAR (30) NOT NULL,
   [Assigned_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),

   [Manager_ID]            VARCHAR (30) NULL,
   [Officer_ID]            VARCHAR (30) NULL,

   [Status_Code_ID]        VARCHAR (30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- assigned item (assign only one)
   [Entity_Type_ID]        VARCHAR(30) NULL,
   [Case_ID]               VARCHAR(30) NULL,
   [Referral_ID]           VARCHAR(30) NULL,
   [Contact_ID]            VARCHAR(30) NULL,
   [Person_ID]             VARCHAR(30) NULL,

   -- assignment context
   [Priority_ID]           VARCHAR(30) NULL,

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

   CONSTRAINT [pk_Assignment] PRIMARY KEY CLUSTERED ([Assignment_ID] ASC),

   CONSTRAINT [fk_Element_Value_Entity] FOREIGN KEY ([Entity_Type_ID])
      REFERENCES [Entity].[Entity_Type]([Type_ID]),
   CONSTRAINT [fk_Assignment_Case] FOREIGN KEY ([Case_ID])
      REFERENCES [Management].[Case]([Case_Id]),
   CONSTRAINT [fk_Assignment_Referral] FOREIGN KEY ([Referral_ID])
      REFERENCES [Management].[Referral]([Referral_Id]),
   CONSTRAINT [fk_Assignment_Contact] FOREIGN KEY ([Contact_ID])
      REFERENCES [Entity].[Contact]([Contact_Id]),
   CONSTRAINT [fk_Assignment_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person]([Person_Id])
)
