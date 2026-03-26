ALTER TABLE public."EventLogs" ADD "NoHelmet" boolean NOT NULL DEFAULT FALSE;
ALTER TABLE public."EventLogs" ADD "NumberOfRiders" integer NOT NULL DEFAULT 0;
ALTER TABLE public."EventLogs" ADD "TrippleRiding" boolean NOT NULL DEFAULT FALSE;