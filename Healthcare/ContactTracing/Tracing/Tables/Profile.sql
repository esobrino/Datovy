CREATE TABLE [Tracing].[Profile] (
   [Profile_ID]            VARCHAR (30)  NOT NULL,
   [Profile_Type_ID]       VARCHAR (30)  NULL,
   [Profile_Name]          VARCHAR (80)  NULL,
   
   [Status_Code_ID]        VARCHAR (30) NULL,
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
    
   CONSTRAINT [PK_Profile_Group] PRIMARY KEY CLUSTERED ([Profile_ID] ASC),
   CONSTRAINT [FK_Profile_ProfileType] FOREIGN KEY ([Profile_Type_ID]) 
      REFERENCES [Tracing].[Profile_Type] ([Type_ID])
);
