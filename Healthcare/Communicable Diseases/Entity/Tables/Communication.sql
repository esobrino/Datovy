﻿CREATE TABLE [Entity].[Communication] (
   [Communication_ID]        VARCHAR(30) NOT NULL,

   [Device_Code_ID]          VARCHAR(30) NULL,
   [Device_Usage_Code_ID]    VARCHAR(20) NULL,
   [Phone_Country_Code_ID]   VARCHAR(5)  NULL,
   [Phone_Area_Code_ID]      VARCHAR(10) NULL,
   [Phone_Number]            VARCHAR(20) NULL,
   [Extension]               VARCHAR(10) NULL,

   [Status_Code_ID]          VARCHAR(30) NULL,
   [Status_DateTime]         DATETIMEOFFSET NULL,

   -- management relationship 
   [Case_ID]               VARCHAR (30) NULL,

   CONSTRAINT [fk_Communication_Case] FOREIGN KEY ([Case_ID])
      REFERENCES [Management].[Case] ([Case_ID]),

   -- healthcare relationship 
   [Provider_ID]           VARCHAR (30) NULL,

   CONSTRAINT [fk_Communication_Provider] FOREIGN KEY ([Provider_ID])
      REFERENCES [Healthcare].[Provider] ([Provider_ID]),

   -- entity relationship (only one should be instantiated)
   [Entity_Type_ID]        VARCHAR(30) NULL,
   [Person_ID]             VARCHAR(30) NULL,
   [Organization_ID]       VARCHAR(30) NULL,
   [Officer_ID]            VARCHAR(30) NULL,
   [Contact_ID]            VARCHAR(30) NULL,

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

   CONSTRAINT [pk_Communication] PRIMARY KEY CLUSTERED ([Communication_ID] ASC)
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Phone, Fax', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Communication', 
   @level2type = N'COLUMN',   @level2name = 'Device_Code_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Work, Home, Office', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Communication',
   @level2type = N'COLUMN',   @level2name = 'Device_Usage_Code_ID';
