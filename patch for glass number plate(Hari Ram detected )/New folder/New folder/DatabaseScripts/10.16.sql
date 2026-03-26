ALTER TABLE public."Resources" DROP COLUMN "radarEventZoneId";

ALTER TABLE public."Parameter" ADD "RadarEventZoneID" integer NOT NULL DEFAULT 0;