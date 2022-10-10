CREATE TABLE [Entity].[Officer] (
   [Officer_ID]            VARCHAR(30)  NOT NULL,
   [Alternate_ID]          VARCHAR(40)  NULL,
   [Type_ID]               VARCHAR(30)  NULL,
   [Registry_ID]           VARCHAR(40)  NULL,
   [Organization_ID]       VARCHAR(30)  NULL,
   [Person_ID]             VARCHAR(30)  NULL,
   [Contact_ID]            VARCHAR(30)  NULL,
   [Name]                  VARCHAR(128) NULL,
    
   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,
   [Start_DateTime]        DATETIMEOFFSET NULL,
   [End_DateTime]          DATETIMEOFFSET NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [PK_Officer] PRIMARY KEY CLUSTERED ([Officer_ID] ASC),

   CONSTRAINT [FK_Officer_Type] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Entity].[Officer_Type] ([Type_ID]),

   CONSTRAINT [FK_Officer_Organization] FOREIGN KEY ([Organization_ID]) 
      REFERENCES [Entity].[Organization] ([Organization_ID]),
   CONSTRAINT [FK_Officer_Person] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID]),
   CONSTRAINT [FK_Officer_Contact] FOREIGN KEY ([Contact_ID]) 
      REFERENCES [Entity].[Contact] ([Contact_ID])
);
GO



