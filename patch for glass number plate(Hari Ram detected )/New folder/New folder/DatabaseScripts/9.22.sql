ALTER TABLE public."EventLogs" DROP COLUMN "DeviceName";
CREATE TABLE public."DeletedResourcesHistories" (
    "Id" serial NOT NULL,
    "ResourceId" integer NOT NULL,
    "ResourceName" text NULL,
    "DeletedDate" bigint NOT NULL,
    CONSTRAINT "PK_DeletedResourcesHistories" PRIMARY KEY ("Id")
);
ALTER TABLE public."EventLogs" ADD "Starred" boolean NOT NULL DEFAULT FALSE;