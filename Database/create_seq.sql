CREATE SEQUENCE public.cust_info_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.cust_info_seq
    OWNER TO postgres;

CREATE SEQUENCE public.customer_seq
    INCREMENT 1
    START 2
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.customer_seq
    OWNER TO postgres;

CREATE SEQUENCE public.order_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.order_seq
    OWNER TO postgres;

CREATE SEQUENCE public.prod_order_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.prod_order_seq
    OWNER TO postgres;

CREATE SEQUENCE public.product_seq
    INCREMENT 1
    START 3
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.product_seq
    OWNER TO postgres;


