ALTER TABLE public."Category" ADD "ToBeDiscarded" boolean NOT NULL DEFAULT FALSE;
ALTER TABLE public."Category" ALTER COLUMN "ToBeDiscarded" TYPE boolean;
ALTER TABLE public."Category" ALTER COLUMN "ToBeDiscarded" DROP NOT NULL;
ALTER TABLE public."Category" ALTER COLUMN "ToBeDiscarded" DROP DEFAULT;