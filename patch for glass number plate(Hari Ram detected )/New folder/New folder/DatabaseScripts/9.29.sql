CREATE TABLE public."FallbackInterval" (
    "Id" serial NOT NULL,
    "ANPRId" integer NOT NULL,
    "ConnectedTime" bigint NOT NULL,
    "DisconnectedTime" bigint NOT NULL,
    CONSTRAINT "PK_FallbackInterval" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_FallbackInterval_Resources_ANPRId" FOREIGN KEY ("ANPRId") REFERENCES public."Resources" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_FallbackInterval_ANPRId" ON public."FallbackInterval" ("ANPRId");