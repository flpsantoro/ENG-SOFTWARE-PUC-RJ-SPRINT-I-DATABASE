Banco de Dados para Armazenamento de Dados de Bioimpedância
Este projeto consiste em um banco de dados para armazenamento de dados de balança de bioimpedância. Foi utilizado o sistema gerenciador de banco de dados (SGBD) PostgreSQL como camada de persistência para consumo na API.

Instruções de Uso
Para iniciar o PostgreSQL via Docker, é necessário ter o Docker instalado. Em seguida, basta executar o seguinte comando no terminal:

./deploy_database.sh

Caso opte por não utilizar o Docker, é possível baixar o PostgreSQL no site oficial e seguir as instruções de instalação:

https://www.postgresql.org/download/

O Arquivo create.sql contem o script nescessário para a criação das tabelas: 
"tb_dados_cadastro" para armazenar as informações do usuário
"tb_dados_medidos" para armazenar as informações obtidas pela balança, essa tabela se relaciona com a tabela de usuário pela coluna "dados_cadastro_id"