# Introdução
- O projeto apresentado neste relatório foi desenvolvido no âmbito da cadeira deAdministração e Gestão de Infraestruturas e Serviços de IT, cadeira do Mestrado Bolonha em Engenharia Informática e de Computadores do Instituto Superior Técnico.

- Este projeto tem como objetivo demonstrar os conhecimentos adquiridos na cadeira para fazer o deploy de uma aplicação na internet.

- Para o desenvolvimento deste projeto, temos que dar deploy a uma aplicação web em camadas (frontend/backend) baseada em micro-serviços na cloud pública Para tal, devem ser usadas ferramentas de automatização tais como, terraform, plumi, ansible, etc. Este projeto também requer a implementação de um serviço de monitorização da solução principal, usando as ferramentas Prometheus, Grafana, Fluentd, etc. No resto do relatório iremos apresentar os passos da nossa solução.

# Metodologia (Design / Arquitetura)

A arquitetura do projeto consiste nos 4 principais serviços:
● Frontend: Fornece uma interface ao utilizador;
● Backend: Fornece as funcionalidades desejadas;
● Data Storage: Guarda dados persistentes;
● Monitoring Server: Oferece informação sobre o sistema. 

# Componentes

Para o desenvolvimento do projeto usamos as seguintes ferramentas:
● GitHub
● Google Cloud
● Terraform
● Prometheus

# Procedimento
- Dentro do projeto ir à pasta terraform (cd terraform). Abrir o ficheiro terraform.tfvars num editor de texto à sua escolha e mudar as variáveis gcp_project_id e region para o id do projeto que criou na google cloud e a sua região (https://cloud.google.com/about/locations), respetivamente.
- Dentro do projeto, ir à pasta terraform (cd microservices-demo/terraform) e de seguida executar os seguintes comandos:
    1. terraform init
    2. terraform apply
- Gerar dados do prometheus e grafana e aceder ao site.
    1. “helmfile -f monitoring-helmfile.yaml sync” no monitoring setup;
    2. Correr os comandos “kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n prometheus 9090:9090” e aceder ao endereço localhost:9090 e “kubectl port-forward svc/prometheus-grafana 3000:80 -n prometheus” e aceder ao endereço localhost:3000 para expor o prometheus e grafana.
    3. Para obter o ip para aceder ao site da boutique
    ´´´
    kubectl get svc -n boutique
    ´´´
    O ip para lançar a boutique é o external ip do frontend



