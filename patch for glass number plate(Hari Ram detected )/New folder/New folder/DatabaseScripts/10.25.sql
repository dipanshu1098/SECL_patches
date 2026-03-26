ALTER TABLE public."SmsGateway" DROP COLUMN "Format";

ALTER TABLE public."SmsGateway" DROP COLUMN "Password";

ALTER TABLE public."SmsGateway" DROP COLUMN "UserName";

ALTER TABLE public."SmsGateway" DROP COLUMN "Type";

ALTER TABLE public."SmsGateway" DROP COLUMN "AccountSid";

ALTER TABLE public."SmsGateway" DROP COLUMN "AuthToken";

ALTER TABLE public."SmsGateway" DROP COLUMN "PhoneNumber";

ALTER TABLE public."SmsGateway" ALTER COLUMN "Discriminator" TYPE text;
ALTER TABLE public."SmsGateway" ALTER COLUMN "Discriminator" DROP NOT NULL;
ALTER TABLE public."SmsGateway" ALTER COLUMN "Discriminator" DROP DEFAULT;

ALTER TABLE public."SmsGateway" ADD "Properties" jsonb NULL;