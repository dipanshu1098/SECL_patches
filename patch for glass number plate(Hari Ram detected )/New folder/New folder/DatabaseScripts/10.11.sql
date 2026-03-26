ALTER TABLE public."EventLogs" ADD "VehicleType" text NULL;
ALTER TABLE public."EventLogs" ADD "VehicleMake" text NULL;
ALTER TABLE public."EventLogs" ADD "PlateType" text NULL;
ALTER TABLE public."Parameter" ADD "FindVehicleType" boolean NULL DEFAULT FALSE;
