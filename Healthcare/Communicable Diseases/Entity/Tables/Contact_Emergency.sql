CREATE TABLE [Entity].[Contact_Emergency] (
   [Contact_Emergency_ID]  VARCHAR (30) NOT NULL,
   [Type_ID]               VARCHAR (30) NULL,

   [Person_ID]             VARCHAR (30) NULL,
   [Name]                  VARCHAR (128) NULL,
   [Description]           VARCHAR (256) NULL,
   [Sex_Code_ID]           VARCHAR (30) NULL,
   [Phone_Number]          VARCHAR (20) NULL,
   [Email_Addresss]        VARCHAR (128) NULL,
    
   [Status_Code_ID]        VARCHAR (30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Efective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Efective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Contact_Emergency] PRIMARY KEY CLUSTERED ([Contact_Emergency_ID] ASC),
   CONSTRAINT [fk_Contact_Emergency_Type] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Entity].[Contact_Type] ([Type_ID]),
   CONSTRAINT [fk_Contact_Emergency_Person] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID])

);
GO

