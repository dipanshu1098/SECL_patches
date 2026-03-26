ALTER TABLE public."Resources" ADD "ItmsId" integer NULL;

ALTER TABLE public."Resources" ADD "ItmsResourceId" integer NULL;

ALTER TABLE public."Resources" ADD "MqttPort" integer NULL;

ALTER TABLE public."Resources" ADD "NginxPort" integer NULL;

ALTER TABLE public."Resources" ADD "StreamingPort" integer NULL;

CREATE INDEX "IX_Resources_ItmsId" ON public."Resources" ("ItmsId");

ALTER TABLE public."Resources" ADD CONSTRAINT "FK_Resources_Resources_ItmsId" FOREIGN KEY ("ItmsId") REFERENCES public."Resources" ("Id") ON DELETE CASCADE;