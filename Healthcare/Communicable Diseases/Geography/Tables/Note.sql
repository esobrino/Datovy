﻿CREATE TABLE [Geography].[Note]
(
   [Note_ID]               VARCHAR(30) NOT NULL,
   [Note_Type_ID]          VARCHAR(30) NULL,
   [Note_Text]             VARCHAR(4096) NOT NULL,
   [Note_DateTime]         DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),

   [Author_ID]             VARCHAR(30),
   [Author_Role_ID]        VARCHAR(30),
   [Author_Name]           VARCHAR(80),

   [Status_Code_ID]        VARCHAR (30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- entity relationship (only one should be instantiated)
   [Entity_Type_ID]        VARCHAR(30) NULL,

   [Person_ID]             VARCHAR(30) NULL,
   [Organization_ID]       VARCHAR(30) NULL,
   [Officer_ID]            VARCHAR(30) NULL,
   [Contact_ID]            VARCHAR(30) NULL,

   CONSTRAINT fk_Note_Entity_Type FOREIGN KEY ([Entity_Type_ID])
      REFERENCES [Entity].[Entity_Type]([Type_ID]),
   CONSTRAINT fk_Note_Person FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person]([Person_ID]),
   CONSTRAINT fk_Note_Organization FOREIGN KEY ([Organization_ID])
      REFERENCES [Entity].[Organization]([Organization_ID]),
   CONSTRAINT fk_Note_Officer FOREIGN KEY ([Officer_ID])
      REFERENCES [Entity].[Officer]([Officer_ID]),
   CONSTRAINT fk_Note_Contact FOREIGN KEY ([Contact_ID])
      REFERENCES [Entity].[Contact]([Contact_ID]),

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

   CONSTRAINT pk_Note PRIMARY KEY ([Note_ID]),
   CONSTRAINT fk_Note_Type FOREIGN KEY ([Note_Type_ID])
      REFERENCES [Geography].[Note_Type]([Type_ID])
)