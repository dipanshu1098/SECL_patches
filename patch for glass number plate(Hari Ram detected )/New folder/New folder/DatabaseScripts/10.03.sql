ALTER TABLE public."EventLogs" DROP COLUMN "AttachedImages";
ALTER TABLE public."EventLogs" ADD "_AttachedImages" text NULL;