CREATE DATABASE Final_JheysonGarcia
use Final_JheysonGarcia

create table DepartamentoJG
(
Cod_Departamento int NOT NULL,
Cod_Edificio int NOT NULL,
Area_Total_Departamento int NOT NULL,
Area_Construida_Departamento int NOT NULL,
Num_Ambientes_Departamento int NOT NULL,
Piso_Departamento int NOT NULL,
Precio_Alquiler int NOT NULL,
Cod_Estado int NOT NULL
)

create table EdificiosJG
(
Cod_Edificio int NOT NULL,
Nom_Edificio varchar(20) NOT NULL,
Direc_Edificio varchar(30) NOT NULL,
Cod_Post_Edificio int NOT NULL,
Area_Total_Edificio int NOT NULL,
Area_Contruida_Edificio int NOT NULL,
Referencia_Edificio varchar(20) NOT NULL,
Cod_Estado int NOT NULL
)

create table UsuarioJG
(
Cod_Usuario int NOT NULL,
Nom_Usuario varchar(40) NOT NULL,
Apellido_Padre_Usuario varchar(20) NOT NULL,
Apellido_Madre_Usuario varchar(20) NOT NULL,
Fecha_Nacimiento_Usuario date NOT NULL,
Fecha_Registro_Usuario date NOT NULL,
Tipo_Documento_Usuario varchar(10) NOT NULL,
Nume_Documento int NOT NULL,
Cod_Estado int NOT NULL
)

create table PropietarioJG
(
Cod_Usuario int NOT NULL,
Tipo_Propiedad varchar(20) NOT NULL,
Telefono_Prop int NOT NULL
)

create table FamiliaresJG
(
Cod_Familia int NOT NULL,
Cod_Usuario int NOT NULL,
Nombre_Familia varchar(40) NOT NULL,
Apellido_Padre_Familia varchar(20) NOT NULL,
Apellido_Madre_Familia varchar(20) NOT NULL,
Grado_Parentes char(6),
)

create table InquilinoJG
(
Cod_Usuario int NOT NULL,
Nom_Aval_Inquilino varchar(40) NOT NULL,
Apell_Aval_Inquilino varchar(40) NOT NULL,
Haber_Bas_Inquilino varchar(20) NOT NULL,
Estado_Civil_Inquilino char(10) NOT NULL,
Lugar_Tabajo_Inquilino varchar(40) NOT NULL
)

create table EstadoJG
(
Cod_Estado int NOT NULL,
Desc_Estado int NOT NULL
)

create table ContratoJG
(
Cod_Contrato int NOT NULL,
Propietario_Cod_Usuario int NOT NULL,
Inquilino_Cod_Usuario int NOT NULL,
Fecha_Firma date NOT NULL,
Referencia	varchar(40) NOT NULL,
Cod_Estado int NOT NULL,
Cod_Contrato_Original int NOT NULL
)

create table DetalleContratoJG
(
Cod_Departamento int NOT NULL,
Cod_Contrato int NOT NULL,
Fecha_Inicio_Alquiler date,
Fecha_Fin_Alquiler date
)

--Claves Primarias --
alter table DepartamentoJG
add primary key (Cod_Departamento)

alter table EdificiosJG
add primary key (Cod_Edificio)

alter table UsuarioJG
add primary key (Cod_Usuario)

alter table PropietarioJG
add primary key (Cod_Usuario)

alter table FamiliaresJG
add primary key (Cod_Familia)

alter table InquilinoJG
add primary key (Cod_Usuario)

alter table EstadoJG
add primary key (Cod_Estado)

alter table ContratoJG
add primary key (Cod_Contrato)

-- Claves foraneas --

alter table PropietarioJG
add foreign key (Cod_Usuario)
references UsuarioJG (Cod_Usuario)

alter table InquilinoJG
add foreign key (Cod_Usuario)
references UsuarioJG (Cod_Usuario)

alter table FamiliaresJG
add foreign key (Cod_Usuario)
references InquilinoJG (Cod_Usuario)

alter table DetalleContratoJG
add foreign key (Cod_Departamento)
references DepartamentoJG (Cod_Departamento)

alter table ContratoJG
add foreign key (Cod_Contrato)
references ContratoJG (Cod_Contrato)

alter table UsuarioJG
add foreign key (Cod_Estado)
references EstadoJG (Cod_Estado)

alter table ContratoJG
add foreign key (Cod_Estado)
references EstadoJG (Cod_Estado)

alter table DetalleContratoJG
add foreign key (Cod_Contrato)
references ContratoJG (Cod_Contrato)

alter table DepartamentoJG
add foreign key (Cod_Edificio)
references EdificiosJG (Cod_Edificio)

alter table EdificiosJG
add foreign key (Cod_Estado)
references EstadoJG (Cod_Estado)

alter table ContratoJG
add foreign key (Propietario_Cod_Usuario)
references PropietarioJG (Cod_Usuario)

alter table ContratoJG
add foreign key (Inquilino_Cod_Usuario)
references InquilinoJG (Cod_Usuario)

alter table DepartamentoJG
add foreign key (Cod_Estado)
references EstadoJG (Cod_Estado)