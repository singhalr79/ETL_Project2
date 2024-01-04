-- CrowdfundingSQL - Project 2 - UTOR

-- Schema created Automatically via QuickDBD, see ERD in Project Folder

CREATE TABLE "contacts" (
    "contact_id" INTEGER   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "email" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "category" (
    "category_id" VARCHAR(10)   NOT NULL,
    "category" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "subcategory" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" CHAR(10)   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(100)   NOT NULL,
    "description" VARCHAR(200)   NOT NULL,
    "goal" FLOAT   NOT NULL,
    "pledged" FLOAT   NOT NULL,
    "outcome" VARCHAR(15)   NOT NULL,
    "backers_count" INTEGER   NOT NULL,
    "country" CHAR(2)   NOT NULL,
    "currency" CHAR(3)   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(10)   NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

-- Confirm Tables correctly create and Data correclty imported

SELECT * FROM contacts;

SELECT * FROM category;

SELECT * FROM subcategory;

SELECT * FROM campaign;

-- View All FK relationships

SELECT conrelid::regclass AS table_name, 
       conname AS foreign_key, 
       pg_get_constraintdef(oid) 
FROM   pg_constraint 
WHERE  contype = 'f' 
AND    connamespace = 'public'::regnamespace   
ORDER  BY conrelid::regclass::text, contype DESC;