ALTER TABLE public."Resources" DROP COLUMN "_Properties";
ALTER TABLE public."Resources" ADD "_Properties" jsonb;
ALTER TABLE public."Parameter" ADD "DiscardRepetativeNumberPlates" boolean NULL DEFAULT FALSE;
ALTER TABLE public."Parameter" ADD "TimeToKeepRepetativeNumberFor" integer NULL DEFAULT 1;

