create table clientes(
	id serial not null,
	nomecompleto varchar(120) not null,
	cpf varchar(11) not null,
	datanascimento timestamp not null,
	email varchar(120),
	primary key(id),
	constraint uq_clientes_cpf unique (cpf)
);

create table dividas(
	id serial not null,
	clienteid integer not null,
	valor numeric(10,2) not null,
	paga boolean not null default false,
	datacriacao timestamp not null,
	datapagamento timestamp,
	primary key(id),
	constraint fk_divida_cliente
		foreign key (clienteid)
		references clientes(id)
);

create unique index ux_dividas_clienteid_aberta
	on dividas(clienteid)
	where paga = false;