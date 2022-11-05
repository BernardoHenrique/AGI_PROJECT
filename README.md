# Introdução
- O projeto apresentado neste relatório foi desenvolvido no âmbito da cadeira deAdministração e Gestão de Infraestruturas e Serviços de IT, cadeira do Mestrado Bolonha em Engenharia Informática e de Computadores do Instituto Superior Técnico.

- Este projeto tem como objetivo demonstrar os conhecimentos adquiridos na cadeira para fazer o deploy de uma aplicação na internet.

- Para o desenvolvimento deste projeto, temos que dar deploy a uma aplicação web em camadas (frontend/backend) baseada em micro-serviços na cloud pública Para tal, devem ser usadas ferramentas de automatização tais como, terraform, plumi, ansible, etc. Este projeto também requer a implementação de um serviço de monitorização da solução principal, usando as ferramentas Prometheus, Grafana, Fluentd, etc. No resto do relatório iremos apresentar os passos da nossa solução.

# Metodologia (Design / Arquitetura)

A arquitetura do projeto consiste nos 4 principais serviços:
● Frontend: Fornece uma interface ao utilizador;
● Backend: Fornece as funcionalidades desejadas;
● Data Storage: Guarda dados persistentes;
● Monitoring Server: Oferece informação sobre o sistema. (falta meter o
prometheus no chart)

# Componentes

Para o desenvolvimento do projeto usamos as seguintes ferramentas:
● GitHub
● Google Cloud
● Terraform
● Prometheus

# Procedimento
- Dentro do projeto ir à pasta microservices-demo e depois à pasta terraform
(cd terraform). Abrir o ficheiro terraform.tfvars num editor de texto à sua escolha e mudar as variáveis gcp_project_id e region para o id do projeto que criou na google cloud e a sua região
(https://cloud.google.com/about/locations), respetivamente.
