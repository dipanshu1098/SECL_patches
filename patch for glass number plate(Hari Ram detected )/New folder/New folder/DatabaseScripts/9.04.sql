ALTER TABLE public."Parameter" ADD "FrameInterval" real NULL;
ALTER TABLE public."Parameter" ADD "DrawLaneRegion" boolean NULL DEFAULT FALSE;
ALTER TABLE public."Parameter" ADD "DrawMeasurementRegion" boolean NULL DEFAULT FALSE;
ALTER TABLE public."Resources" ADD "checkViolation" boolean NULL;
ALTER TABLE public."Resources" ADD "speedLimit" real NULL;
CREATE TABLE public."LaneDetails" (
    "ANPRWithSpeedParameterId" integer NOT NULL,
    "LaneName" text NULL,
    "LaneCoef" double precision NOT NULL,
    "RegionWidth" double precision NOT NULL,
    "RegionHeight" double precision NOT NULL,
    "Id" serial NOT NULL,
    CONSTRAINT "PK_LaneDetails" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_LaneDetails_Parameter_ANPRWithSpeedParameterId" FOREIGN KEY ("ANPRWithSpeedParameterId") REFERENCES public."Parameter" ("Id") ON DELETE CASCADE
);
CREATE INDEX "IX_LaneDetails_ANPRWithSpeedParameterId" ON public."LaneDetails" ("ANPRWithSpeedParameterId");
CREATE TABLE public."Co_ordinate" (
    "X" integer NOT NULL,
    "Y" integer NOT NULL,
    "Id" serial NOT NULL,
    "LaneDetailsId" integer NULL,
    "LaneDetailsId1" integer NULL,
    CONSTRAINT "PK_Co_ordinate" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Co_ordinate_LaneDetails_LaneDetailsId" FOREIGN KEY ("LaneDetailsId") REFERENCES public."LaneDetails" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Co_ordinate_LaneDetails_LaneDetailsId1" FOREIGN KEY ("LaneDetailsId1") REFERENCES public."LaneDetails" ("Id") ON DELETE RESTRICT
);
CREATE INDEX "IX_Co_ordinate_LaneDetailsId" ON public."Co_ordinate" ("LaneDetailsId");
CREATE INDEX "IX_Co_ordinate_LaneDetailsId1" ON public."Co_ordinate" ("LaneDetailsId1");
ALTER TABLE public."EventLogs" ADD "Speed" real NOT NULL;
ALTER TABLE public."EventLogs" ADD "SpeedViolated" boolean NOT NULL DEFAULT FALSE;
ALTER TABLE public."Co_ordinate" ALTER COLUMN "Y" TYPE real;
ALTER TABLE public."Co_ordinate" ALTER COLUMN "Y" SET NOT NULL;
ALTER TABLE public."Co_ordinate" ALTER COLUMN "Y" DROP DEFAULT;
ALTER TABLE public."Co_ordinate" ALTER COLUMN "X" TYPE real;
ALTER TABLE public."Co_ordinate" ALTER COLUMN "X" SET NOT NULL;
ALTER TABLE public."Co_ordinate" ALTER COLUMN "X" DROP DEFAULT;
ALTER TABLE public."Co_ordinate" DROP CONSTRAINT "FK_Co_ordinate_LaneDetails_LaneDetailsId";
ALTER TABLE public."Co_ordinate" ADD CONSTRAINT "FK_Co_ordinate_LaneDetails_LaneDetailsId" FOREIGN KEY ("LaneDetailsId") REFERENCES public."LaneDetails" ("Id") ON DELETE CASCADE;
ALTER TABLE public."Co_ordinate" DROP CONSTRAINT "FK_Co_ordinate_LaneDetails_LaneDetailsId";
ALTER TABLE public."Co_ordinate" ADD CONSTRAINT "FK_Co_ordinate_LaneDetails_LaneDetailsId" FOREIGN KEY ("LaneDetailsId") REFERENCES public."LaneDetails" ("Id") ON DELETE RESTRICT;