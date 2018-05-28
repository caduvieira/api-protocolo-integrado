API - Protocolo Integrado
**************************

Para executar:

.. code-block:: console

   $ docker-compose -f docker/docker-compose.yml up -d
   $ ./gradlew clean bootRun

Em seguida acesse http://localhost:8080/busca?q=serv&pagina=2

Onde **q** é a query a ser pesquisada e a **pagina** é a paginação do resultado.
