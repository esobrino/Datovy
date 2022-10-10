CREATE TABLE [Healthcare].[Vitals] (
   [Vitals_ID]             VARCHAR(30) NOT NULL,
   [Participant_ID]        VARCHAR(30) NULL,
   [Profile_Code_ID]       VARCHAR(30) NULL,
   [Subject_ID]            VARCHAR(30) NULL,
   [Subject_Type_ID]       VARCHAR(30) NULL,
   [BodySiteCodeID]        VARCHAR(30) NULL,
   [BodyPositionCodeID]    VARCHAR(30) NULL,
   [Device_Code_ID]        VARCHAR(30) NULL,
   [Method]                VARCHAR(50) NULL,
   [Unit_Code_ID]          VARCHAR(30) NULL,
   [Component_Code_ID]     VARCHAR(30) NULL,
   [Measured_Value]        VARCHAR(50) NULL,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
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

   CONSTRAINT [PK_Vita] PRIMARY KEY CLUSTERED ([Vitals_ID] ASC),
   CONSTRAINT [FK_Vita_Participant] FOREIGN KEY ([Participant_ID]) 
      REFERENCES [Core].[Participant] ([Participant_ID]),
   CONSTRAINT [FK_Vitals_BodyPositionCode] FOREIGN KEY ([BodyPositionCodeID]) 
      REFERENCES [Healthcare].[Body_Position_Code] ([Code_ID]),
   CONSTRAINT [FK_Vitals_BodySiteCode] FOREIGN KEY ([BodySiteCodeID]) 
      REFERENCES [Healthcare].[Body_Site_Code] ([Code_ID]),
   CONSTRAINT [FK_Vitals_DeviceCode] FOREIGN KEY ([Device_Code_ID])
      REFERENCES [Healthcare].[Device_Code] ([Code_ID]),
   CONSTRAINT [FK_Vitals_UnitCode] FOREIGN KEY ([Unit_Code_ID])
      REFERENCES [Healthcare].[Unit_Code] ([Code_ID])
);
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Person Contact', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Vitals',
   @level2type = N'COLUMN',   @level2name = 'Subject_Type_ID';
GO

