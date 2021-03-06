PGDMP     %                    y            sessons_music_db    13.2    13.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16395    sessons_music_db    DATABASE     [   CREATE DATABASE sessons_music_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
     DROP DATABASE sessons_music_db;
                postgres    false            �            1259    16406    lessons    TABLE     �   CREATE TABLE public.lessons (
    id_lesson integer NOT NULL,
    title character varying(200),
    description character varying(2000)
);
    DROP TABLE public.lessons;
       public         heap    postgres    false            �            1259    16443    lessons_id_lesson_seq    SEQUENCE     �   ALTER TABLE public.lessons ALTER COLUMN id_lesson ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lessons_id_lesson_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999
    CACHE 1
);
            public          postgres    false    202            �            1259    16401    lessons_users    TABLE     �   CREATE TABLE public.lessons_users (
    id_lesson_user integer NOT NULL,
    id_user integer,
    id_lesson integer,
    state integer
);
 !   DROP TABLE public.lessons_users;
       public         heap    postgres    false            �            1259    16441     lessons_users_id_lesson_user_seq    SEQUENCE     �   ALTER TABLE public.lessons_users ALTER COLUMN id_lesson_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lessons_users_id_lesson_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999
    CACHE 1
);
            public          postgres    false    201            �            1259    16414    notes    TABLE     t   CREATE TABLE public.notes (
    id_note integer NOT NULL,
    id_lesson_user integer,
    note character varying
);
    DROP TABLE public.notes;
       public         heap    postgres    false            �            1259    16437    notes_id_note_seq    SEQUENCE     �   ALTER TABLE public.notes ALTER COLUMN id_note ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.notes_id_note_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999
    CACHE 1
);
            public          postgres    false    203            �            1259    16396    users    TABLE     �   CREATE TABLE public.users (
    email character varying(100),
    id_user integer NOT NULL,
    password character varying(200)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16445    users_id_user_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999
    CACHE 1
);
            public          postgres    false    200            �          0    16406    lessons 
   TABLE DATA           @   COPY public.lessons (id_lesson, title, description) FROM stdin;
    public          postgres    false    202   �       �          0    16401    lessons_users 
   TABLE DATA           R   COPY public.lessons_users (id_lesson_user, id_user, id_lesson, state) FROM stdin;
    public          postgres    false    201   �        �          0    16414    notes 
   TABLE DATA           >   COPY public.notes (id_note, id_lesson_user, note) FROM stdin;
    public          postgres    false    203   �        �          0    16396    users 
   TABLE DATA           9   COPY public.users (email, id_user, password) FROM stdin;
    public          postgres    false    200   9!       �           0    0    lessons_id_lesson_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.lessons_id_lesson_seq', 1, false);
          public          postgres    false    206            �           0    0     lessons_users_id_lesson_user_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.lessons_users_id_lesson_user_seq', 1, false);
          public          postgres    false    205            �           0    0    notes_id_note_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.notes_id_note_seq', 4, true);
          public          postgres    false    204            �           0    0    users_id_user_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_id_user_seq', 1, false);
          public          postgres    false    207            D           2606    16405    lessons_users lessonsUsers_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.lessons_users
    ADD CONSTRAINT "lessonsUsers_pkey" PRIMARY KEY (id_lesson_user);
 K   ALTER TABLE ONLY public.lessons_users DROP CONSTRAINT "lessonsUsers_pkey";
       public            postgres    false    201            F           2606    16413    lessons lessons_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id_lesson);
 >   ALTER TABLE ONLY public.lessons DROP CONSTRAINT lessons_pkey;
       public            postgres    false    202            H           2606    16440    notes notes_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id_note);
 :   ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
       public            postgres    false    203            B           2606    16400    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    200            I           2606    16427    lessons_users ID_LESSON_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.lessons_users
    ADD CONSTRAINT "ID_LESSON_FK" FOREIGN KEY (id_lesson) REFERENCES public.lessons(id_lesson) NOT VALID;
 F   ALTER TABLE ONLY public.lessons_users DROP CONSTRAINT "ID_LESSON_FK";
       public          postgres    false    3142    202    201            K           2606    16422    notes ID_LESSON_USER_NOTE    FK CONSTRAINT     �   ALTER TABLE ONLY public.notes
    ADD CONSTRAINT "ID_LESSON_USER_NOTE" FOREIGN KEY (id_lesson_user) REFERENCES public.lessons_users(id_lesson_user) NOT VALID;
 E   ALTER TABLE ONLY public.notes DROP CONSTRAINT "ID_LESSON_USER_NOTE";
       public          postgres    false    3140    203    201            J           2606    16432    lessons_users ID_USER_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.lessons_users
    ADD CONSTRAINT "ID_USER_FK" FOREIGN KEY (id_user) REFERENCES public.users(id_user) NOT VALID;
 D   ALTER TABLE ONLY public.lessons_users DROP CONSTRAINT "ID_USER_FK";
       public          postgres    false    3138    201    200            �   �  x��T�nA}n�����V�$�P�<���fG��T3�Y��9���V" x�!ʎ�c���{n�=�����J/�{n�H%R�Ȼ]_��ε4���4��^h�s�\8��"t�E<��.1��!�@.�P�(��*SA0x{w�����ϒi�O�q&W��'��c-�����x��'r�wN9����#��/ڢ�ʔ��s�p�&��k����HʔU�;�o<;p��X�Ji{
3�l�L�%����n�[Y�����sIN��l�����۳��+~D:C��A;=r.�ֳS�Ȍ��{�I$l��$c�Z���P�A�K1y���n/T��lz㒊Xak��p�J�3���F�CJG�p��wqI�-!�!ك��s�����u�R��!Y �M�� aJM��"9r��.��<��6��ze�`����}���T��(��R`~qϴ�Q
�7Ft%ޱUz`Ȉ�� �)Ȳ6n��kt�㐭".��&hh}�oc[hy�g�)h�9��$�<�x�y�%o��-�_~��<g>�=e%n`��ˣ������Gt�Z.�n�)��m�ɖ`p�1� I�JMKU��75}u��3�F�x���G�l&*����j�k���q�uSo���� P������?��,��{�J���+��u� -�!"���o0�ߩ$�mP�'zEV�b�z�X|6�V      �      x�3�4�4�4�2�Ac�=... S�      �   l   x�E�1�0�9z_ E�ѥ{�Q�d�v�~�O�ǪNY�#�e[�S�{�=�hCg.�SdWՆ�//l��R���`ژ�|?s��g�|���#(�*"?��(Q      �   [   x�K.�,vH�M���K���4�T1JR1�P�NtJ2t6�(�t�5-�0I+.�43��N�p�t�O)*vʨt4(tӯ4�*II��7����� F[f     