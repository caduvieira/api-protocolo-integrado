API - Protocolo Integrado
**************************

.. image:: https://coveralls.io/repos/github/caduvieira/api-protocolo-integrado/badge.svg?branch=master
:target: https://coveralls.io/github/caduvieira/api-protocolo-integrado?branch=master


Para executar localmente:

.. code-block:: console

   $ ./gradlew assemble
   $ docker-compose -f docker/docker-compose.yml up -d

Em seguida acesse http://localhost:8080/busca?q=serv&pagina=2

Onde **q** é a query a ser pesquisada e a **pagina** é a paginação do resultado.
