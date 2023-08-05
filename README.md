### **Instruções para rodar o projeto laravel:**

    - Iniciar o container:  docker-compose up -d 
    - Entrar dentro do container APP: docker-compose exec app bash
    - Baixar as dependências do composer: composer install
    - Criar as tabelas: php artisan migrate

**Caminhos da api**

    [GET]  localhost/api/getQuantity - Obter a quantidade 
    [POST] localhost/api/remove      - Remover uma caneca 
    [POST] localhost/api/add         - Adicionar uma caneca 

**OBS:**
Tentei deixar com que as dependências do composer fossem instaladas automaticamente, porém muitas das vezes gerou erros e acabei não conseguindo. Por isso, para garantir que funcionasse deixei para que fossem instaladas de forma manual.



### **Instruções para Rodar o Aplicativo**

    - Obter as dependências (PUB GET)
    - Configurar na classe 'Mug.dart' o IP do servidor.

**OBS:**
O aplicativo foi configurado para atualizar os dados a cada 30 segundos.



### **OBSERVAÇÕES GERAIS**
* Optei por deixar todos os arquivos do Laravel, e não apagar nenhum. Acredito que muitos arquivos (Principalmente os relacionados ao Front end) não serão usados por se tratar de uma API. No entanto, optei por deixá-los, até ter mais conhecimento sobre o framework e entender para o que determinados arquivos servem.
* Foi meu primeiro contato com o Laravel, e o achei muito promissor. Achei ele muito simples para criar um simples CRUD, algo que demoraria algum tempo para se fazer no PHP puro, fiz em bem menos tempo com o mesmo. A organização de Views, Models e Controllers também achei muito interessante. Ainda preciso estudar mais sobre, pois são muitos arquivos dentro do projeto e entender a função de cada um pode levar um tempo, mas achei realmente bem interessante (As rotas, conexão com banco, separação do MVC, etc).

* Em relação ao aplicativo, até pensei em separá-lo numa arquitetura MVC, porém por não ter muitas regras de negócio achei que poderia ser algo inviável e até redundante (Pois não teria o que colocar na camada de controler). Por isso, optei por criar apenas um Model onde é feita a conexão com a API.
* Tentar ver a possibilidade de criar um listener que ficasse escutando quando alguma mudança no banco de dados, porém acho que não teria uma maneira muito simples de se fazer e seria algo inviável. Por esse motivo, optei em deixar um contador para que atualize os dados a cada 30 segundos.


