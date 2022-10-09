CREATE TABLE [Core].[Participant] (
   [Participant_ID]        VARCHAR (30) NOT NULL,
   [Participant_Type_ID]   VARCHAR (30) NULL,
   [Identification_ID]     VARCHAR (80) NULL,
   [Contact_ID]            VARCHAR (30) NULL,
   [Activity_ID]           VARCHAR (30) NULL,
   [Role_Code_ID]          VARCHAR (30) NULL,
   [Person_ID]             VARCHAR (30) NULL,
   [Duration]              VARCHAR (50) NULL,
   
   [Status_Code_ID]        VARCHAR (30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,
   [Start_DateTime]        DATETIMEOFFSET NULL,
   [End_DateTime]          DATETIMEOFFSET NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL,
   [Version_Number]        VARCHAR(20),
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED ([Participant_ID] ASC),
   CONSTRAINT [FK_Participant_Activity] FOREIGN KEY ([Activity_ID]) 
      REFERENCES [Core].[Activity] ([Activity_ID]),
   CONSTRAINT [FK_Participant_Contact] FOREIGN KEY ([Contact_ID]) 
      REFERENCES [Entity].[Contact] ([Contact_ID]),
   CONSTRAINT [FK_Participant_ParticipantType] FOREIGN KEY ([Participant_Type_ID]) 
      REFERENCES [Core].[Participant_Type] ([Code_ID]),
   CONSTRAINT [FK_Participant_Person] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID]),
   CONSTRAINT [FK_Participant_Role] FOREIGN KEY ([Role_Code_ID]) 
      REFERENCES [Core].[Role_Code] ([Code_ID])
);
GO

