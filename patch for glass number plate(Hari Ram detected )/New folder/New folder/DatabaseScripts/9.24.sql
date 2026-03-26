ALTER TABLE public."Resources" ADD "DistrictId" integer NOT NULL DEFAULT 0;
ALTER TABLE public."Resources" ADD "Latitude" double precision NOT NULL DEFAULT 0;
ALTER TABLE public."Resources" ADD "Location" text NULL;
ALTER TABLE public."Resources" ADD "Longitude" double precision NOT NULL DEFAULT 0;
ALTER TABLE public."Resources" ADD "RTOCircleNumber" integer NOT NULL DEFAULT 0;
ALTER TABLE public."Resources" ADD "SerialNumber" text NULL;
CREATE TABLE public."OffenceDetails" (
    "Id" serial NOT NULL,
    "OffenceName" text NULL,
    "Code" integer NOT NULL,
    "AliasName" text NULL,
    "ShortFormAliasName" text NULL,
    CONSTRAINT "PK_OffenceDetails" PRIMARY KEY ("Id")
);
ALTER TABLE public."EventLogs" ADD "IsChallanRequested" boolean NOT NULL DEFAULT FALSE;