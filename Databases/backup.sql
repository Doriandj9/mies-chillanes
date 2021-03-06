PGDMP         )                z            direccion_distrital    12.1    12.1 @    g           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            h           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            i           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            j           1262    74407    direccion_distrital    DATABASE     ?   CREATE DATABASE direccion_distrital WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
 #   DROP DATABASE direccion_distrital;
                postgres    false            ?            1259    74453    acta_entrada    TABLE       CREATE TABLE public.acta_entrada (
    codigo text NOT NULL,
    tipo text NOT NULL,
    ci_ruc text NOT NULL,
    id_proovedor integer NOT NULL,
    factura text NOT NULL,
    proceso text,
    solicitud text,
    fecha timestamp without time zone NOT NULL
);
     DROP TABLE public.acta_entrada;
       public         heap    postgres    false            ?            1259    74451    acta_entrada_id_proovedor_seq    SEQUENCE     ?   CREATE SEQUENCE public.acta_entrada_id_proovedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.acta_entrada_id_proovedor_seq;
       public          postgres    false    208            k           0    0    acta_entrada_id_proovedor_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.acta_entrada_id_proovedor_seq OWNED BY public.acta_entrada.id_proovedor;
          public          postgres    false    207            ?            1259    74508    acta_entrega    TABLE     ?   CREATE TABLE public.acta_entrega (
    numero text NOT NULL,
    cedula_usuario character(10) NOT NULL,
    fecha timestamp without time zone NOT NULL,
    cedula_lider character(10) NOT NULL
);
     DROP TABLE public.acta_entrega;
       public         heap    postgres    false            ?            1259    74527    acta_entrega_materiales    TABLE     ?   CREATE TABLE public.acta_entrega_materiales (
    numero_acta text NOT NULL,
    orden_compra text NOT NULL,
    cantidad integer NOT NULL
);
 +   DROP TABLE public.acta_entrega_materiales;
       public         heap    postgres    false            ?            1259    74474 
   categorias    TABLE     V   CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            ?            1259    74472    categorias_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categorias_id_seq;
       public          postgres    false    210            l           0    0    categorias_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;
          public          postgres    false    209            ?            1259    74620    instituciones    TABLE     M   CREATE TABLE public.instituciones (
    id text NOT NULL,
    nombre text
);
 !   DROP TABLE public.instituciones;
       public         heap    postgres    false            ?            1259    74585    lideres    TABLE     ?   CREATE TABLE public.lideres (
    cedula character(10) NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    cargo text NOT NULL,
    id_institucion text NOT NULL
);
    DROP TABLE public.lideres;
       public         heap    postgres    false            ?            1259    74428 
   materiales    TABLE     ?   CREATE TABLE public.materiales (
    orden_compra text NOT NULL,
    descripcion text NOT NULL,
    cant numeric NOT NULL,
    valor_unitario numeric NOT NULL,
    id_proovedor integer NOT NULL,
    codigo_acta_entrada text
);
    DROP TABLE public.materiales;
       public         heap    postgres    false            ?            1259    74485    materiales_categorias    TABLE     q   CREATE TABLE public.materiales_categorias (
    orden_compra text NOT NULL,
    id_categoria integer NOT NULL
);
 )   DROP TABLE public.materiales_categorias;
       public         heap    postgres    false            ?            1259    74483 &   materiales_categorias_id_categoria_seq    SEQUENCE     ?   CREATE SEQUENCE public.materiales_categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.materiales_categorias_id_categoria_seq;
       public          postgres    false    212            m           0    0 &   materiales_categorias_id_categoria_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.materiales_categorias_id_categoria_seq OWNED BY public.materiales_categorias.id_categoria;
          public          postgres    false    211            ?            1259    74436    materiales_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.materiales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.materiales_id_seq;
       public          postgres    false    205            n           0    0    materiales_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.materiales_id_seq OWNED BY public.materiales.id_proovedor;
          public          postgres    false    206            ?            1259    74419    proovedores    TABLE     ?   CREATE TABLE public.proovedores (
    id integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    telefono text,
    direccion text
);
    DROP TABLE public.proovedores;
       public         heap    postgres    false            ?            1259    74417    proovedores_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.proovedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.proovedores_id_seq;
       public          postgres    false    204            o           0    0    proovedores_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.proovedores_id_seq OWNED BY public.proovedores.id;
          public          postgres    false    203            ?            1259    74409    usuarios    TABLE     ?   CREATE TABLE public.usuarios (
    cedula character(10) NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    correo text NOT NULL,
    password text NOT NULL,
    cargo text,
    permission integer
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            ?
           2604    74456    acta_entrada id_proovedor    DEFAULT     ?   ALTER TABLE ONLY public.acta_entrada ALTER COLUMN id_proovedor SET DEFAULT nextval('public.acta_entrada_id_proovedor_seq'::regclass);
 H   ALTER TABLE public.acta_entrada ALTER COLUMN id_proovedor DROP DEFAULT;
       public          postgres    false    207    208    208            ?
           2604    74477    categorias id    DEFAULT     n   ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);
 <   ALTER TABLE public.categorias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            ?
           2604    74438    materiales id_proovedor    DEFAULT     x   ALTER TABLE ONLY public.materiales ALTER COLUMN id_proovedor SET DEFAULT nextval('public.materiales_id_seq'::regclass);
 F   ALTER TABLE public.materiales ALTER COLUMN id_proovedor DROP DEFAULT;
       public          postgres    false    206    205            ?
           2604    74488 "   materiales_categorias id_categoria    DEFAULT     ?   ALTER TABLE ONLY public.materiales_categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.materiales_categorias_id_categoria_seq'::regclass);
 Q   ALTER TABLE public.materiales_categorias ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    211    212    212            ?
           2604    74422    proovedores id    DEFAULT     p   ALTER TABLE ONLY public.proovedores ALTER COLUMN id SET DEFAULT nextval('public.proovedores_id_seq'::regclass);
 =   ALTER TABLE public.proovedores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204            \          0    74453    acta_entrada 
   TABLE DATA           n   COPY public.acta_entrada (codigo, tipo, ci_ruc, id_proovedor, factura, proceso, solicitud, fecha) FROM stdin;
    public          postgres    false    208   ?O       a          0    74508    acta_entrega 
   TABLE DATA           S   COPY public.acta_entrega (numero, cedula_usuario, fecha, cedula_lider) FROM stdin;
    public          postgres    false    213   ?O       b          0    74527    acta_entrega_materiales 
   TABLE DATA           V   COPY public.acta_entrega_materiales (numero_acta, orden_compra, cantidad) FROM stdin;
    public          postgres    false    214   ?O       ^          0    74474 
   categorias 
   TABLE DATA           0   COPY public.categorias (id, nombre) FROM stdin;
    public          postgres    false    210   ?O       d          0    74620    instituciones 
   TABLE DATA           3   COPY public.instituciones (id, nombre) FROM stdin;
    public          postgres    false    216   P       c          0    74585    lideres 
   TABLE DATA           R   COPY public.lideres (cedula, nombre, apellido, cargo, id_institucion) FROM stdin;
    public          postgres    false    215   #P       Y          0    74428 
   materiales 
   TABLE DATA           x   COPY public.materiales (orden_compra, descripcion, cant, valor_unitario, id_proovedor, codigo_acta_entrada) FROM stdin;
    public          postgres    false    205   @P       `          0    74485    materiales_categorias 
   TABLE DATA           K   COPY public.materiales_categorias (orden_compra, id_categoria) FROM stdin;
    public          postgres    false    212   ]P       X          0    74419    proovedores 
   TABLE DATA           P   COPY public.proovedores (id, nombre, apellido, telefono, direccion) FROM stdin;
    public          postgres    false    204   zP       V          0    74409    usuarios 
   TABLE DATA           a   COPY public.usuarios (cedula, nombre, apellido, correo, password, cargo, permission) FROM stdin;
    public          postgres    false    202   ?P       p           0    0    acta_entrada_id_proovedor_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.acta_entrada_id_proovedor_seq', 1, false);
          public          postgres    false    207            q           0    0    categorias_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categorias_id_seq', 6, true);
          public          postgres    false    209            r           0    0 &   materiales_categorias_id_categoria_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.materiales_categorias_id_categoria_seq', 1, false);
          public          postgres    false    211            s           0    0    materiales_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.materiales_id_seq', 1, false);
          public          postgres    false    206            t           0    0    proovedores_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.proovedores_id_seq', 4, true);
          public          postgres    false    203            ?
           2606    74546    acta_entrada acta_entrada_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.acta_entrada
    ADD CONSTRAINT acta_entrada_pkey PRIMARY KEY (codigo);
 H   ALTER TABLE ONLY public.acta_entrada DROP CONSTRAINT acta_entrada_pkey;
       public            postgres    false    208            ?
           2606    74534 4   acta_entrega_materiales acta_entrega_materiales_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.acta_entrega_materiales
    ADD CONSTRAINT acta_entrega_materiales_pkey PRIMARY KEY (numero_acta, orden_compra);
 ^   ALTER TABLE ONLY public.acta_entrega_materiales DROP CONSTRAINT acta_entrega_materiales_pkey;
       public            postgres    false    214    214            ?
           2606    74516    acta_entrega acta_entrega_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.acta_entrega
    ADD CONSTRAINT acta_entrega_pkey PRIMARY KEY (numero);
 H   ALTER TABLE ONLY public.acta_entrega DROP CONSTRAINT acta_entrega_pkey;
       public            postgres    false    213            ?
           2606    74482    categorias categorias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    210            ?
           2606    74627     instituciones instituciones_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.instituciones
    ADD CONSTRAINT instituciones_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.instituciones DROP CONSTRAINT instituciones_pkey;
       public            postgres    false    216            ?
           2606    74593    lideres lideres_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.lideres
    ADD CONSTRAINT lideres_pkey PRIMARY KEY (cedula);
 >   ALTER TABLE ONLY public.lideres DROP CONSTRAINT lideres_pkey;
       public            postgres    false    215            ?
           2606    74493 0   materiales_categorias materiales_categorias_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.materiales_categorias
    ADD CONSTRAINT materiales_categorias_pkey PRIMARY KEY (orden_compra, id_categoria);
 Z   ALTER TABLE ONLY public.materiales_categorias DROP CONSTRAINT materiales_categorias_pkey;
       public            postgres    false    212    212            ?
           2606    74435    materiales materiales_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_pkey PRIMARY KEY (orden_compra);
 D   ALTER TABLE ONLY public.materiales DROP CONSTRAINT materiales_pkey;
       public            postgres    false    205            ?
           2606    74427    proovedores proovedores_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.proovedores
    ADD CONSTRAINT proovedores_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.proovedores DROP CONSTRAINT proovedores_pkey;
       public            postgres    false    204            ?
           2606    74416    usuarios usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (cedula);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    202            ?
           2606    74559 !   materiales FK_codigo_acta_entrega    FK CONSTRAINT     ?   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT "FK_codigo_acta_entrega" FOREIGN KEY (codigo_acta_entrada) REFERENCES public.acta_entrada(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY public.materiales DROP CONSTRAINT "FK_codigo_acta_entrega";
       public          postgres    false    208    205    2753            ?
           2606    74599    acta_entrega Fk_cedula_lider    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acta_entrega
    ADD CONSTRAINT "Fk_cedula_lider" FOREIGN KEY (cedula_lider) REFERENCES public.lideres(cedula) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 H   ALTER TABLE ONLY public.acta_entrega DROP CONSTRAINT "Fk_cedula_lider";
       public          postgres    false    2763    213    215            ?
           2606    74517    acta_entrega Fk_cedula_usuario    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acta_entrega
    ADD CONSTRAINT "Fk_cedula_usuario" FOREIGN KEY (cedula_usuario) REFERENCES public.usuarios(cedula) ON UPDATE RESTRICT ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public.acta_entrega DROP CONSTRAINT "Fk_cedula_usuario";
       public          postgres    false    202    213    2747            ?
           2606    74462    acta_entrada Fk_di_proovedor    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acta_entrada
    ADD CONSTRAINT "Fk_di_proovedor" FOREIGN KEY (id_proovedor) REFERENCES public.proovedores(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 H   ALTER TABLE ONLY public.acta_entrada DROP CONSTRAINT "Fk_di_proovedor";
       public          postgres    false    208    204    2749            ?
           2606    74501 %   materiales_categorias Fk_id_categoria    FK CONSTRAINT     ?   ALTER TABLE ONLY public.materiales_categorias
    ADD CONSTRAINT "Fk_id_categoria" FOREIGN KEY (id_categoria) REFERENCES public.categorias(id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 Q   ALTER TABLE ONLY public.materiales_categorias DROP CONSTRAINT "Fk_id_categoria";
       public          postgres    false    2755    212    210            ?
           2606    74628    lideres Fk_id_instituciones    FK CONSTRAINT     ?   ALTER TABLE ONLY public.lideres
    ADD CONSTRAINT "Fk_id_instituciones" FOREIGN KEY (id_institucion) REFERENCES public.instituciones(id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 G   ALTER TABLE ONLY public.lideres DROP CONSTRAINT "Fk_id_instituciones";
       public          postgres    false    215    2765    216            ?
           2606    74446    materiales Fk_id_proovedor    FK CONSTRAINT     ?   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT "Fk_id_proovedor" FOREIGN KEY (id_proovedor) REFERENCES public.proovedores(id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 F   ALTER TABLE ONLY public.materiales DROP CONSTRAINT "Fk_id_proovedor";
       public          postgres    false    205    204    2749            ?
           2606    74535 &   acta_entrega_materiales Fk_numero_acta    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acta_entrega_materiales
    ADD CONSTRAINT "Fk_numero_acta" FOREIGN KEY (numero_acta) REFERENCES public.acta_entrega(numero) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.acta_entrega_materiales DROP CONSTRAINT "Fk_numero_acta";
       public          postgres    false    2759    213    214            ?
           2606    74496 %   materiales_categorias Fk_orden_compra    FK CONSTRAINT     ?   ALTER TABLE ONLY public.materiales_categorias
    ADD CONSTRAINT "Fk_orden_compra" FOREIGN KEY (orden_compra) REFERENCES public.materiales(orden_compra) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 Q   ALTER TABLE ONLY public.materiales_categorias DROP CONSTRAINT "Fk_orden_compra";
       public          postgres    false    212    205    2751            ?
           2606    74540 '   acta_entrega_materiales Fk_orden_compra    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acta_entrega_materiales
    ADD CONSTRAINT "Fk_orden_compra" FOREIGN KEY (orden_compra) REFERENCES public.materiales(orden_compra) ON UPDATE RESTRICT ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.acta_entrega_materiales DROP CONSTRAINT "Fk_orden_compra";
       public          postgres    false    205    2751    214            \      x?????? ? ?      a      x?????? ? ?      b      x?????? ? ?      ^      x?????? ? ?      d      x?????? ? ?      c      x?????? ? ?      Y      x?????? ? ?      `      x?????? ? ?      X      x?????? ? ?      V      x?????? ? ?     