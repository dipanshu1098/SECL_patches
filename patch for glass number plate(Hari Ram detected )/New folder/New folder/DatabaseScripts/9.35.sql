ALTER TABLE public."Parameter" ADD "MarkPlateAsViolationOnlyIfInsideRedLightViolationZone" boolean NULL;
ALTER TABLE public."Parameter" ADD "RedLightViolationZoneId" integer NULL;
CREATE INDEX "IX_Parameter_RedLightViolationZoneId" ON public."Parameter" ("RedLightViolationZoneId");
ALTER TABLE public."Parameter" ADD CONSTRAINT "FK_Parameter_Rectangle_RedLightViolationZoneId" FOREIGN KEY ("RedLightViolationZoneId") REFERENCES public."Rectangle" ("Id") ON DELETE RESTRICT;