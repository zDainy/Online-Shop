PGDMP     6             	        v            Online Shop    10.2    10.2     H           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            I           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            B          0    16470 	   cust_info 
   TABLE DATA               S   COPY cust_info (cstinf_id, name, email, phone, delivery_addr, cust_id) FROM stdin;
    public       postgres    false    205   �       A          0    16459    customer 
   TABLE DATA               5   COPY customer (cust_id, login, password) FROM stdin;
    public       postgres    false    204   �       @          0    16449    order 
   TABLE DATA               E   COPY "order" (ord_id, price, cust, date_created, status) FROM stdin;
    public       postgres    false    203   !       >          0    16430    order_status 
   TABLE DATA               9   COPY order_status (ordst_id, key_name, name) FROM stdin;
    public       postgres    false    201   >       =          0    16420    prod_category 
   TABLE DATA               ;   COPY prod_category (prdcat_id, key_name, name) FROM stdin;
    public       postgres    false    200   [       D          0    16534 
   prod_order 
   TABLE DATA               :   COPY prod_order (prdord_id, product, "order") FROM stdin;
    public       postgres    false    207   �       C          0    16479 	   prod_size 
   TABLE DATA               8   COPY prod_size ("prdsz_Id", key_name, name) FROM stdin;
    public       postgres    false    206   �       ?          0    16440    product 
   TABLE DATA               g   COPY product (prd_id, name, price, description, quantity, category, size, gender, img_src) FROM stdin;
    public       postgres    false    202   �       M           0    0    cust_info_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('cust_info_seq', 1, true);
            public       postgres    false    199            N           0    0    customer_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('customer_seq', 2, true);
            public       postgres    false    198            O           0    0 	   order_seq    SEQUENCE SET     1   SELECT pg_catalog.setval('order_seq', 1, false);
            public       postgres    false    197            P           0    0    prod_order_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('prod_order_seq', 1, false);
            public       postgres    false    208            Q           0    0    product_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('product_seq', 3, true);
            public       postgres    false    196            B   T   x�3�0���[/��$wr�$f�U:d�%�W��rj�[XY��r^��AO�¬;.6\�waӅ
F���\1z\\\ A  *      A   ,   x�3�t�I��442615�2���ɩ�H�L,�M��N����� �		P      @      x������ � �      >      x������ � �      =   !   x�3���,*�0�;/캰�+F��� ��
      D      x������ � �      C   '   x� ��1	S	Маленький
\.


���      ?   h   x��=@@뷧x�VV�54Z�X4:7���*�������v��I;x<�='|8�%���=^�ta�p(�̍>���H9b�D��nZ)��)cc��2i     