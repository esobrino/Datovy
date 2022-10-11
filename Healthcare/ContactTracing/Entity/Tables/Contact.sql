CREATE TABLE [Entity].[Contact] (
   [Contact_ID]            VARCHAR(30)  NOT NULL,
   [Alternate_ID]          VARCHAR(40)  NULL,
   [Type_ID]               VARCHAR(30)  NULL,
   [Person_ID]             VARCHAR(30)  NULL,
   [Name]                  VARCHAR(128) NULL,
   [Description]           VARCHAR(256) NULL,
   [Sex_Code_ID]           VARCHAR(30)  NULL,
   [Phone_Number]          VARCHAR(20)  NULL,
   [Email_Addresss]        VARCHAR(128) NULL,
   [Risk_Code_ID]          VARCHAR(30)  NULL,
   [Priority_Code_ID]      VARCHAR(30)  NULL,
   [Jurisdiction_Code_ID]  VARCHAR(30)  NULL,
    
   [Status_Code_ID]        VARCHAR(30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Start_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [End_DateTime]          DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL,

   CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([Contact_ID] ASC),
   CONSTRAINT [FK_Contact_ContactType] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Entity].[Contact_Type] ([Type_ID]),
   CONSTRAINT [FK_Contact_Person] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'have the information for the jurisdiction -- jurisdiction table will be required.',
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Contact', 
   @level2type = N'COLUMN',   @level2name = 'Jurisdiction_Code_ID';

