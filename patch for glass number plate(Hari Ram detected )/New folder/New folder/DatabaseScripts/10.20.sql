DROP TABLE public."AssociatedCamDetails";

DROP TABLE public."Co_ordinate";

DROP TABLE public."LaneDetails";

DROP TABLE public."Parameter";

DROP TABLE public."Rectangle";

ALTER TABLE public."ResourceAnalytics" ADD "Params" jsonb NULL;

CREATE UNIQUE INDEX "IX_AnalyticServers_AnalyticServerName" ON public."AnalyticServers" ("AnalyticServerName");


ALTER TABLE public."AnalyticServers" ADD "Discriminator" text NULL DEFAULT 'I2VAnalyticServer';