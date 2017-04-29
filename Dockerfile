FROM ruby:2.3-slim

#Atualiza OS container e atualiza as nossas dependências
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev

#Seta PATH do container
ENV INSTALL_PATH /usr/src/app

#Cria diretório no container
RUN mkdir -p $INSTALL_PATH

#Seta PATH como diretório princial e de inicialização
WORKDIR $INSTALL_PATH

#Copia o Gemfile para dentro do container
COPY Gemfile ./

#Instala as Gems listadas no Gemfile
RUN bundle install

#Copia arquivos do projeto para pasta do container
COPY . .

#Inicializa e roda o servidor -> [plataforma, comando_a_executar, parametro, endereco_ip]
CMD ["rails","server","-b","0.0.0.0"]