-- Table: public.prod_category

-- DROP TABLE public.prod_category;

CREATE TABLE public.prod_category
(
    prdcat_id numeric NOT NULL,
    key_name character varying(16) COLLATE pg_catalog."default" NOT NULL,
    name character varying(32) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT prod_category_pkey PRIMARY KEY (prdcat_id),
    CONSTRAINT prdcat_kn_uq UNIQUE (key_name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.prod_category
    OWNER to postgres;

-- Table: public.prod_size

-- DROP TABLE public.prod_size;

CREATE TABLE public.prod_size
(
    "prdsz_Id" numeric NOT NULL,
    key_name character varying(16) COLLATE pg_catalog."default" NOT NULL,
    name character varying(32) COLLATE pg_catalog."default",
    CONSTRAINT prod_size_pkey PRIMARY KEY ("prdsz_Id"),
    CONSTRAINT prdsz_kn_uq UNIQUE (key_name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.prod_size
    OWNER to postgres;

-- Table: public.cust_info

-- DROP TABLE public.cust_info;

CREATE TABLE public.cust_info
(
    cstinf_id numeric NOT NULL DEFAULT nextval('cust_info_seq'::regclass),
    name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    email character varying(128) COLLATE pg_catalog."default",
    phone character varying(16) COLLATE pg_catalog."default",
    delivery_addr character varying(128) COLLATE pg_catalog."default",
    cust_id numeric NOT NULL,
    CONSTRAINT cust_info_pkey PRIMARY KEY (cstinf_id),
    CONSTRAINT cust_info_fk FOREIGN KEY (cust_id)
        REFERENCES public.customer (cust_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.cust_info
    OWNER to postgres;

-- Table: public.customer

-- DROP TABLE public.customer;

CREATE TABLE public.customer
(
    cust_id numeric NOT NULL DEFAULT nextval('customer_seq'::regclass),
    login character varying(64) COLLATE pg_catalog."default" NOT NULL,
    password character varying(16) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT customer_pkey PRIMARY KEY (cust_id),
    CONSTRAINT login_uq UNIQUE (login)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.customer
    OWNER to postgres;

-- Table: public.order_status

-- DROP TABLE public.order_status;

CREATE TABLE public.order_status
(
    ordst_id numeric NOT NULL,
    key_name character varying(16) COLLATE pg_catalog."default" NOT NULL,
    name character varying(32) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_status_pkey PRIMARY KEY (ordst_id),
    CONSTRAINT ordst_kn_uq UNIQUE (key_name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.order_status
    OWNER to postgres;

-- Table: public.product

-- DROP TABLE public.product;

CREATE TABLE public.product
(
    prd_id numeric NOT NULL DEFAULT nextval('product_seq'::regclass),
    name character varying(64) COLLATE pg_catalog."default" NOT NULL,
    price numeric NOT NULL,
    description text COLLATE pg_catalog."default",
    quantity numeric NOT NULL,
    category character varying(16) COLLATE pg_catalog."default" NOT NULL,
    size character varying(16) COLLATE pg_catalog."default" NOT NULL,
    gender numeric(1,0) NOT NULL,
    img_src text COLLATE pg_catalog."default",
    CONSTRAINT product_pkey PRIMARY KEY (prd_id),
    CONSTRAINT category_fk FOREIGN KEY (category)
        REFERENCES public.prod_category (key_name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT size_fk FOREIGN KEY (size)
        REFERENCES public.prod_size (key_name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT gender_chk CHECK (gender = ANY (ARRAY[0::numeric, 1::numeric])) NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.product
    OWNER to postgres;

-- Table: public."order"

-- DROP TABLE public."order";

CREATE TABLE public."order"
(
    ord_id numeric NOT NULL DEFAULT nextval('order_seq'::regclass),
    price numeric NOT NULL,
    cust numeric NOT NULL,
    date_created date NOT NULL DEFAULT CURRENT_DATE,
    status character varying(16) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY (ord_id),
    CONSTRAINT cust_fk FOREIGN KEY (cust)
        REFERENCES public.customer (cust_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT status_fk FOREIGN KEY (status)
        REFERENCES public.order_status (key_name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."order"
    OWNER to postgres;

-- Table: public.prod_order

-- DROP TABLE public.prod_order;

CREATE TABLE public.prod_order
(
    prdord_id numeric NOT NULL DEFAULT nextval('prod_order_seq'::regclass),
    product numeric NOT NULL,
    "order" numeric NOT NULL,
    CONSTRAINT prod_order_pkey PRIMARY KEY (prdord_id),
    CONSTRAINT order_fk FOREIGN KEY ("order")
        REFERENCES public."order" (ord_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT prod_fk FOREIGN KEY (product)
        REFERENCES public.product (prd_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.prod_order
    OWNER to postgres;
