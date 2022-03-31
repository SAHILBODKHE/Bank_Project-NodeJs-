CREATE TABLE new_user
(
    user_id uuid NOT NULL DEFAULT uuid_generate_v4(),
    first_name character varying(20) COLLATE pg_catalog."default",
    second_name character varying(20) COLLATE pg_catalog."default",
    father_name character varying(20) COLLATE pg_catalog."default",
    email character varying(20) COLLATE pg_catalog."default",
    address1 character varying(50) COLLATE pg_catalog."default",
    mother_name character varying(20) COLLATE pg_catalog."default",
    zipcode character varying(20) COLLATE pg_catalog."default",
    adhaar_card numeric(20,0),
    country character varying(20) COLLATE pg_catalog."default",
    state character varying(20) COLLATE pg_catalog."default",
    pancard_no character varying(20) COLLATE pg_catalog."default",
    password character varying(20) COLLATE pg_catalog."default",
    username character varying(20) COLLATE pg_catalog."default",
    mobile character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT new_user_pkey PRIMARY KEY (user_id),
    CONSTRAINT new_user_username_key UNIQUE (username)
)
CREATE TABLE login_p
(
    account_no uuid NOT NULL,
    pin character varying(10) COLLATE pg_catalog."default",
    username character varying(20) COLLATE pg_catalog."default",
    transc_type character varying(10) COLLATE pg_catalog."default",
    ts timestamp without time zone,
    current_bal numeric(12,2),
    CONSTRAINT login_p_pkey PRIMARY KEY (account_no),
    CONSTRAINT fk FOREIGN KEY (account_no)
        REFERENCES public.new_user (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT login_p_account_no_fkey FOREIGN KEY (account_no)
        REFERENCES public.new_user (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE loan
(
    loan_id uuid NOT NULL DEFAULT uuid_generate_v4(),
    loan_accountno uuid,
    amount numeric(20,0),
    CONSTRAINT loan_pkey PRIMARY KEY (loan_id),
    CONSTRAINT loan_loan_accountno_fkey FOREIGN KEY (loan_accountno)
        REFERENCES public.login_p (account_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
