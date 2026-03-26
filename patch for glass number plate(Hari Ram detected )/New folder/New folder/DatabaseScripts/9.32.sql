ALTER TABLE public."Parameter" ADD "FrameIntervalBetweenImagesToSave" integer NULL DEFAULT 5;
ALTER TABLE public."Parameter" ADD "NumberOfImagesToSave" integer NULL DEFAULT 1;
ALTER TABLE public."EventLogs" ADD "AttachedImages" text[] NULL;
CREATE TABLE public."ExportVideo" (
    "Id" serial NOT NULL,
    "ExportName" text NULL,
    "StartTime" text NULL,
    "EndTime" text NULL,
    "ExportType" text NULL,
    "ExportFormat" text NULL,
    "Status" text NULL,
    "CameraId" integer NOT NULL,
    "ExportId" text NULL,
    "ExportVideoUrl" text NULL,
    "ErrorMessage" text NULL,
    "ExportPercentDone" integer NOT NULL,
    "UserId" integer NOT NULL,
    "ExportInitiatedAt" text NULL,
    CONSTRAINT "PK_ExportVideo" PRIMARY KEY ("Id")
);
ALTER TABLE public."Category" ADD "ArcheivingInDays" integer NOT NULL DEFAULT 30;
