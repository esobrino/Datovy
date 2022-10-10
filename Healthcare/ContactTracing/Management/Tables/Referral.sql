CREATE TABLE [Management].[Referral] (
   [Referral_ID]           VARCHAR(30) NOT NULL,
   [Referral_Type_ID]      VARCHAR(30) NULL,
   [Referral_Case_ID]      VARCHAR(30) NULL,
   [Referral_DateTime]     DATETIMEOFFSET NULL,

   [Case_ID]               VARCHAR(30) NULL,
   [Profile_ID]            VARCHAR(30) NULL,

   [Alternate_ID]          VARCHAR(40) NULL,
   [Provider_ID]           VARCHAR(30) NULL,
   [Activity_ID]           VARCHAR(30) NULL,
   
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

   CONSTRAINT [PK_Referral] PRIMARY KEY CLUSTERED ([Referral_ID] ASC),
   CONSTRAINT [FK_Referral_Activity] FOREIGN KEY ([Activity_ID]) 
      REFERENCES [Core].[Activity] ([Activity_ID]),
   CONSTRAINT [FK_Referral_Case] FOREIGN KEY ([Case_ID]) 
      REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [FK_Referral_Profile] FOREIGN KEY ([Profile_ID]) 
      REFERENCES [Tracing].[Profile] ([Profile_ID]),
   CONSTRAINT [FK_Referral_ReferralType] FOREIGN KEY ([Referral_Type_ID]) 
      REFERENCES [Management].[Referral_Type] ([Type_ID])
);

