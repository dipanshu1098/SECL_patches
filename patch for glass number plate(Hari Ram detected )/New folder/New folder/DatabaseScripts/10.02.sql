CREATE INDEX "IX_ExportVideo_CameraId" ON public."ExportVideo" ("CameraId");
ALTER TABLE public."ExportVideo" ADD CONSTRAINT "FK_ExportVideo_Resources_CameraId" FOREIGN KEY ("CameraId") REFERENCES public."Resources" ("Id") ON DELETE CASCADE;
